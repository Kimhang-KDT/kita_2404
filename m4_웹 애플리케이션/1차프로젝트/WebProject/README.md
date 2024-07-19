# 프로젝트 개요
  - 작품 데뷔를 앞둔 예비 작가들을 위한 웹소설 제작 방향성 제시

# 문제인식
  - 웹소설 산업 규모 -> 약 1조 390억원 (2023년 기준)
  - 독자 규모 600만 명, 작가 20만명 육박
  - 작가 평균 수입 연 3,487만원. 그 중 연재 수입은 46.1%에 불과
  - 또한 20만명의 작가들 중 35.8%는 연 1,000만원 미만의 수입에 불과

# 원인분석
  - 출판 시장에서 이북 시장으로의 트렌드 전환으로 인해 웹소설 산업이 급성장을 이룸
  - 이에 따라 독자들의 급격한 니즈 변화에 따른 자극적인 주제의 획일화, 무분별한 작품의 양적 증가가 이루어지며 점차 웹소설 시장은 인기 작품의 양산화가 주를 이루게 됨.
  - 또한, 작가들이 작품을 제작하는데 있어 모든 과정을 단독으로 작업하여 플랫폼에 직접 투고하는 방식이 주를 이루는 현 상황에 의해 다소 객관적이지 못하고 완성도가 낮은 작품들이 쏟아져 나옴.
  - 이러한 현황에 대해 플랫폼 '조아라'의 대표는 작가 개인이 스스로 역량을 강화할 수 있도록 환경을 조성하고, 대작이 탄생할 수 있도록 기획 단계부터 함께 고민하고 생산해나가는 구조를 구축하여야 한다고 발언

# 데이터 선별
  - 지난 2년간 국내 웹소설 시장의 가장 큰 파이를 가진 플랫폼 '카카오페이지'에서 데이터를 크롤링
  - 데이터 크롤링의 주요 목표 : 조회수, 리뷰수, 평점, 키워드 등
  - 필요한 데이터 크롤링 하여 전처리.
  - 조회수와 리뷰수를 합하여 '인기도' 파생 변수 생성, 조회수와 편당 가격 (* 78.8%)을 합하여 '예상 수익' 파생 변수 생성

# 웹 구조
│  app.py\
│  config.py\
│  form.py\
│  generate_secret_key.py\
│  models.py\
│  README.md\
│  utils.py\
│\
├─static\
│  ├─assets\
│  │  ├─demo\
│  │  │      carousel-banner.js\
│  │  │      datatables-demo.js\
│  │  │      group-popularity-chart.js\
│  │  │      group-revenue-scatter-chart.js\
│  │  │      keywords-comparison-chart.js\
│  │  │      keywords-important-pie.js\
│  │  │      keywords-rank-line-chart.js\
│  │  │      select-genre-keywords.js\
│  │  │\
│  │  └─img\
│  │          guide.png\
│  │          H2BD2.jpg\
│  │          naver.png\
│  │          readytogo.png\
│  │          stage.png\
│  │\
│  ├─css\
│  │      styles.css\
│  │
│  └─js\
│          datatables-simple-demo.js\
│          scripts.js\
│\
├─templates\
│  │  base.html\
│  │  community.html\
│  │  guide.html\
│  │  home.html\
│  │  notices.html\
│  │  publishers.html\
│  │\
│  ├─analysis\
│  │      genre_analysis.html\
│  │      million_analysis.html\
│  │      publisher_analysis.html\
│  │      \
│  ├─auth\
│  │      login.html\
│  │      login_base.html\
│  │      register.html\
│  │\
│  └─debuts\
│          debut.html\
│          debut_analysis.html\
│          debut_analysis_single.html\
│          novel_not_found.html\
│          _macro.html

# 웹구현
  - 웹 구성
    - 홈화면
      - 공모전 배너, 전체 TOP 100 작품 리스트, 관련 뉴스
    - 키워드 가이드
      - 구상하고 있는 작품의 장르 & 키워드 검색
      - 선택한 키워드 관련 타 작가 작품이 있으면 해당 작품들의 인기도, 예상 수익 등 분석 결과 제공
      - 타 작품이 없다면 해당 장르 및 각각의 키워드에 관련된 작품들이 평균 데이터와 인기 작품 분석 결과 제공
    (미구현)
    - 밀리언페이지
    - 장르해부학
    - 출판사 가이드
    - 공모전 / 뉴스
    - 작가 커뮤니티

# 코드 구조
  - app files
    - app.py : 라우터 및 함수 호출
    - form.py : POST form 구성 요소
    - models.py : db 연결 및 테이블 relationship 연계
    - utils.py : app에서 호출할 사용자 함수로 구성
  - templates files
    - analysis
    - auth : 로그인 파트
    - debuts : 키워드 매칭
      - _macro.html : 공통 macro 분리
      - debut.html : 장르&키워드 검색 화면
      - debut_analytics / novel_not_found / debut_analysis_single : 분석 결과 화면 제공
    - 그 외
      - base.html, home.html 등
  - static files
    - css / js : 부트스트랩 기본 설정 파일
    - assets/demo : javascript 사용자 함수 파일 분리
    - assets/img : 홈 화면 배너 img 보관
