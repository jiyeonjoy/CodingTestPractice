import Foundation

func solution55(_ n:Int, _ k:Int) -> [Int] {
    var a:[Int] = []
    for i in 1...n {
        if i%k == 0 {
            a.append(i)
        }
    }
    return a
}

func solution54(_ my_string:String) -> [Int] {
    let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
    var a:[Int] = []
    for i in 0..<alphabet.count {
        a.append(my_string.filter{ $0 == alphabet[i] }.count)
    }
    return a
}

solution54("Programmers")

func solution53(_ q:Int, _ r:Int, _ code:String) -> String {
    let arr = Array(code)
    var a:[Character] = []
    for i in 0..<code.count {
        if i%q == r {
            a.append(arr[i])
        }
    }
    return String(a)
}

func solution52(_ my_string:String, _ m:Int, _ c:Int) -> String {
    let arr = Array(my_string)
    var a:[Character] = []
    for i in 0..<my_string.count/m {
        a.append(arr[i*m+c-1])
    }
    return String(a)
}

solution52("ihrhbakrfpndopljhygc", 4, 2)

func solution51(_ my_string:String, _ s:Int, _ e:Int) -> String {
    let arr1 = Array(my_string)
    var arr = Array(my_string)
    for i in s...e {
        arr[i] = arr1[e+s-i]
    }
    return String(arr)
}

func solution50(_ my_string:String, _ is_prefix:String) -> Int {
    if my_string.count < is_prefix.count {
        return 0
    }
    return String(Array(my_string)[0..<is_prefix.count]) == is_prefix ? 1 : 0
}

func solution49(_ my_string:String, _ n:Int) -> String {
    return String(Array(my_string)[0..<n])
}

func solution48(_ my_string:String, _ is_suffix:String) -> Int {
    if my_string.count < is_suffix.count {
        return 0
    }
    
    return String(Array(my_string)[my_string.count-is_suffix.count..<my_string.count]) == is_suffix ? 1 : 0
}

func solution47(_ my_string:String) -> [String] {
    var a:[String] = []
    let arr = Array(my_string)
    for i in 0..<my_string.count {
        a.append(String(arr[i..<my_string.count]))
    }
    
    return a.sorted()
}

solution47("banana")

func solution46(_ my_string:String, _ n:Int) -> String {
    return String(Array(my_string)[my_string.count-n..<my_string.count])
}

func solution45(_ my_strings:[String], _ parts:[[Int]]) -> String {
    var str = ""
    for i in 0..<my_strings.count {
        str += String(Array(my_strings[i])[parts[i][0]...parts[i][1]])
    }
    return str
}

solution45(["progressive", "hamburger", "hammer", "ahocorasick"],[[0, 4], [1, 2], [3, 5], [7, 7]])

func solution44(_ intStrs:[String], _ k:Int, _ s:Int, _ l:Int) -> [Int] {
    var a:[Int] = []
    let kStr = Array(String(k))
    for str in intStrs {
        let strArray = Array(str)[s..<s+l]
        var isM = true
        for i in 0..<l {
            if strArray[s+i] < kStr[i] {
                isM = false
                break
            } else if strArray[s+i] > kStr[i] {
                isM = true
                break
            } else if i == l-1 {
                isM = false
            }
        }
        if isM {
            let n = Int(String(strArray)) ?? 0
            a.append(n)
        }
    }
    return a
}

solution44(["0123456789","9876543210","9999999999999"], 50000, 5, 5)

func solution43(_ my_string:String, _ queries:[[Int]]) -> String {
    var arr = Array(my_string)
    for q in queries {
        let s = q[0]
        let e = q[1]
        let list = Array(arr[s...e].reversed())
        for i in s...e {
            arr[i] = list[i-s]
        }
    }
    return String(arr)
}

solution43("rermgorpsam", [[2, 3], [0, 7], [5, 9], [6, 10]])

func solution42(_ number:String) -> Int {
    var sum = 0
    number.map{
        sum += (Int(String($0)) ?? 0)
    }
    return sum%9
}

solution42("123")

func solution41(_ my_string:String, _ index_list:[Int]) -> String {
    var a = ""
    let arr = Array(my_string)
    for i in index_list {
        a += String(arr[i])
    }
    return a
}

func solution40(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    let list = [a, b, c, d].sorted()
    let n1 = list[0]
    let n2 = list[1]
    let n3 = list[2]
    let n4 = list[3]
    var a = 0
    if n1 == n4 {
        a = 1111*n1
    } else if n1 == n2 && n1 == n3 {
        a = Int(pow(Double(10*n1+n4), 2))
    } else if n2 == n3 && n2 == n4 {
        a = Int(pow(Double(10*n4+n1), 2))
    } else if n1 == n2 && n3 == n4 {
        a = (n1+n3)*abs(n1-n3)
    } else if n1 == n2 {
        a = n3*n4
    } else if n2 == n3 {
        a = n1*n4
    } else if n3 == n4 {
        a = n1*n2
    } else {
        a = n1
    }
    return a
}

solution40(2,2,2,2)
solution40(4,1,4,4)
solution40(6,3,3,6)
solution40(2,5,2,6)

func solution39(_ x1:Bool, _ x2:Bool, _ x3:Bool, _ x4:Bool) -> Bool {
    return (x1 || x2)&&(x3 || x4)
}

func solution38(_ arr:[Int]) -> [Int] {
    var stk: [Int] = []
    var i = 0
    while i < arr.count {
        if stk.count == 0 {
            stk.append(arr[i])
            i += 1
        } else {
            if (stk.last ?? 0) < arr[i] {
                stk.append(arr[i])
                i += 1
            } else {
                stk.removeLast()
            }
        }
    }
    return stk
}

solution38([1, 4, 2, 5, 3])

func solution37(_ n:Int) -> [Int] {
    var a: [Int] = [n]
    var n = n
    while n != 1 {
        if n%2 == 0 {
            n /= 2
        } else {
            n = 3*n+1
        }
        a.append(n)
    }
    return a
}

solution37(10)

func solution36(_ start_num:Int, _ end_num:Int) -> [Int] {
    var a: [Int] = []
    for n in start_num...end_num {
        a.append(n)
    }
    return a
}

func solution35(_ l:Int, _ r:Int) -> [Int] {
    if l > r {
        return [-1]
    }
    var a: [Int] = []
    for n in l...r {
        let c = String(n).filter{ $0 != "0" && $0 != "5" }.count
        if c == 0 {
            a.append(n)
        }
    }
    return a.count == 0 ? [-1] : a
}

solution35(5, 5)

func solution34(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var a = arr
    for q in queries {
        let s = q[0]
        let e = q[1]
        let k = q[2]
        for i in s...e {
            if i%k == 0 {
                a[i] += 1
            }
        }
    }
    return a
}

solution34([0, 1, 2, 4, 3], [[0, 4, 1],[0, 3, 2],[0, 3, 3]])

func solution33(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var a: [Int] = []
    for q in queries {
        var n = -1
        for i in q[0]...q[1] {
            if arr[i] > q[2] {
                if n == -1 {
                    n = arr[i]
                } else {
                    n = min(n, arr[i])
                }
            }
        }
        a.append(n)
    }
    return a
}

solution33([0, 1, 2, 4, 3], [[0, 4, 2],[0, 3, 2],[0, 2, 2]])

func solution32(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var a = arr
    for q in queries {
        let i1 = q[0]
        let i2 = q[1]
        let temp = a[i1]
        a[i1] = a[i2]
        a[i2] = temp
    }
    return a
}

solution32([0, 1, 2, 3, 4], [[0, 3],[1, 2],[1, 4]])

func solution31(_ numLog:[Int]) -> String {
    var n = numLog[0]
    var a = ""
    for num in numLog {
        if num-n == 1 {
            a += "w"
        } else if num-n == -1 {
            a += "s"
        } else if num-n == 10 {
            a += "d"
        } else if num-n == -10 {
            a += "a"
        }
        n = num
    }
    return a
}

solution31([0, 1, 0, 10, 0, 1, 0, 10, 0, -1, -2, -1])

func solution30(_ n:Int, _ control:String) -> Int {
    var a = n
    for c in control {
        if c == "w" {
            a += 1
        } else if c == "s" {
            a -= 1
        } else if c == "d" {
            a += 10
        } else {
            a -= 10
        }
    }
    return a
}

solution30(0, "wsdawsdassw")

func solution29(_ num_list:[Int]) -> [Int] {
    var answer = num_list
    if num_list.count < 2 {
        return num_list
    }
    let n1 = num_list[num_list.count-1]
    let n2 = num_list[num_list.count-2]
    if n1 > n2 {
        answer.append(n1-n2)
    } else {
        answer.append(n1*2)
    }
    return answer
}

func solution28(_ num_list:[Int]) -> Int {
    var n1 = 0
    var n2 = 0
    if num_list.count == 0 {
        return 0
    }
    for n in num_list {
        if n%2 == 0 {
            n1 = n1*10+n
        } else {
            n2 = n2*10+n
        }
    }
    return n1+n2
}
solution28([3, 4, 5, 2, 1])
solution28([5, 7, 8, 3])

func solution27(_ num_list:[Int]) -> Int {
    var n1 = num_list.reduce(1, *)
    var n2 = Int(pow(Double(num_list.reduce(0, +)),2))
    return n1 > n2 ? 0 : 1
}

solution27([3, 4, 5, 2, 1])

func solution26(_ a:Int, _ b:Int, _ c:Int) -> Int {
    var answer = 0
    if a == b && a == c {
        answer = (a+b+c)*Int(pow(Double(a), 2)+pow(Double(b), 2)+pow(Double(c), 2))*Int(pow(Double(a), 3)+pow(Double(b), 3)+pow(Double(c), 3))
    } else if a == b || a == c || b == c {
        answer = (a+b+c)*Int(pow(Double(a), 2)+pow(Double(b), 2)+pow(Double(c), 2))
    } else {
        answer = (a+b+c)
    }
    return answer
}

solution26(2,6,1)
solution26(5,3,3)
solution26(4,4,4)
solution26(6,6,6)

func solution25(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
    var answer = 0
    for i in 0..<included.count {
        if included[i] {
            answer += a+i*d
        }
    }
    return answer
}

solution25(3, 4, [true, false, false, true, true])

func solution24(_ code:String) -> String {
    let array = Array(code)
    var isZeroMode = true
    var ret = ""
    
    for i in 0..<code.count {
        if array[i] == "1" {
            isZeroMode.toggle()
        } else if isZeroMode {
            if i%2 == 0 {
                ret += String(array[i])
            }
        } else if i%2 == 1 {
                ret += String(array[i])
        }
    }
    return ret.isEmpty ? "EMPTY" : ret
}

solution24("abc1abc1abc")

func solution23(_ a:Int, _ b:Int, _ flag:Bool) -> Int {
    return flag ? a+b : a-b
}

func solution22(_ a:Int, _ b:Int, _ flag:Bool) -> Int {
    return flag ? a+b : a-b
}

func solution21(_ a: Int, _ b: Int) -> Int {
    let n1 = Int(truncating: NSDecimalNumber(decimal: pow(10, String(b).count)*Decimal(a)+Decimal(b)))
    let n2 = Int(truncating: NSDecimalNumber(decimal: pow(10, String(a).count)*Decimal(b)+Decimal(a)))
    
    return max(n1, n2)
}

/* 옹알이 (1)

 - 머쓱이는 태어난 지 6개월 된 조카를 돌보고 있습니다. 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음을 최대 한 번씩 사용해 조합한(이어 붙인) 발음밖에 하지 못합니다. 문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.
*/
//"aya", "ye", "woo", "ma"
func solution20(_ babbling:[String]) -> Int {
    babbling.filter{
        $0.replacingOccurrences(of: "aya", with: " ").replacingOccurrences(of: "ye", with: " ").replacingOccurrences(of: "woo", with: " ").replacingOccurrences(of: "ma", with: " ").trimmingCharacters(in: .whitespacesAndNewlines)
        == ""
    }.count
}

solution20(["aya", "yee", "u", "maa", "wyeoo"])

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
