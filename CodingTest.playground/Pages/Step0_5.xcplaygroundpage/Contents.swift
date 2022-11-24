import Foundation

/*

 -
*/

/* 다음에 올 숫자

 - 등차수열 혹은 등비수열 common이 매개변수로 주어질 때, 마지막 원소 다음으로 올 숫자를 return 하도록 solution 함수를 완성해보세요.
*/
func solution19(_ common:[Int]) -> Int {
    if common[1]-common[0] == common[2]-common[1] {
        return common[1]-common[0]+(common.last ?? 0)
    } else {
        return (common[1]/common[0])*(common.last ?? 0)
    }
}

/* 연속된 수의 합

 - 연속된 세 개의 정수를 더해 12가 되는 경우는 3, 4, 5입니다. 두 정수 num과 total이 주어집니다. 연속된 수 num개를 더한 값이 total이 될 때, 정수 배열을 오름차순으로 담아 return하도록 solution함수를 완성해보세요.
*/
func solution18(_ num:Int, _ total:Int) -> [Int] {
    var result:[Int] = []
    if num%2 == 0 {
        for i in 0..<num {
            result.append((total/num)-(num/2)+i+1)
        }
    } else {
        for i in 0..<num {
            result.append((total/num)-(num/2)+i)
        }
    }
    return result
}

/* 종이 자르기

 - 머쓱이는 큰 종이를 1 x 1 크기로 자르려고 합니다. 예를 들어 2 x 2 크기의 종이를 1 x 1 크기로 자르려면 최소 가위질 세 번이 필요합니다.
 
 정수 M, N이 매개변수로 주어질 때, M x N 크기의 종이를 최소로 가위질 해야하는 횟수를 return 하도록 solution 함수를 완성해보세요.
*/
func solution17(_ M:Int, _ N:Int) -> Int {
    (M-1) + M*(N-1)
}

/* 문자열 밀기

 - 문자열 "hello"에서 각 문자를 오른쪽으로 한 칸씩 밀고 마지막 문자는 맨 앞으로 이동시키면 "ohell"이 됩니다. 이것을 문자열을 민다고 정의한다면 문자열 A와 B가 매개변수로 주어질 때, A를 밀어서 B가 될 수 있다면 몇 번 밀어야 하는지 횟수를 return하고 밀어서 B가 될 수 없으면 -1을 return 하도록 solution 함수를 완성해보세요.
*/
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

func solution16(_ A:String, _ B:String) -> Int {
    if A == B {
        return 0
    }
    var count:Int = 0
    var str:String = A
    while count < A.count {
        count += 1
        str = String(str[(str.count-1)...]) + str
        str = str[0..<str.count-1]
        if str == B {
            return count
        }
    }
    
    return -1
}

solution16("hello", "ohell")

/* 잘라서 배열로 저장하기

 - 문자열 my_str과 n이 매개변수로 주어질 때, my_str을 길이 n씩 잘라서 저장한 배열을 return하도록 solution 함수를 완성해주세요.
*/
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    func substring(from: Int) -> String {
         let fromIndex = index(from: from)
         return String(self[fromIndex...])
     }

     func substring(to: Int) -> String {
         let toIndex = index(from: to)
         return String(self[..<toIndex])
     }
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

func solution15(_ my_str:String, _ n:Int) -> [String] {
    var result:[String] = []
    for i in 0...(my_str.count-1)/n {
        result.append(
            my_str.substring(with: i*n..<min(i*n+n,my_str.count)))
    }
    return result
}

solution15("abc1Addfggg4556b", 6)

/* 7의 개수

 - 머쓱이는 행운의 숫자 7을 가장 좋아합니다. 정수 배열 array가 매개변수로 주어질 때, 7이 총 몇 개 있는지 return 하도록 solution 함수를 완성해보세요.
*/
func solution14(_ array:[Int]) -> Int {
    var result:Int = 0
    for a in array {
        if String(a).contains("7") {
            String(a).map {
                if $0 == "7" {
                    result += 1
                }
            }
        }
    }
    return result
}

/* 문자열 정렬하기 (2)

 - 영어 대소문자로 이루어진 문자열 my_string이 매개변수로 주어질 때, my_string을 모두 소문자로 바꾸고 알파벳 순서대로 정렬한 문자열을 return 하도록 solution 함수를 완성해보세요.
*/
func solution13(_ my_string:String) -> String {
    String(my_string.lowercased().sorted())
}

/* 세균 증식

 - 어떤 세균은 1시간에 두배만큼 증식한다고 합니다. 처음 세균의 마리수 n과 경과한 시간 t가 매개변수로 주어질 때 t시간 후 세균의 수를 return하도록 solution 함수를 완성해주세요.
*/
func solution12(_ n:Int, _ t:Int) -> Int {
    var result:Int = n
    for _ in 1...t {
        result *= 2
    }
    return result
}

solution12(2, 10)

/* 제곱수 판별하기

 - 어떤 자연수를 제곱했을 때 나오는 정수를 제곱수라고 합니다. 정수 n이 매개변수로 주어질 때, n이 제곱수라면 1을 아니라면 2를 return하도록 solution 함수를 완성해주세요.
*/
func solution11(_ n:Int) -> Int {
    var count:Int = 1
    while count < n {
        if count*count == n {
            return 1
        }
        count += 1
    }
    return 2
}

/* 문자열안에 문자열

 - 문자열 str1, str2가 매개변수로 주어집니다. str1 안에 str2가 있다면 1을 없다면 2를 return하도록 solution 함수를 완성해주세요.
*/
func solution10(_ str1:String, _ str2:String) -> Int {
    str1.contains(str2) ? 1 : 2
}

/* OX퀴즈

 - 덧셈, 뺄셈 수식들이 'X [연산자] Y = Z' 형태로 들어있는 문자열 배열 quiz가 매개변수로 주어집니다. 수식이 옳다면 "O"를 틀리다면 "X"를 순서대로 담은 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution9(_ quiz:[String]) -> [String] {
    var result:[String] = []
    for q in quiz {
        var list = q.components(separatedBy: " ")
        if list[1] == "-" {
            if Int(list[0])! - Int(list[2])! == Int(list[4])! {
                result.append("O")
            } else {
                result.append("X")
            }
        } else {
            if Int(list[0])! + Int(list[2])! == Int(list[4])! {
                result.append("O")
            } else {
                result.append("X")
            }
        }
    }
    return result
}

solution9(["3 - 4 = -3", "5 + 6 = 11"])

/* 자릿수 더하기

 - 정수 n이 매개변수로 주어질 때 n의 각 자리 숫자의 합을 return하도록 solution 함수를 완성해주세요
*/
func solution8(_ n:Int) -> Int {
    var result:Int = 0
    String(n).map {
        result += Int(String($0)) ?? 0
    }
    return result
}

solution8(123)

/* n의 배수 고르기

 - 정수 n과 정수 배열 numlist가 매개변수로 주어질 때, numlist에서 n의 배수가 아닌 수들을 제거한 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution7(_ n:Int, _ numlist:[Int]) -> [Int] {
    numlist.filter { $0%n == 0 }
}

/* 숫자 찾기

 - 정수 num과 k가 매개변수로 주어질 때, num을 이루는 숫자 중에 k가 있으면 num의 그 숫자가 있는 자리 수를 return하고 없으면 -1을 return 하도록 solution 함수를 완성해보세요.
*/
func solution6(_ num:Int, _ k:Int) -> Int {
    var str:String = String(num)
    for i in 0...str.count-1 {
        if String(str[str.index(str.startIndex, offsetBy: i)]) == String(k) {
            return i+1
        }
        
    }
    return -1
}

/* 배열의 유사도

 - 두 배열이 얼마나 유사한지 확인해보려고 합니다. 문자열 배열 s1과 s2가 주어질 때 같은 원소의 개수를 return하도록 solution 함수를 완성해주세요.
*/
func solution5(_ s1:[String], _ s2:[String]) -> Int {
    var count:Int = 0
    for s in s1 {
        if s2.contains(s) {
            count += 1
        }
    }
    return count
}

/* 문자열 계산하기

 - my_string은 "3 + 5"처럼 문자열로 된 수식입니다. 문자열 my_string이 매개변수로 주어질 때, 수식을 계산한 값을 return 하는 solution 함수를 완성해주세요.
*/
func solution4(_ my_string:String) -> Int {
    var result = 0
    var isSum = true
    my_string.components(separatedBy: " ").map {
        if $0 == "+" {
            isSum = true
        } else if $0 == "-" {
            isSum = false
        } else {
            if result == 0 {
                result = Int($0) ?? 0
            } else if isSum {
                result += Int($0) ?? 0
            } else {
                result -= Int($0) ?? 0
            }
        }
    }
    return result
}

solution4("3 + 4")

/* 가장 큰 수 찾기

 - 정수 배열 array가 매개변수로 주어질 때, 가장 큰 수와 그 수의 인덱스를 담은 배열을 return 하도록 solution 함수를 완성해보세요.
*/
func solution3(_ array:[Int]) -> [Int] {
    var max:Int = array.sorted(by: >).first ?? 0
    var index:Int = array.firstIndex(of: max) ?? 0

    return [max, index]
}

solution3([1,2,3])

/* 편지

 - 머쓱이는 할머니께 생신 축하 편지를 쓰려고 합니다. 할머니가 보시기 편하도록 글자 한 자 한 자를 가로 2cm 크기로 적으려고 하며, 편지를 가로로만 적을 때, 축하 문구 message를 적기 위해 필요한 편지지의 최소 가로길이를 return 하도록 solution 함수를 완성해주세요.
*/
func solution2(_ message:String) -> Int {
    message.count*2
}

/* 약수 구하기

 - 정수 n이 매개변수로 주어질 때, n의 약수를 오름차순으로 담은 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution(_ n:Int) -> [Int] {
    (1...n).filter {
        n%$0 == 0
    }
}
