from flask import Flask, render_template, request, jsonify, redirect, url_for, flash, session
from flask_wtf.csrf import CSRFProtect
from flask_migrate import Migrate
from models import db, Keyword, Novels, Genre, Customer, Images
from werkzeug.security import generate_password_hash, check_password_hash
from form import LoginForm, RegistrationForm, SearchForm, ResultForm, DebutForm, NovelsForm
from utils import create_analysis_summary, get_keywords_10rank_by_genre, get_keywords_importance, get_top100_novels
import logging

app = Flask(__name__)
app.config.from_pyfile("config.py")

db.init_app(app)

migrate = Migrate(app, db)
csrf = CSRFProtect(app)

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# 첫 요청을 추적하기 위한 플래그
first_request = True

@app.before_request
def create_admin():
  global first_request
  if first_request:
    with app.app_context():
      if not Customer.query.filter_by(customername="admin").first():
        admin = Customer(customername="admin", is_admin=True)
        admin.password = generate_password_hash("admin", method='sha256')
        db.session.add(admin)
        db.session.commit()
    first_request = False

@app.route('/')
def home():
  page = request.args.get('page', 1, type=int)
  per_page = 18
  novels_data = get_top100_novels(page, per_page)
  
  start_page = max(1, page - 3)
  end_page = min(novels_data['pages'], page + 2)
  
  return render_template(
    'home.html', 
    novels=novels_data['novels'], 
    pages=novels_data['pages'], 
    current_page=novels_data['current_page'],
    start_page=start_page,
    end_page=end_page
  )

@app.route('/guide')
def guide():
  
  return render_template('guide.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
  form = RegistrationForm()
  if form.validate_on_submit():
    existing_customer = Customer.query.filter_by(customername=form.customername.data).first()
    if existing_customer:
      flash("Customername already exists. Please choose a different customername.", "danger")
      return render_template("register.html", form=form)
    hashed_password = generate_password_hash(form.password.data, method='scrypt')
    new_customer = Customer(customername=form.customername.data, password=hashed_password, is_admin=form.is_admin.data)
    db.session.add(new_customer)
    db.session.commit()
    flash('Registration successful. You can now log in.', 'success')
    return redirect(url_for('login'))
  return render_template('auth/register.html', form=form)

@app.route('/login', methods=['GET', 'POST'])
def login():
  if "customer_id" in session:
    return redirect(url_for('home'))

  form = LoginForm()
  if form.validate_on_submit():
    customer = Customer.query.filter_by(customername=form.customername.data).first()
    if customer and check_password_hash(customer.password, form.password.data):
      session['customer_id'] = customer.id
      session['customername'] = customer.customername
      session['is_admin'] = customer.is_admin
      flash('Login successful.', 'success')
      return redirect(url_for('home'))
    flash("Invalid customername or password.", 'danger')
  return render_template('auth/login.html', form=form)

@app.route('/logout')
def logout():
  if "customer_id" not in session:
    return redirect(url_for('login'))

  session.clear()
  flash('You have been logged out.', 'success')
  return redirect(url_for('login'))

#@app.route('/admin')
#def admin():
#  if "customer_id" not in session or not session.get("is_admin"):
#    return redirect(url_for('login'))
#  customer = Customer.query.all()
#  return render_template('admin.html', customer=customer)

@app.route('/entire')
def entire():
  try:
    if "customer_id" not in session:
      return redirect(url_for('login'))
    novels = Novels.query.all()
    return render_template('entire.html', novels=novels)
  except Exception as e:
    logger.error(f'Error occurred: {e}')
    return str(e)
  
@app.route('/debut', methods=['GET', 'POST'])
def debut():
  if "customer_id" not in session:
    return redirect(url_for('login'))
  
  form = DebutForm()
  genres = Genre.query.all()

  if form.validate_on_submit():
    genre_id = form.genre_id.data
    genre_name = next((g.genre for g in genres if g.id == int(genre_id)), 'Unknown')
    keywords = request.form.getlist('keywords')
    return redirect(url_for('debut_analysis', genre_id=genre_id, genre_name=genre_name, keywords=','.join(keywords)))

  return render_template('debuts/debut.html', form=form, genres=genres)
  
@app.route('/debut/analysis', methods=['GET', 'POST'])
def debut_analysis():
  if "customer_id" not in session:
      return redirect(url_for('login'))

  form = NovelsForm()

  if form.validate_on_submit():
    novel_ids = form.novel_ids.data
    genre_id = form.genre_id.data
    genre_name = form.genre_name.data
    keywords = form.keywords.data
    
    return redirect(url_for('debuts/debut_direction', novel_ids=novel_ids, genre_name=genre_name, genre_id=genre_id, keywords=keywords))

  genre_id = request.form.get('genre_id')
  genre_name = request.form.get('genre_name')
  keywords = request.form.get('keywords')

  user_data = {'genre_id': genre_id, 'genre_name': genre_name, 'keywords': keywords}

  novels = Novels.query.filter(
    Novels.genre_id == genre_id,
    *[Novels.keywords.contains(keyword) for keyword in keywords]
  ).all()

  filtered_novels = [novel for novel in novels if (novel.viewCount + novel.reviewCount) / 2 > 1000000]

  for novel in filtered_novels:
    image = Images.query.filter_by(novel_id=novel.id).first()
    novel.src = image.src if image else None

  keywords_rank = get_keywords_10rank_by_genre(genre_id, keywords)
  keywords_importance = get_keywords_importance(genre_id, keywords) or []

  form.novel_ids.data = ','.join([str(novel.id) for novel in filtered_novels])

  data = {'novels': filtered_novels, 'keywords_rank': keywords_rank, 'keywords_importance': keywords_importance, 'user_data': user_data}

  return render_template('debuts/debut_analysis.html', form=form, data=data)
  
@app.route('/debut/direction')
def debut_direction():
  if "customer_id" not in session:
    return redirect(url_for('login'))
  
  novel_ids = request.form.get('novel_ids')
  genre_id = request.form.get('genre_id')
  keywords = request.form.get('keywords')
  genre_name = request.form.get('genre_name')
  if novel_ids:
    novel_ids = novel_ids.split(',')
  
  analysis_summary = create_analysis_summary(novel_ids, keywords)
  keywords_importance = get_keywords_importance(genre_id, keywords)

  return render_template('debuts/debut_direction.html', keywords_importance=keywords_importance, keywords=keywords, genre_name=genre_name, analysis_summary=analysis_summary)
  
@app.route('/publishers', methods=['GET', 'POST'])
def publishers():
  if "customer_id" not in session:
    return redirect(url_for('auth/login'))
  
  return render_template('publishers.html')

@app.route('/publishers/analysis', methods=['GET', 'POST'])
def publisher_analysis():
  if "customer_id" not in session:
    return redirect(url_for('login'))
  
  return render_template('analysis/publishers_analysis.html')
  
@app.route('/million_analysis')
def million_analysis():
  if "customer_id" not in session:
    return redirect(url_for('login'))
  
  return render_template('analysis/million_analysis.html')
  
@app.route('/genre_analysis/<genre_id>')
def genre_analysis():
  if "customer_id" not in session:
    return redirect(url_for('login'))

  return render_template('analysis/genre_analysis.html')

@app.route('/community')
def community():
  
  return render_template('community.html')

@app.route('/notices')
def notices():
  
  return render_template('notices.html')

@app.route('/search', methods=['GET', 'POST'])
def search():
  if "customer_id" not in session:
    return redirect(url_for('login'))

  form = SearchForm()
  genres = Genre.query.all()

  if form.validate_on_submit():
    genre_id = form.genre_id.data
    genre_name = next((g.genre for g in genres if g.id == int(genre_id)), 'Unknown')
    keywords = request.form.getlist('keywords')
    return redirect(url_for('result', genre_id=genre_id, genre_name=genre_name, keywords=','.join(keywords)))

  return render_template('search.html', form=form, genres=genres)

@app.route('/get_keywords/<genre_id>', methods=['GET'])
def get_keywords(genre_id):
  if "customer_id" not in session:
    return redirect(url_for('login'))
  
  keywords = Keyword.query.filter_by(genre_id=genre_id).all()
  keywords_list = [{'id': k.id, 'keyword': k.keyword} for k in keywords]
  return jsonify(keywords_list)

@app.route('/result', methods=['POST'])
def result():
  if "customer_id" not in session:
    return redirect(url_for('login'))

  form = ResultForm()

  if form.validate_on_submit():
    novel_ids = form.novel_ids.data
    genre_id = form.genre_id.data
    genre_name = form.genre_name.data
    keywords = form.keywords.data
    
    return redirect(url_for('detail', novel_ids=novel_ids, genre_name=genre_name, genre_id=genre_id, keywords=keywords))

  genre_id = request.form.get('genre_id')
  genre_name = request.form.get('genre_name')
  keywords = request.form.get('keywords')
  if keywords:
    keywords = keywords.split(',')

  novels = Novels.query.filter(
    Novels.genre_id == genre_id,
    *[Novels.keywords.contains(keyword) for keyword in keywords]
  ).all()

  for novel in novels:
    image = Images.query.filter_by(novel_id=novel.id).first()
    novel.src = image.src if image else None

  keywords_importance = get_keywords_importance(genre_id, keywords)

  form.novel_ids.data = ','.join([str(novel.id) for novel in novels])

  data = {'novels':novels, 'keywords_importance':keywords_importance}

  return render_template('result.html', form=form, data=data)

@app.context_processor
def utility_processor():
  return dict(enumerate=enumerate)

@app.route('/detail', methods=['POST'])
def detail():
  if "customer_id" not in session:
    return redirect(url_for('login'))

  novel_ids = request.form.get('novel_ids')
  genre_id = request.form.get('genre_id')
  keywords = request.form.get('keywords')
  genre_name = request.form.get('genre_name')
  if novel_ids:
    novel_ids = novel_ids.split(',')
  
  analysis_summary = create_analysis_summary(novel_ids, keywords)
  keywords_importance = get_keywords_importance(genre_id, keywords)

  return render_template('detail.html', keywords_importance=keywords_importance, keywords=keywords, genre_name=genre_name, analysis_summary=analysis_summary)

if __name__ == '__main__':
  app.run(debug=True, port=5001, use_reloader=False)
