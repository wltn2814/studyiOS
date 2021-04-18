import UIKit
import Swift

/* 클래스 vs 구조체/열거형 */

struct ValueType {
    var property = 1
}

class ReferenceType{
    var property = 1
}

// 첫 번째 구조체 인스턴스
let firstStructInstance = ValueType()

// 두 번째 구조체 인스턴스에 첫 번째 인스턴스 값 복사
var secondStructInstance = firstStructInstance

// 두 번째 구조체 인스턴스 프로퍼티 값 수정
secondStructInstance.property = 2

// 두 번째 구조체 인스턴스는 첫 번째 구조체를 똑같이 복사한
// 별도의 인스턴스이기 때문에
// 두 번째 구조체의 인스턴스 프로퍼티 값을 변경해도
// 첫 번째 구조체 인스턴스의 프로퍼티 값에는 영향이 없음
print("first struct instance property: \(firstStructInstance.property)")
print("second struct instance property: \(secondStructInstance.property)")

// 클래스 인스턴스 생성 후 첫 번째 참조 생성
let firstClassReference = ReferenceType()
// 두 번째 참조 변수에 첫 번째 참조 할당
let secondClassReference = firstClassReference
secondClassReference.property = 2

// 두 번째 클래스 참조는 첫 번째 클래스 인스턴스를 참조
// 두 번째 참조를 통해 인스턴스의 프로퍼티 값을 변경하면
// 첫 번째 클래스 인스턴스의 프로퍼티 값을 변경하게 됨
print("first class instance property: \(firstClassReference.property)")
print("second class instance property: \(secondClassReference.property)")

// 값 타입을 사용하는 경우
// - 연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶은 경우
// - 다른 객체 또는 함수 등으로 전달될 때 참조가 아니라 복사(값 복사) 할 경우
// - 자신을 상속할 필요가 없거나, 다른 타입의 상속을 받을 필요가 없는 경우

// 스위프트에서의 사용
// - 스위프트의 기본 데이터 타입은 모두 구조체로 구현되어 있음
// - 스위프트는 구조체와 열거형 사용을 선호
// - Apple 프레임워크는 대부분 클래스 사용
// - 구조체/클래스 선택과 사용은 개발자의 몫

/* 클로저 기본 */

// 클로저
// - 클로저는 실행 가능한 코드 블럭
// - 함수와 다르게 이름 정의는 필요하지 않음.
// - 매개변수 전달과 반환값 존재할 수 있다는 점이 동일
// - 함수는 이름이 있는 클로저
// - 일급 객체로 전달인자, 변수, 상수 등에 저장 및 전달이 가능

// 기본 클로저 문법
// - 클로저는 중괄호 {}로 감싸져있음
// - 괄호를 이용해 파라미터 정의
// - ->를 이용해 반환 타입 명시
// - in 키워드를 이용해 실행 코드와 분리
// {(매개변수 목록) -> 반환타입 in
//   실행 코드
// }

// 클로저 사용
// sum이라는 상수에 클로저 할당
 let sum: (Int, Int) -> Int = {(a:Int, b:Int) in
    return a + b
}

let sumResult:Int = sum(1,2)
print(sumResult)

// 함수의 전달인자로서의 클로저
// - 클로저는 주로 함수의 전달 인자로 많이 사용
// - 함수 내부에서 원하는 코드블럭을 실행 가능

let add: (Int,Int) -> Int
add = {(a:Int, b:Int)in
    return a + b
}

let substract: (Int, Int) -> Int
substract = {(a:Int, b:Int) in
    return a - b
}

let divide: (Int, Int) -> Int
divide = {(a:Int, b:Int) in
    return a/b
}

func calculate(a: Int, b: Int, method:(Int, Int) -> Int) ->Int{
    return method(a,b)
}

var calculated:Int

calculated = calculate(a: 50, b:10, method: add)

print(calculated)   // 60

calculated = calculate(a: 50, b:10, method: substract)

print(calculated)   // 40
    
calculated = calculate(a: 50, b:10, method: divide)

print(calculated)   // 5

// 따로 클로저를 상수, 변수에 넣어 전달하지 않음
// 함수를 호출할 때 클로저를 작성하여 전달 가능

calculated = calculate(a: 50, b: 10, method: { (left:Int,right: Int) -> Int in
    return left*right
})

print(calculated)

/* 클로저 고급 - 다양한 클로저 표현 */

//1. 후행 클로저 : 함수의 매개변수 마지막으로 전달되는 클로저는 후행클로저(trailing closure)로 함수 밖에 구현 가능
//2. 반환타입 생략 : 컴파일러가 클로저의 타입을 유추할 수 있는 경우, 반환 타입 생략 가능
//3. 단축 인자 이름 : 전달인자의 이름이 굳이 필요없고 컴파일러가 타입을 유추할 수 잇는 경우 축약된 전달인자 이름 ($0, $1, $2, ...)을 사용 가능
//4. 암시적 반환 표현 : 반환 값이 있는 경우, 암시적으로 클로저의 맨 마지막줄은 return 키워드를 생략하더라도 반환 값으로 취급합니다.

// 기본 클로저 표현

// 클로저를 매개변수로 갖는 함수 calculated(a:b:method:)와 결과값을 저장할 변수 result 선언
func calculate2(a: Int, b:Int, method:(Int, Int)->Int)-> Int{
    return method(a,b)
}

var result : Int

// 1. 후행 클로저
// 클로저가 함수의 마지막 전달인자일 때, 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저 구현 가능
result = calculate2(a: 10, b: 10){(left:Int, right:Int) -> Int in
    return left + right
}

print(result)

//2
