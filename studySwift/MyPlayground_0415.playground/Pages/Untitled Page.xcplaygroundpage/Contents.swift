import UIKit
import Swift

/* 구조체 */

var str = "Hello, playground"

//struct 이름 {
//    구현부
//}

struct Sample {
    // 가변 프로퍼티(값 변경 가능)
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티(값 변경 불가능)
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티(static 키워드 사용 : 타입 자체가 사용하는 프로퍼티)
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드(인스턴스가 사용하는 메서드)
    func instanceMethod(){
        print("instance method")
    }
    
    // 타입 메서드(static 키워드 사용 : 타입 자체가 사용하는 메서드)
    static func typeMethod(){
        print("type method")
    }
}

// 가변 인스턴스 생성
var mutable: Sample = Sample()

mutable.mutableProperty = 200

// 불변 프로퍼티 인스턴스 생성 후 수정할 수 없습니다
// 컴파일 오류 발생
// mutable.immutableProperty = 200

// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 아무리 가변 프로퍼티라도
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutable.mutableProperty = 200
//immutable.immutableProperty = 200

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

struct Student{
    
    // 가변 프로퍼티
    var name: String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용할 수 있다.
    var `class`:String = "Swift"
    
    // 타입 메서드
    static func selfIntroduce(){
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭, 몇몇 경우를 제외하고 사용은 선택
    func selfIntroduce(){
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce()

// 가변 인스턴스 생성
var jisu: Student = Student()
jisu.name = "leejisu"
jisu.class = "software"
jisu.selfIntroduce()

// 불변 인스턴스 생성
let yagom: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
// yagom.name = "yagom"
yagom.selfIntroduce()


/* 클래스 */

//class 이름 {
//    구현부
//}

class SampleClass{
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드
    func instanceMethod(){
        print("instance method")
    }
    
    // 타입 메서드
    // 상속 시 재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    // 상속 시 재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
}

// 인스턴스 생성 - 참조 정보 수정 가능
var mutableReference : SampleClass = SampleClass()

mutableReference.mutableProperty = 200

//

// 불변 프로퍼티는 생성 후 수정할 수 없음
// 컴파일 오류 발생
//mutableReference.immutableProperty = 200

// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference: SampleClass = SampleClass()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 인스턴스 프토퍼티의 값 변경이 가능
// 에러 왜나지...
immutableReference.mutableProperty = 200

// 다만 참조정보는 수정 불가능
// 컴파일 오류 발생
//immutableReference = mutableReference

// 참조 타입이더라도 불변 인스턴스는 인스턴스 생성 후 수정할 수 없음
//immutableReference.immutableProperty = 200

// 타입 프로퍼티 및 메서드
SampleClass.typeProperty = 300
SampleClass.typeMethod() //type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없다
// 컴파일 오류 발생
//mutableReference.typeProperty = 400
//mutableReference.typeMethod()

class StudentClass{
    // 가변 프로퍼티
    var name : String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용할 수 있다
    var `class`: String = "Swift"
    
    // 타입 메서드
    class func selfIntroduce(){
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항
    func selfIntorduce(){
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
StudentClass.selfIntroduce()

// 인스턴스 생성
var jisuu: StudentClass = StudentClass()
jisuu.name = "jisu"
jisuu.class = "스위프트"
jisuu.selfIntorduce()

// 인스턴스 생성
let imnotmoon: StudentClass = StudentClass()
imnotmoon.name = "moon"
imnotmoon.selfIntorduce()
