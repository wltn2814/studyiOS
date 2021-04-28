//: [Previous](@previous)

import Foundation
import Swift

//var greeting = "Hello, playground"

//: [Next](@next)

// 타입 캐스팅
// 1. 스위프트 타입 캐스팅
// 인스턴스의 타입을 확인하는 용도
// 클래스의 인스턴스를 부모 혹은 자식 클래스 타입으로 사용할 수 있는지 확인하는 용도
// is, as를 사용

// * 형변환은 'ex. let someDouble = Double(2)' 타입 캐스팅이 아니라 새로운 값을 생성하는 것

// 2. 예제 클래스

class Person{
    var name:String = ""
    func breath(){
        print("숨을 쉽니다")
    }
}

class Student: Person{
    var school: String = ""
    func goToSchool(){
        print("등교를 합니다")
    }
}

class UniversityStudent: Student{
    var major: String = ""
    func goToMT(){
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

// 인스턴스 생성
var yagom:Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

// 3. 타입 확인
// is를 사용하여 타입을 확인

var result: Bool

result = yagom is Person
result = yagom is Student
result = yagom is UniversityStudent

result = hana is Person
result = hana is Student
result = hana is UniversityStudent

result = jason is Person
result = jason is Student
result = jason is UniversityStudent

if yagom is UniversityStudent{
    print("yagom은 대학생입니다")
} else if yagom is Student{
    print("yagom은 학생입니다")
} else if yagom is Person{
    print("yagom은 사람입니다")
}

switch jason {
case is Person:
    print("jason은 사람입니다")
case is Student:
    print("jason은 학생입니다")
case is UniversityStudent:
    print("jason은 대학생입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
}

switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다")
case is Student:
    print("jason은 학생입니다")
case is Person:
    print("jason은 사람입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
}

// 4. 업 캐스팅(Up Casting)
// as를 사용하여 부모 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줌
// Any 혹은 AnyObject로도 타입정보를 변환할 수 있음
// 암시적으로 처리되므로 꼭 필요한 경우가 아니면 생략 가능

// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업캐스팅

var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
// var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류

// UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var jina: Any = Person() // as Any 생략 가능

// 5. 다운 캐스팅(Down Casting)
// as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해줌

// A. 조건부 다운 캐스팅
// as?를 사용
// 캐스팅하려는 타입에 부합하지 않는 인스턴스면 nil을 반환하기 대문에 결과 타입은 옵셔널

var optionalCasted : Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent
optionalCasted = jina as? UniversityStudent
optionalCasted = jina as? Student

// B. 강제 다운 캐스팅
// as!를 사용합니다
// 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 런타임 오류가 발생
// 캐스팅에 성공하면 옵셔널이 아닌 일반 타입 반환

var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
// forcedCasted = jenny as! UniversityStudent
// forcedCasted = jina as! UniversityStudent
// forcedCasted = jina as! Student

// 6. 활용

func doSomethingWithSwitch(someone: Person){
    switch someone{
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)
doSomethingWithSwitch(someone: mike)
doSomethingWithSwitch(someone: jenny)
doSomethingWithSwitch(someone: yagom)

func doSomething(someone: Person){
    if let universityStudent = someone as? UniversityStudent{
        universityStudent.goToMT()
    }else if let student = someone as? Student{
        student.goToSchool()
    }else if let person = someone as? Person{
        person.breath()
    }
}

doSomething(someone: mike as Person)
doSomething(someone: mike)
doSomething(someone: jenny)
doSomething(someone: yagom)


/* assert/guard */

// 애플리케이션이 동작하는 도중에 생성하는 다양한 연산 결과값을 동적으로 확인하고 안전하게 처리할 수 있도록 확인하고 빠르게 처리

// 1. Assertion
// assert(_:_:file:line:) 함수를 사용합니다
// assert 함수는 디버깅 모드에서만 동작합니다
// 배포하는 애플리케이션에서는 제외됩니다
// 예상했던 조건의 검증을 위해 사용합니다

var someInt: Int = 0

// 검증 조건과 실패시 나타날 문구를 작성
// 검증 조건에 부합하므로 지나감
assert(someInt == 0, "someInt != 0")

someInt = 1
//assert(someInt == 0) // 동작 중지, 검증 실패
//assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패
//Assertion failed: someInt != 0

func functionWithAssert(age: Int?){
    assert(age != nil, "age == nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
    print("당신의 나이는 \(age!)세입니다")
}

functionWithAssert(age: 50)
//functionWithAssert(age: -1) // 동작 중지, 검증 실패
//functionWithAssert(age: nil) // 동작 중지, 검증 실패

// * assert(_:_:file:line:)와 같은 역할을 하지만 실제 배포 환경에서도 동작하는 precondition(_:_:file:line:)함수도 있음

// 2. guard(빠른 종료 - Early Exit)
// guard를 사용하여 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료
// 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작
// guard의 else 블럭 내부에는 특정 코드 블럭을 종료하는 지시어(return, break 등)가 꼭 있어야 함
// 타입 캐스팅, 옵셔널과도 자주 함께 사용
// 그 외에도 단순 조건 판단 후 빠르게 종료 시 용이

func functionWithGuard(age: Int?){
    guard let unwrappedAge = age,
        unwrappedAge < 130,
        unwrappedAge >= 0 else{
        print("나이값 입력이 잘못되었습니다")
        return
    }
    
    print("당신의 나이는 \(unwrappedAge)세 입니다")
}

var count = 1

while true {
    guard count < 3 else{
        break
    }
    print(count)
    count += 1
}

func someFunction(info: [String: Any]){
    guard let name = info["name"] as? String else{
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    
    print("\(name): \(age)")
}

someFunction(info: ["name":"jenny", "age":"10"])
someFunction(info: ["name":"mike"])
someFunction(info: ["name":"yagom","age":10])

// ** if let/guard 를 이용한 옵셔널 바인딩 비교 **

// 1. if let 옵셔널 바인딩
//if var unwrapped: Int = someValue {
//    unwrapped = 3
//}
// if 구문 외부에서는 unwrapped 사용이 불가능
// unwrapped = 5

// 2. guard 옵셔널 바인딩
// guard 구문 이후에도 unwrapped 사용 가능
//guard var unwrapped: Int = someValue else {
//    return
//}
//unwrapped = 3
