# 오늘의 숙제
# Q. 주어진 문자열 리스트에서 유효한 Python 변수 이름만을 추출하여 반환하는 함수 작성
# keyword/맨 앞 숫자/_ 외의 특수문자 안됨

* keyword와 re를 import 받는다
import keyword
import re

identifiers = ["var1", "2things", "variable_name", "time!", "__init__"]

keywords = keyword.kwlist

def collect_name_in_keyword(list, keywords, re):
  res_list =  [i for i in list if i not in keywords]

  #맨 앞에 숫자가 있느냐, _ 외에 다른 특수문자가 있느냐
  * keywords를 처리한 리스트에서 [소문자,대문자,_] 후 [소문자,대문자,_,숫자] 순으로 되는지 확인
  * ^는 처음 $는 마지막
  * 맨 마지막 var는 리스트 컴프리핸션에서 현재 반복중인 값을 나타냄.
  * 매칭 함수에 바로 나오는 r은 정규표현식 패턴을 표시하기 위해 사용되는 이스케이프 문자.
  * r앞에오는 \는 특수의미의 문자를 사용할 수 있게한다 ex) \w \d \s 등
  valid_variables = [var for var in res_list if re.match(r'^[a-zA-Z_][a-zA-Z_0-9]*$', var)]

  print(valid_variables) 
  
collect_name_in_keyword(identifiers, keywords, re)
