# isidentifier()는 파이썬의 문자열 메서드로 주어진 문자열이 유효한 식별자인지를 확인

def valid_identifiers(identifiers):\
  valid = []\
  for identifier in identifiers:\
    if identifier.isidentifier():\
      valid.append(identifier)\
  return valid

# 예제실행
identifiers = ["var1", "2things", "variable_name", "time!", "__init__"]\
print(valid_identifiers(identifiers))

# 그러나 isidentifer 함수는 TRUE FALSE 등을 걸러내지 못하는 단점이 있다.
# 식별자 구분할 때 사용할 수 있는 함수가 이미 정의되어 있으니 복잡하게 정규표현식을 사용하여 함수를 만들지 않아도\
# 이미 사용되어있는 함수를 가져다 사용하면 된다. 심지어 import 받지 않아도 됨

==============================================================\

import keyword
def valid_identifiers(identifiers):

  valid = [identifier for identifier in identifiers if identifier.isidentifier() and not keyword.iskeyword(identifier)]
  return valid

# 예제실행
identifiers = ["var1", "2things", "variable_name", "time!", "__init__"]
print(valid_identifiers(identifiers))

# 실행가능. 할 수는 있지만 보통 사용자 함수 안에서 이런식으로 한줄로 줄이는 방식은 사용하지 않는다.
