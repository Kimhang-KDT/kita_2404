from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, DateField, SubmitField, BooleanField, PasswordField, SelectField, HiddenField
from wtforms.validators import DataRequired, Length, EqualTo

class SearchForm(FlaskForm):
  genre_id = HiddenField('Genre ID', validators=[DataRequired()])
  keywords = StringField('Keywords')
  submit = SubmitField('Search')

class ResultForm(FlaskForm):
  genre_id = HiddenField('Genre ID', validators=[DataRequired()])
  genre_name = HiddenField('Genre Name', validators=[DataRequired()])
  keywords = StringField('Keywords')
  submit = SubmitField('Submit')

class LoginForm(FlaskForm):
  customername = StringField('Customer Name', validators=[DataRequired()])
  password = PasswordField('Password', validators=[DataRequired()])
  submit = SubmitField('Login')

class RegistrationForm(FlaskForm):
  customername = StringField('Customer Name', validators=[DataRequired(), Length(min=2, max=80)])
  password = PasswordField('Password', validators=[DataRequired(), Length(min=6)])
  confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password')])
  is_admin = BooleanField('Is Admin')
  submit = SubmitField('Register')