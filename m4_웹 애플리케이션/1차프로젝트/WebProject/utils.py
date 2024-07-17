from models import Novels
import pandas as pd
from collections import Counter
from flask import jsonify
from models import db, Novels, Images
from sqlalchemy import desc

# 선택된 그룹 내 모든 키워드
def get_all_keywords(novels):
  data = []
  for novel in novels:
    novel_data = {
      'id': novel.id,
      'title': novel.title,
      'users_id': novel.users_id,
      'publisher_id': novel.publisher_id,
      'price': novel.price,
      'ing': novel.ing,
      'author': novel.author,
      'genre_id': novel.genre_id,
      'viewCount': novel.viewCount,
      'reviewCount': novel.reviewCount,
      'score': novel.score,
      'uploaded': novel.uploaded,
      'date': novel.date,
      'free_info': novel.free_info,
      'keywords': novel.keywords
    }
    data.append(novel_data)
  
  df = pd.DataFrame(data)

  keywords_list = df['keywords'].to_list()
  all_keywords = [keyword for keywords in keywords_list for keyword in keywords]

  return all_keywords

# 키워드 중 최빈도수 도출 함수 : 기본값 5개
def get_top_num_keywords(keywords, num=5):
  keyword_counts = Counter(keywords)
  
  top_num_keywords = keyword_counts.most_common(num)
  
  return top_num_keywords

# 장르별 키워드 최빈도 상위 10개
def get_top_keywords_by_genre(genre_id):
  novels = Novels.query.filter_by(genre_id=genre_id).all()

  all_keywords = get_all_keywords(novels)
  
  top_keywords = get_top_num_keywords(all_keywords, num=10)

  return top_keywords

def create_analysis_summary(novel_ids, selected_keywords):
  novels = Novels.query.filter(Novels.id.in_(novel_ids)).all()

  selected_keywords = selected_keywords.split(',')

  all_keywords = get_all_keywords(novels)
  filtered_keywords = [keyword for keyword in all_keywords if keyword not in selected_keywords]
  
  top_5_keywords = get_top_num_keywords(filtered_keywords)
  
  return top_5_keywords

# 그룹내 선택된 키워드 비중
def get_keywords_importance(genre_id, selected_keywords):
    novels = Novels.query.filter_by(genre_id=genre_id).all()
    selected_keywords = selected_keywords.split(',')

    all_keywords = get_all_keywords(novels)
    keyword_counts = Counter(all_keywords)

    selected_counts = {keyword: keyword_counts.get(keyword, 0) for keyword in selected_keywords}
    others_count = sum(count for keyword, count in keyword_counts.items() if keyword not in selected_keywords)

    data = {
      'selected': selected_counts,
      'others': others_count
    }

    return data

# 장르별 상위 10개 키워드와 선택된 키워드 비교 라인 그래프
def get_keywords_10rank_by_genre(genre_id, selected_keywords):
  novels = Novels.query.filter_by(genre_id=genre_id).all()

  all_keywords = get_all_keywords(novels)
  keyword_counts = Counter(all_keywords)

  sorted_keywords = sorted(keyword_counts.items(), key=lambda item: item[1], reverse=True)
  top_keywords = sorted_keywords[:10]
  
  for keyword in selected_keywords.split(','):
    if keyword not in [kw for kw, count in top_keywords]:
      top_keywords.append((keyword, keyword_counts.get(keyword, 0)))
  
  return top_keywords

# 홈화면 상위 100개 작품 노출
def get_top100_novels(page, per_page):
  top_100_query = db.session.query(Novels).order_by(
    desc((Novels.viewCount + Novels.reviewCount) / 2)
  ).limit(100).subquery()

  pagination = db.session.query(Novels).filter(Novels.id.in_(db.session.query(top_100_query.c.id))).paginate(page=page, per_page=per_page, error_out=False)

  novels_data = []
  for novel in pagination.items:
    image = Images.query.filter_by(novel_id=novel.id).first()
    novel_data = {
      "id": novel.id,
      "title": novel.title,
      "author": novel.author,
      "viewCount": novel.viewCount,
      "src": image.src if image else None
    }
    novels_data.append(novel_data)

  return {
    'novels': novels_data,
    'total': pagination.total,
    'pages': pagination.pages,
    'current_page': pagination.page
  }

# 모든 작품 수익 평균값 중앙값 도출

# 장르별 작품 수익 평균값 중앙값 도출

# 그룹별 작품 수익 평균값 중앙값 도출