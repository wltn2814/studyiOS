import UIKit

var str = "Hello, playground"
var str2 : String = "Hello, playground"

let strNonedit : String = "Hello, playground"

var boolTest : Bool = true
var intTest : Int = 10
var floatTest : Float = 10.5
var doubleTest : Double = 10.0
var characterTest : Character = "H"
var stringTest : String = "Hello, playground"

/* Any, AnyObject, nil*/

//Any - Swift의 모든 타입을 지칭하는 키워드
//AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
//nil - 없음을 의미하는 키워드

//MARK : -Any
var someAny : Any = 100
someAny = "어떤 타입도 수용 가능합니다"
someAny = 123.12

//let someDouble : Double = someAny

//Mark : -AnyObject

class SomeClass {}

var someAnyObject: AnyObject = SomeClass()

//someAnyObject = 123.12

//Mark : - nil
//null, NULL, Null, nil과 유사

//someAny = nil
//someAnyObject = nil

/* 컬렉션 타입 */
/* Array, Dictionary, Set */

import Swift

/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
 */

//MARK: - Array

//빈 Int Array 생성
var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
//integers.append(101.1)

integers.contains(100)
integers.contains(99)

integers.remove(at: 0)
integers.removeLast()
integers.removeAll()

integers.count

//integers[0]

// Array<Double>와 [Double]은 동일한 표현
// 빈 Double Array 생성
var doubles: Array<Double> = [Double]()

// 빈 String Array 생성
var strings: [String] = [String]()

// 빈 Character Array 생성
// []는 새로운 빈 Array
var characers: [Character] = []

// let을 사용하여 Array를 선언하면 불편 Array
let immutableArray = [1, 2, 3]

// immutableArray.append(4)
// immutableArray.removeAll()

//MARK: -Dictionary
// Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

anyDictionary

anyDictionary["someKey"] = "dictionary"
anyDictionary

anyDictionary.removeValue(forKey: "anotherKey")

anyDictionary["someKey"] = nil
anyDictionary

let emptyDictionary: [String: String] = [:]
let initializedDictionary: [String: String] = ["name":"jisu", "gender":"female"]

//emptyDictionary["key"] = "value"
//let someValue: String = initializedDictionary["name"]

//MARK: - Set

// 빈 Int Set 생성
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)

integerSet
integerSet.contains(1)
integerSet.contains(2)

integerSet.remove(100)
integerSet.removeFirst()

integerSet.count

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

//합집합
let union: Set<Int> = setA.union(setB)

//정렬
let sortedUnion: [Int] = union.sorted()

//교집합
let intersection: Set<Int> = setA.intersection(setB)

//차집합
let subtracting: Set<Int> = setA.subtracting(setB)


/* 함수 */

//MARK: - 함수의 선언

//MARK: 함수선언의 기본형태
//func 함수이름(매개변수1이름 : 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입{
//    함수 구현부
//    return 반환값
//}

func sum(a: Int, b: Int) -> Int{
    return a + b
}

//MARK: 반환 값이 없는 함수
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> Void{
//    함수 구현부
//    return
//}

func printMyName(name: String) -> Void{
    print(name)
}

//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...){
//    함수 구현부
//    return
//}

func printYourName(name: String){
    print(name)
}


//MARK: 매개변수가 없는 함수
//func 함수이름() -> 반환타입 {
//    함수 구현부
//    return 반환값
//}

func maximumIntegerValue() -> Int{
    return Int.max
}

//MARK: 매개변수와 반환값이 없는 함수
//func 함수이름() -> Void {
//    함수 구현부
//    return
//}

func hello() -> Void { print("hello") }

//func 함수이름(){
//    함수 구현부
//    return
//}

func bye(){ print("bye") }

//MARK: - 함수의 호출

sum(a: 3, b: 5)

printMyName(name: "jisu")

printYourName(name: "yagom")

maximumIntegerValue()

hello()

bye()

//MARK: - 매개변수 기본값

// 기본값을 갖는 매개변수는 매개변수 목록 중에 뒤에 위치하는 것이 좋다.
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수 기본값 ...) -> 반환타입{
//    함수 구현부
//    return 반환값
//}

func greeting(friend: String, me: String = "jisu") {
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 생략할 수 있습니다
greeting(friend: "yagom")               // Hello yagom! I'm jisu
greeting(friend: "jisu", me: "yagom")   // Hello jisu! I'm yagom

//MARK: - 전달인자 레이블

// 전달인자 레이블을 함수를 호출할 때
// 매개변수의 역할을 좀 더 명확하게 하거나
// 함수 사용자의 입장에서 표현하고자 할 때 사용합니다
// func 함수이름 (전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이륾: 매개변수2타입 ...) -> 반환타입 {
//      함수 구현부
//      return
// }

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용한다
func greeting(to friend: String, from me: String){
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때에는 전달인자 레이블을 사용해야 한다.
greeting(to: "jisu", from: "yagom")     // Hello jisu! I'm yagom

//MARK: - 가변 매개변수

// 전달 받을 값의 개수를 알기 어려울 때 사용할 수 있다.
// 가변 매개변수는 함수당 하나만 가질 수 있다.

// func 함수이름(매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
//    함수 구현부
//    return 반환값
// }

func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}

print(sayHelloToFriends(me: "jisu", friends: "yagom", "john"))
// Hello ["yagom", "john"]! I'm jisu!

print(sayHelloToFriends(me: "jisu"))
// Hello []! I'm jisu!

/*
 위에서 설명한 다양한 함수의 모양은 모두 섞어서 사용 가능하다.
 */

//MARK: -데이터 타입으로서의 함수

// 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이다.
// 스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고
// 매개변수를 통해 전달할 수도 있다

//MARK: 함수의 타입 표현
// 반환타입을 생략할 수 없습니다
// (매개변수1타입, 매개변수2타입 ...) -> 반환타입

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("jisu", "yagom")   // Hello jisu! I'm yagom

someFunction = greeting(friend: me:)
someFunction("jisu", "yagom")   // hello jisu! I'm yagom

// 타입이 다른 함수는 할당할 수 없다.
//someFunction = sayHelloToFriends(me: , friends: )

func runAnother(function: (String, String) -> Void){
    function("jisu", "yagom");
}

// Hello jisu! I'm yagom
runAnother(function: greeting(friend: me:))

// Hello jisu! I'm yagom
runAnother(function: someFunction)
