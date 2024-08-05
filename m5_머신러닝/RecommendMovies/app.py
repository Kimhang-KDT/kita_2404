from flask import Flask, render_template, request
from utils import *

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/recommend', methods=['POST'])
def recommend():
    userId = request.form['user_id']
    ratings_path = 'ml-latest-small\\ratings.csv'
    movies_path = 'ml-latest-small\movies.csv'

    ratings = get_csv_data(ratings_path)
    movies = get_csv_data(movies_path)

    top_movies = recommend_movies_for_user(ratings, movies, int(userId))

    return render_template('recommend.html', top_movies=top_movies[:10])

if __name__ == '__main__':
    app.run(debug=True)
