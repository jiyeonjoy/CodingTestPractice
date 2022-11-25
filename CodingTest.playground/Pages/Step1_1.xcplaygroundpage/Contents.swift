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
/*

 -
*/
/*

 -
*/

/* 가운데 글자 가져오기

 - 단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.
 
 재한사항
 s는 길이가 1 이상, 100이하인 스트링입니다.
*/
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
