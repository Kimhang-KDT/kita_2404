import pandas as pd
from surprise import SVD, Dataset, Reader, accuracy
from surprise.dataset import DatasetAutoFolds

# CSV 파일 불러오기
def get_csv_data(file_path):
  data = pd.read_csv(file_path)

  return data

# DatasetAutoFolds 클래스 생성
def set_autofolds_trainset():
  reader = Reader(line_format='user item rating timestamp', sep=',', rating_scale=(0.5, 5.0))
  data_folds = DatasetAutoFolds(ratings_file='ml-latest-small\\ratings_noh.csv', reader=reader)

  return data_folds

# 전체 데이터를 학습 데이터로 생성
def build_trainset(data_folds):
  trainset = data_folds.build_full_trainset()
  algo = SVD(n_epochs=20, n_factors=50, random_state=0)
  algo.fit(trainset)

  return algo

# 유저가 보지 않은 영화 목록 생성
def get_unseen_surprise(ratings, movies, userId):
  seen_movies = ratings[ratings['userId'] == userId]['movieId'].tolist()
  total_movies = movies['movieId'].tolist()
  unseen_movies = [movie for movie in total_movies if movie not in seen_movies]

  return unseen_movies

# 영화 추천 함수
def recomm_movie_by_surprise(algo, userId, movies, unseen_movies):
    predictions = [algo.predict(str(userId), str(movieId)) for movieId in unseen_movies]

    def sortkey_est(pred):
        return pred.est

    predictions.sort(key=sortkey_est, reverse=True)
    top_predictions = predictions

    top_movie_ids = [int(pred.iid) for pred in top_predictions]
    top_movie_rating = [pred.est for pred in top_predictions]
    top_movie_titles = movies[movies.movieId.isin(top_movie_ids)]['title']

    top_movie_preds = [{'movie_id': id, 'title': title, 'rating': rating} 
                       for id, title, rating in zip(top_movie_ids, top_movie_titles, top_movie_rating)]

    return top_movie_preds

# 실행 함수
def recommend_movies_for_user(ratings, movies, userId):
   data_folds = set_autofolds_trainset()

   algo = build_trainset(data_folds)

   unseen_movies = get_unseen_surprise(ratings, movies, userId)

   top_movies = recomm_movie_by_surprise(algo, userId, movies, unseen_movies)

   return top_movies
