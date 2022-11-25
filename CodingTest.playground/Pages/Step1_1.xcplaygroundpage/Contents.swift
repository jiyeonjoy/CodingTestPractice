import Foundation

/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/
/*

 -
*/

/* 두 정수 사이의 합

 - 두 정수 a, b가 주어졌을 때 a와 b 사이에 속한 모든 정수의 합을 리턴하는 함수, solution을 완성하세요.
 예를 들어 a = 3, b = 5인 경우, 3 + 4 + 5 = 12이므로 12를 리턴합니다.

 제한 조건
 a와 b가 같은 경우는 둘 중 아무 수나 리턴하세요.
 a와 b는 -10,000,000 이상 10,000,000 이하인 정수입니다.
 a와 b의 대소관계는 정해져있지 않습니다.
*/
func solution4(_ a:Int, _ b:Int) -> Int64 {
    a == b ? Int64(a) : a < b ? Int64((a...b).reduce(0,+)) : Int64((b...a).reduce(0,+))
}

/* 나누어 떨어지는 숫자 배열

 - array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수, solution을 작성해주세요.
 divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.

 제한사항
 arr은 자연수를 담은 배열입니다.
 정수 i, j에 대해 i ≠ j 이면 arr[i] ≠ arr[j] 입니다.
 divisor는 자연수입니다.
 array는 길이 1 이상인 배열입니다.
*/
func solution3(_ arr:[Int], _ divisor:Int) -> [Int] {
    var list:[Int] = arr.filter{ $0%divisor == 0 }
    if list.count > 0 {
        return list.sorted()
    } else {
        return [-1]
    }
}

/* 가운데 글자 가져오기

 - 단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.
 
 재한사항
 s는 길이가 1 이상, 100이하인 스트링입니다.
*/
func solution2(_ s:String) -> String {
    return String(s[String.Index(encodedOffset: (s.count-1)/2)...String.Index(encodedOffset: s.count/2)])
}

func solution1(_ s:String) -> String {
    if s.count % 2 == 0 {
        return s[(s.count/2)-1..<(s.count/2)+1]
    } else {
        return s[s.count/2..<(s.count/2)+1]
    }
}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}

/* 2016년

 - 2016년 1월 1일은 금요일입니다. 2016년 a월 b일은 무슨 요일일까요? 두 수 a ,b를 입력받아 2016년 a월 b일이 무슨 요일인지 리턴하는 함수, solution을 완성하세요. 요일의 이름은 일요일부터 토요일까지 각각 SUN,MON,TUE,WED,THU,FRI,SAT
 
 입니다. 예를 들어 a=5, b=24라면 5월 24일은 화요일이므로 문자열 "TUE"를 반환하세요.
*/
func solution(_ a:Int, _ b:Int) -> String {
    let dayList:[Int] = [31,29,31,30,31,30,31,31,30,31,30]
    let dayOfTheWeek:[String] = ["FRI","SAT","SUN","MON","TUE","WED","THU"]
    var days:Int = 0
    if a > 1 {
        for i in 1...a-1 {
            days += dayList[i-1]
        }
    }
    days += b
    return dayOfTheWeek[days%7 == 0 ? 6 : (days%7)-1]
}
