import UIKit
import Swift

/* 프로퍼티 */

// 1. 프로퍼티의 종류
// 인스턴스 저장 프로퍼티
// 타입 저장 프로퍼티
// 인스턴스 연산 프로퍼티
// 타입 연산 프로퍼티
// 지연 저장 프로퍼티

// 2. 정의와 사용
// 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있음
// 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있음
// 연산 프로퍼티는 var로만 선언 가능
// 연산 프로퍼티를 읽기 전용으로 구현할 수 있지만, 쓰기 전용으로는 구현 불가
// 읽기 전용으로 구현하려면 get블럭만 작성. 읽기 전용은 get블럭을 생략 가능
// 읽기, 쓰기 모두 가능하게 하려면 get 블럭과 set 블럭을 모두 구현해줘야 함
// set 블럭에서 암시적 매개변수 newValue를 사용 가능

struct Student {
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    var westernAge: Int{
        get{
            return koreanAge - 1
        }
        
        set(inputValue){
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    /*
    // 인스턴스 메서드
    func selfIntroduce(){
        print("저는 \(self.class)반 \(name)입니다")
    }
    */
     
    // 읽기 전용 인스턴스 연산 프로퍼티
    // 간단히 위의 selfIntroduce() 메서드를 대체 가능
    var selfIntroduction: String{
        get{
            return "저는 \(self.class)반 \(name)입니다"
        }
    }
    
    // 타입 메서드
    static func selfIntroduce(){
        print("학생타입입니다")
    }
    
    static var selfIntroduction: String{
        return "학생타입입니다"
    }
    
}

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)

// 인스턴스 생성
var jisu: Student = Student()
jisu.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
jisu.name = "jisu"
print(jisu.name)

// 인스턴스 연산 프로퍼티 사용
print(jisu.selfIntroduction)

print("제 한국 나이는 \(jisu.koreanAge)살이고, 미쿡 나이는 \(jisu.westernAge)살입니다.")

// 3. 응용
struct Money{
    var currencyRate:Double = 1100
    var dollar:Double = 0
    var won:Double{
        get{
            return dollar*currencyRate
        }
        set{
            dollar = newValue/currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)

// 4. 지역변수 및 전역변수
// 저장 프로퍼티와 연산 프로퍼티의 기능은 함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역/전역 변수에서도 모두 사용 가능합니다

var a:Int = 100
var b:Int = 200
var sum:Int{
    return a + b
}

print(sum)

/* 프로퍼티 감시자 */

// 1. 프로퍼티 감시자
// 프로퍼티 감시자를 사용하면 프로퍼티의 값이 변경될 때 원하는 동작을 수행할 수 있습니다
// 값이 변경되기 직전에 willSet 블럭이, 값이 변경된 직후에 didSet블럭이 호출
// 둘 중 필요한 하나만 구현해 주어도 무관
// 변경되려는 값이 기존과 같더라도 프로퍼티 감시자는 항상 동작
// willSet 블럭에서는 암시적 매개변수 newValue를, didSet블ㄹ거에서는 oldValue를 사용할 수 있음
// 프로퍼티 감시자는 연산 프로퍼티에는 사용할 수 없음
// 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등의 지역/전역 변수에 모두 사용 가능

// 2. 정의 및 사용
struct Moneey{
    // 프로퍼티 감시자 사용
    var currencyRate:Double = 1100{
        willSet(newRate){
            print("환율이 \(currencyRate)에서 \(newRate)로 변경될 예정입니다")
        }
        didSet(oldRate){
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }
    
    // 프로퍼티 감시자 사용
    var dollar:Double = 0{
        // willSet의 암시적 매개변수 이름 newValue
        willSet{
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        // didSet의 암시적 매개변수 이름 oldValue
        didSet{
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }
    
    // 연산 프로퍼티
    var won:Double{
        get{
            return dollar*currencyRate
        }
        set{
            dollar = newValue/currencyRate
        }
    
    /*
     프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없음
     willSet{
     
     }
     */
        
    }
}

var moneeyInMyPocket: Moneey = Moneey()

moneeyInMyPocket.currencyRate = 1150

moneeyInMyPocket.dollar = 10

print(moneeyInMyPocket.won)

/* 상속 */

// 1. 스위프트 상속
// 상속은 클래스, 프로토콜 등에서 가능
// 열거형, 구조체는 상속이 불가능
// 스위프트의 클래스는 단일상속으로 다중상속을 지원하지 않음
// 이번 파트에서는 클래스의 상속에 대해서 알아볼 것

// 2. 문법
//class 이름: 상속받을 클래스 이름{
//    /* 구현부 */
//}

// 3. 사용
// final 키워드를 사용하면 재정의(overrice) 방지 가능
// static 키워드를 사용해 타입 메서드를 만들면 재정의가 불가능
// class 키워드를 사용해 타입 메서드를 만들면 재정의 가능
// class 앞에 final을 붙이면 static 키워드를 사용한 것과 동일하게 동작
// override 키워드를 사용해 부모 클래스의 메서드를 재정의 가능

// 기반 클래스 Person
class Person{
    var name: String = ""
    
    func selfIntroduce(){
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용하여 재정의 방지 가능
    final func sayHello(){
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
    
    // 재정의 가능한 class 메서드라도
    // final 키워드를 사용하면 재정의 할 수 없다
    // 메서드 앞의 `static`과 `final class`는 똑같은 역할
    final class func finalClassMethod(){
        print("type method - final class")
    }
}

// Person을 상속받는 Student
class Stuudent: Person{
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classMethod() {
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 할 수 없음
//    override static func typeMethod(){}
    
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의할 수 없음
//    override func sayHello(){}
//    override class func finalClassMethod(){}
}


// 4. 구동 확인

let jisuu:Person = Person()
let minion: Stuudent = Stuudent()

jisuu.name = "jisu"
minion.name = "kevin"
minion.major = "Bad things"

jisuu.selfIntroduce()

minion.selfIntroduce()

Person.classMethod()

Person.typeMethod()

Person.typeMethod()

Person.classMethod()

Person.typeMethod()

Person.finalClassMethod()

Stuudent.classMethod()

Stuudent.typeMethod()

Stuudent.finalClassMethod()

/* 인스턴스 생성과 소멸 */

// 인스턴스를 생성하는 이니셜라이저와 클래스의 인스턴스가 소멸될 때 호출되는 디이니셜라이저, 그리고 이와 관련된 것들에 대해 알아본다
// 프로퍼티 초기값
// 이니셜라이저 init
// 디이니셜라이저 deinit

// 1. 프로퍼티 초기값
// 스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야함
// 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 됨
class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

// 인스턴스 생성
let blue: PersonA = PersonA()

// 기본값이 인스턴스가 지녀야 할 값과 맞지 않다면
// 생성된 인스턴스의 프로퍼티에 각각 값 할당
blue.name = "jisu"
blue.age = 30
blue.nickName = "blue"

// 2-1. 이니셜라이저(initializer)
// 프로퍼티 초기값을 지정하기 어려운 경우, 이니셜라이저 init을 통해 인스턴스가 가져야 할 초기값을 전달 가능
class PersonB{
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age:Int, nickName:String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let minhee: PersonB = PersonB(name: "minhee", age:22, nickName: "민이")

// 프로퍼티의 초기값이 꼭 필요 없을 때
// 옵셔널을 사용!
// class 내부의 init을 사용할 때는 convenience 키워드 사용

class PersonC{
    var name: String
    var age: Int
    var nickName: String?
    
    init(name: String, age: Int, nickName: String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }
    
    // 위와 동일한 기능 수행
    // convenience init(name: String, age: Int, nickName: String){
    //    init(name: name, age: age)
    //    self.nickName = nickName
    //}
    
    init(name: String, age:Int){
        self.name = name
        self.age = age
    }
}

let sun: PersonC = PersonC(name:"sun", age:10)
let summ: PersonC = PersonC(name:"summ", age:15, nickName: "s")

class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String){
        self.name = name
    }
    
    func goOut(){
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy:Puppy = Puppy(name: "happy")
// 강아지는 주인없이 산책하면 안돼요!
// happy.goOut() // 주인이 없는 상태라 오류 발생
happy.owner = sun
happy.goOut()

// 2-2. 실패 가능한 이니셜라이저
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있음
// 인스턴스 생성에 실패하면 nil을 반환
// init?을 사용

class PersonD{
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int){
        if(0...120).contains(age) == false {
            return nil
        }
        
//        if name.characters.count == 0{   // 강의랑 다름
        if name.count == 0{
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker)
print(batman)

// 3. 디이니셜라이저(deinitializer)
// deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출
// 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있음
// deinit은 매개변수를 지닐 수 없음
// 자동으로 호출되므로 직접 호출할 수 없음
// 디이니셜라이저는 클래스 타입에만 구현할 수 있음
// 인스턴스가 메모리에서 해제되는 시점은 ARC(Automatic Reference Counting)의 규칙에 따라 결정됩니다.

class PersonE{
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC){
        self.name = name
        self.child = child
    }
    
    // 인스턴스가 메모리에서 해제되는 시점에 자동 호출
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name:"donald", child:sun)
donald?.pet = happy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제
// donald가 jenny에게 happy를 인도
