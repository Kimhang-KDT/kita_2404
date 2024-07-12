from flask import Flask, render_template, request, jsonify, redirect, url_for, flash, session
from flask_wtf.csrf import CSRFProtect
from flask_migrate import Migrate
from models import db, Keyword, Novels, Genre, Customer
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps
from form import LoginForm, RegistrationForm, SearchForm, ResultForm
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
  try:
    if "customer_id" not in session:
      return redirect(url_for('login'))
    novels = Novels.query.all()
    return render_template('index.html', novels=novels)
  except Exception as e:
    logger.error(f'Error occurred: {e}')
    return str(e)

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
  return render_template('register.html', form=form)

@app.route('/login', methods=['GET', 'POST'])
def login():
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
  return render_template('login.html', form=form)

@app.route('/logout')
def logout():
  if "customer_id" not in session:
    return redirect(url_for('login'))

  session.clear()
  flash('You have been logged out.', 'success')
  return redirect(url_for('login'))

@app.route('/admin')
def admin():
  if "customer_id" not in session or not session.get("is_admin"):
    return redirect(url_for('login'))
  customer = Customer.query.all()
  return render_template('admin.html', customer=customer)

@app.route('/search', methods=['GET', 'POST'])
def search():
    if "customer_id" not in session:
        return redirect(url_for('login'))

    form = SearchForm()
    genres = Genre.query.all()  # 장르 데이터 가져오기

    if form.validate_on_submit():
        genre_id = form.genre_id.data
        genre_name = next((g.genre for g in genres if g.id == int(genre_id)), 'Unknown')
        keywords = request.form.getlist('keywords')
        return redirect(url_for('result', genre_id=genre_id, genre_name=genre_name, keywords=','.join(keywords)))

    return render_template('search.html', form=form, genres=genres)

@app.route('/get_keywords/<genre_id>', methods=['GET'])
def get_keywords(genre_id):
    keywords = Keyword.query.filter_by(genre_id=genre_id).all()
    keywords_list = [{'id': k.id, 'keyword': k.keyword} for k in keywords]
    return jsonify(keywords_list)

@app.route('/result', methods=['GET'])
def result():
    genre_id = request.args.get('genre_id')
    genre_name = request.args.get('genre_name')
    keywords = request.args.get('keywords').split(',')
    return render_template('result.html', genre_id=genre_id, genre_name=genre_name, keywords=keywords)

if __name__ == '__main__':
  app.run(debug=True, port=5001, use_reloader=False)
