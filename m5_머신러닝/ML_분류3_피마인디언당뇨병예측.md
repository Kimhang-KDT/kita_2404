Q. diabetes.csv 데이터세트를 이용해 다음사항을 수행하여 당뇨병 여부를 판단하는 머신러닝 예측 모델을 작성하고 평가하세요.
- zero_features = ['Glucose', 'BloodPressure','SkinThickness','Insulin','BMI']는 0값을 평균값으로 대체
- 정확도, 정밀도, 재현율, F1 Score, ROC_AUC Score를 포함하는 평가지표 사용자 함수 작성
- 정밀도와 재현율의 임곗값에 따른 값 변화를 곡선 형태로 시각화
- 전체적인 성능 평가 지표를 유지하면서 재현율을 약간 향상시키는 임계값 산출
- 산출된 임계값을 적용한 평가

※ 피처 정보  
'Pregnancies'(임신 횟수), 'Glucose'(포도당 부하 검사 수치), 'BloodPressure'(혈압),
'SkinThickness'(팔 삼두근 뒤쪽의 피하지방 측정값, 'Insulin'(혈청 인슈린),
'BMI'(체질량 지수), 'DiabetesPedigreeFunction'(당뇨 내력 가중치 값), 'Age', 'Outcome'

사용할 데이터
  - diabetes.csv
컬럼 값
  - Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age, Outcome

사용 모듈
  - from sklearn.model_selection import train_test_split
  - from sklearn.metrics import accuracy_score, precision_score, recall_score, roc_auc_score, f1_score, precision_recall_curve, roc_cuve
  - from sklearn.preprocessing import LogisticRegression, Binarizer, StandardScaler
  - import pandas
  - import matplotlib.pyplot as plt

## 이상치 처리
  - zero_features 리스트에 값이 0인 데이터 보유 컬럼들을 담는다.
    - ['Glucose', 'BloodPressure','SkinThickness','Insulin','BMI']
    - 당뇨가 있는 사람에게 Insulin이나 Glucose 수치가 0이라는 데이터는 이상치임

## 데이터프레임에서 X와 y 설정
  - X : 해당 컬럼 외
    - X = diabetes.drop('Outcome', axis=1)
  - y : 해당 컬럼
    - y = diabetes['Outcome']

## 테스트용 / 학습용 데이터셋 구성
  - X_train, X_test, y_train, y_test = (train_test_split(X, y, test_size=0.2, random_state=156))
  - stratify=y 옵션은 데이터 분할 시 특정 열의 비율을 유지하도록 한다. 특히 클래스 불균형이 있는 데이터셋에 유용
    - 예를들어 y의 각 클래스 비율이 훈련 셋과 테스트 셋에 동일하게 유지되어 과적합을 방지할 수 있다.
  
## 데이터 스케일링 (표준화 / 로그 변환)
  - 대표적으로 StandardScaler와 np.log2가 있다.
  - 표준화 : StandardScaler
    - 데이터의 평균을 0, 표준편차를 1로 맞춰준다.
  - 로그변환 : np.log2
    - 데이터의 분포를 정규분포에 가깝게 만들어준다. 특히, 데이터가 양수이고 분포가 비대칭일 때 유용
    - diabetes 데이터에서 로그 변환 사용시 0을 replace np.nan으로 변환하는 이유는, 로그 변환에서 0은 정의 되지 않기 때문이다.

## LogisticRegression
  - 파라메터로 max_iter=500, solver='lbfgs', random_state=42
  - model.fit(X_train, y_train) : 모델 학습
  - model.predict(X_test) : 예측
  - model.predict_proba(X_test)[:,1] : 예측 확률

## precision_recall_curve(y_test, proba)
  - 결과 : precisions, recalls, thresholds 반환
  - plt.plot(thresholds, precisions[:-1], label='precision')
  - plt.plot(thresholds, recalls[:-1], label='recall)

## 임계값 산출
  - thresholds 리스트 객체 내의 값을 차럐로 iteration하면서 Evaluation 수행
  - Binarizer(threshold=threshold).fit(proba_c1)
    - proba.reshape(-1,1) : proba를 2차원 배열로 전환 후 Binarizer에 적용