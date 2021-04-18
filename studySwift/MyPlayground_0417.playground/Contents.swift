import UIKit
import Swift

/* 열거형 */

//enum 이름{
//    case 이름1
//    case 이름2
//    case 이름3, 이름4, 이름5
//    // ...
//}

// 예제
enum BoostCamp{
    case iosCamp
    case androidCamp
    case webCamp
}

enum Weekday{
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용
var day : Weekday = Weekday.mon

// 타입이 명확하다면 .케이스처럼 표현해도 무방합니다
day = .tue

print(day) //tue

//switch의 비교값이 열거형 타입이 위치할 때
// 모든 열거형 케이스를 포함한다면 default를 작성할 필요 없음
switch(day){
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}


