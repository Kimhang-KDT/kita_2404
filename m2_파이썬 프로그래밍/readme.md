# 20240424 파이썬 기초 문답

Q6. 주어진 정수 리스트에서 가장 자주 등장하는 숫자(최빈값)를 찾아 반환하는 함수를 작성하세요. 만약 최빈값이 여러 개라면, 그 중 가장 작은 숫자를 반환하세요.\
numbers = [1, 3, 2, 3, 4, 1, 3, 3]\

def find_mode(numbers):\
  from collections import Counter\
  count = Counter(numbers)\
  max_freq = max(count.values())\
  frequent_numbers = [num for num, freq in count.items() if freq == max_freq]\
  // count.items() 안을 돌면서 max_freq\
  // [x for x in range(10) if x % 2 != 0] -> 다른 예제\
  return min(frequent_numbers)\

numbers = [1, 3, 2, 3, 4, 1, 3, 3, 1, 1, 1, 1]\
print(find_mode(numbers))\

** Counter = 리스트 안에서 반복되는 횟수를 카운팅해서 해시로 담아줌\
** max() min() 최대값 최소값 구하는 함수\
** num for num    i for i   x for x   in list 는 for문을 한줄로 쓸 때 사용\
** count.values()는 count의 값을 가져오는것 / .keys()면 키값을 가져옴\
** count.items()는 count의 키와 값을 리스트로 담아옴 ex) [(키,값), (키,값), (키, 값)]\

===============================================================

## frequent_numbers = [num for num, freq in count.items() if freq == max_freq]

해당 파이썬 코드는 `count` 딕셔너리에서 값(value)이 `max_freq`와 같은 숫자(key)들을 `frequent_numbers`라는 리스트에 담는 역할을 합니다.

`num for num`은 이해하기 쉽게 표현하면 `num`이라고 할 수 있습니다. 이는 리스트 컴프리헨션(List Comprehension)에서 각각의 항목을 순회할 때 사용되는 변수 이름입니다.\
이 경우에는 `num`을 사용하여 `count` 딕셔너리의 키(key)들을 순회하고 있습니다.

`for num, freq in count.items()`는 `count` 딕셔너리의 각 키(key)와 값(value)을 순회하기 위해 사용됩니다.\
`items()` 메서드는 딕셔너리의 키(key)와 값(value)을 튜플(tuple) 형태로 반환하는데, `for num, freq in count.items()`는 각 키(key)를 `num`으로, 각 값(value)을 `freq`로 할당하여 사용합니다.

`if freq == max_freq` 조건은 `freq`가 `max_freq`와 같은지를 확인합니다. 만약 `freq`가 `max_freq`와 같다면, 해당 키(key)를 `frequent_numbers` 리스트에 추가합니다.

요약하자면, `num for num`은 리스트 컴프리헨션에서 각각의 키(key)를 순회하기 위한 변수 이름이며, `num for num, freq in count.items()`는 `count` 딕셔너리의 각 키(key)와 값(value)을 순회하기 위해 사용됩니다.

frequent_numbers = [num for num, freq in count.items() if freq == max_freq] 에서\
num for num으로 보는 것이 아니라 (num for) (num, freq) (in count.items()) 이런식으로 묶어 봐야 코드를 알 수 있다.\
이 코드는 count.items()로 키와 값을 가져온 뒤 각각 num과 freq에 할당한다는 뜻이다.

===============================================================

## Gradio 웹을 사용하지 않고 개발한 솔루션을 시각화할 수 있다
## hugging Face 오픈소스를 모두 모아서 제공하는 사이트

===============================================================

# Q8. 이름과 나이를 입력받아 "Hello, [name]. You are [age] years old." 형식으로 출력하세요.
name = "김한결"\
age = 28

print("Hello, {}. You are {} years old.".format(name, age))\
print(f"Hello, {name}. You are {age} years old.")

* .format을 사용해 넣어주는 방법도 있으나 간단하게 print(f'')를 사용할 수 있다.
* 이를 [문자열 포맷팅]이라고 하며 기존에 사용하던 %포매팅과 str.format보다 최근에 나온 기능이다.
* 앞에 f를 붙이고 {} 안에 변수명을 써주면 끝!
* 딕셔너리(해시)를 사용하고싶다면 {dict["name]} {dict["age"]} 로 사용 가능하며 같은 원리로 리스트도 출력 가능하다.
