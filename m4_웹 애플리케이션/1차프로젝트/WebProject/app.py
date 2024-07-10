from flask import Flask, render_template, request
from flask_wtf.csrf import CSRFProtect
from flask_migrate import Migrate
from models import db, Keyword, Novels
import logging
from sqlalchemy.orm import selectinload

app = Flask(__name__)
app.config.from_pyfile("config.py")

db.init_app(app)

migrate = Migrate(app, db)
csrf = CSRFProtect(app)

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@app.route('/')
def home():
  try:
    page = request.args.get('page', 1, type=int)
    per_page = 20  # 한 페이지에 표시할 항목 수
    novels = Novels.query.limit(per_page).offset((page - 1) * per_page).all()
    total_novels = Novels.query.count()
    total_pages = (total_novels // per_page) + (1 if total_novels % per_page > 0 else 0)

    logger.info(f'Number of novels: {len(novels)}')

    return render_template('index.html', novels=novels, page=page, total_pages=total_pages)
  except Exception as e:
    logger.error(f'Error occurred: {e}')
    return str(e)

if __name__ == '__main__':
  app.run(debug=True, port=5001, use_reloader=False)