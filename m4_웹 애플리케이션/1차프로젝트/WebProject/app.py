from flask import Flask, render_template
from flask_wtf.csrf import CSRFProtect
from flask_migrate import Migrate
from models import db

app = Flask(__name__)
app.config.from_pyfile("config.py")

#db.init_app(app)

#migrate = Migrate(app, db)
csrf = CSRFProtect(app)

@app.route('/')
def home():
  return render_template('index.html')

if __name__ == '__main__':
  app.run(debug=True, port=5001)