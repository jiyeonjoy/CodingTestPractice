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

/* 수박수박수박수박수박수?

 - 길이가 n이고, "수박수박수박수...."와 같은 패턴을 유지하는 문자열을 리턴하는 함수, solution을 완성하세요. 예를들어 n이 4이면 "수박수박"을 리턴하고 3이라면 "수박수"를 리턴하면 됩니다.
 
 제한 조건
 n은 길이 10,000이하인 자연수입니다.
*/
func solution12(_ n:Int) -> String {
    (1...n).map {
           $0%2==1 ? "수" : "박"
    }.joined()
}

/* 소수 찾기

 - 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.
 
 소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
 (1은 소수가 아닙니다.)

 제한 조건
 n은 2이상 1000000이하의 자연수입니다.
*/
func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

func solution11(_ n:Int) -> Int {
    (2...n).filter{
        isPrime(num: $0)
    }.count
}

solution11(3)

/* 서울에서 김서방 찾기

 - String형 배열 seoul의 element중 "Kim"의 위치 x를 찾아, "김서방은 x에 있다"는 String을 반환하는 함수, solution을 완성하세요. seoul에 "Kim"은 오직 한 번만 나타나며 잘못된 값이 입력되는 경우는 없습니다.
 
 제한 사항
 seoul은 길이 1 이상, 1000 이하인 배열입니다.
 seoul의 원소는 길이 1 이상, 20 이하인 문자열입니다.
 "Kim"은 반드시 seoul 안에 포함되어 있습니다.
*/
func solution10(_ seoul:[String]) -> String {
    for i in 0...seoul.count-1 {
        if seoul[i] == "Kim" {
            return "김서방은 \(i)에 있다"
        }
    }
    return ""
}

/* 문자열 다루기 기본

 - 문자열 s의 길이가 4 혹은 6이고, 숫자로만 구성돼있는지 확인해주는 함수, solution을 완성하세요. 예를 들어 s가 "a234"이면 False를 리턴하고 "1234"라면 True를 리턴하면 됩니다.
 
 제한 사항
 s는 길이 1 이상, 길이 8 이하인 문자열입니다.
 s는 영문 알파벳 대소문자 또는 0부터 9까지 숫자로 이루어져 있습니다.
*/
func solution9(_ s:String) -> Bool {
    (s.count == 4 || s.count == 6) && (Int(s) ?? -1 > -1)
}

/* 문자열 내림차순으로 배치하기

 - 문자열 s에 나타나는 문자를 큰것부터 작은 순으로 정렬해 새로운 문자열을 리턴하는 함수, solution을 완성해주세요.
 s는 영문 대소문자로만 구성되어 있으며, 대문자는 소문자보다 작은 것으로 간주합니다.

 제한 사항
 str은 길이 1 이상인 문자열입니다.
*/
func solution8(_ s:String) -> String {
    String(s.sorted { $0.asciiValue ?? 0 > $1.asciiValue ?? 0 })
}

/* 문자열 내 p와 y의 개수
 
 - 대문자와 소문자가 섞여있는 문자열 s가 주어집니다. s에 'p'의 개수와 'y'의 개수를 비교해 같으면 True, 다르면 False를 return 하는 solution를 완성하세요. 'p', 'y' 모두 하나도 없는 경우는 항상 True를 리턴합니다. 단, 개수를 비교할 때 대문자와 소문자는 구별하지 않습니다.
 
 예를 들어 s가 "pPoooyY"면 true를 return하고 "Pyy"라면 false를 return합니다.

 제한사항
 문자열 s의 길이 : 50 이하의 자연수
 문자열 s는 알파벳으로만 이루어져 있습니다.
*/
func solution7(_ s:String) -> Bool
{
    var p:Int = 0
    var y:Int = 0
    s.map {
        if $0 == "p" || $0 == "P" {
            p += 1
        } else if $0 == "y" || $0 == "Y" {
            y += 1
        }
    }
    return p == y
}

/* 문자열 내 마음대로 정렬하기

 - 문자열로 구성된 리스트 strings와, 정수 n이 주어졌을 때, 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 정렬하려 합니다. 예를 들어 strings가 ["sun", "bed", "car"]이고 n이 1이면 각 단어의 인덱스 1의 문자 "u", "e", "a"로 strings를 정렬합니다.
 
 제한 조건
 strings는 길이 1 이상, 50이하인 배열입니다.
 strings의 원소는 소문자 알파벳으로 이루어져 있습니다.
 strings의 원소는 길이 1 이상, 100이하인 문자열입니다.
 모든 strings의 원소의 길이는 n보다 큽니다.
 인덱스 1의 문자가 같은 문자열이 여럿 일 경우, 사전순으로 앞선 문자열이 앞쪽에 위치합니다.
*/
func solution6(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted{  Array($0)[n] == Array($1)[n] ? $0 < $1 :  Array($0)[n] < Array($1)[n] }
}

func solution5(_ strings:[String], _ n:Int) -> [String] {
    let list:[String] = strings.sorted()
    var dic:[Character:[String]] = [:]
    var result:[String] = []
    list.map {
        if dic[Array($0)[n]]?.isEmpty ?? true {
            dic[Array($0)[n]] = [$0]
        } else {
            var value:[String] = dic[Array($0)[n]]!
            value.append($0)
            dic[Array($0)[n]] = value
        }
    }
    dic.keys.sorted().map {
        result.append(contentsOf: dic[$0]!)
    }
    return result
}

solution5(["sun", "bed", "car"], 1)

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
