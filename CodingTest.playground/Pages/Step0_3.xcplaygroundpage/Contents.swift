import Foundation

/* 소인수분해

 - 소인수분해란 어떤 수를 소수들의 곱으로 표현하는 것입니다. 예를 들어 12를 소인수 분해하면 2 * 2 * 3 으로 나타낼 수 있습니다. 따라서 12의 소인수는 2와 3입니다. 자연수 n이 매개변수로 주어질 때 n의 소인수를 오름차순으로 담은 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution18(_ n:Int) -> [Int] {
    if n == 2 { return [2] }
    var result:[Int] = []
    var num = n
    for i in 2...n {
        if num%i == 0 {
            result.append(i)
            while num%i == 0 {
                num /= i
            }
        }
        if num == 1 {
            break
        }
    }
    return result
}

solution18(420)

/* 숨어있는 숫자의 덧셈 (1)

 - 문자열 my_string이 매개변수로 주어집니다. my_string안의 모든 자연수들의 합을 return하도록 solution 함수를 완성해주세요.
*/
func solution17(_ my_string:String) -> Int {
     return my_string.compactMap{Int(String($0))}.reduce(0,+)
}

func solution16(_ my_string:String) -> Int { my_string.filter { $0.isNumber }.map{ Int(String($0)) ?? 0 }.reduce(0, +) }

solution16("aAb1B2cC34oOp")

/* 문자열 정렬하기 (1)

 - 문자열 my_string이 매개변수로 주어질 때, my_string 안에 있는 숫자만 골라 오름차순 정렬한 리스트를 return 하도록 solution 함수를 작성해보세요.
*/
func solution15(_ my_string:String) -> [Int] {
    return my_string.filter{$0.isNumber}.map{Int(String($0))!}.sorted(by: <)
}

func solution14(_ my_string:String) -> [Int] { my_string.filter {
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"].contains($0) }.map {
        Int(String($0)) ?? 0
    }.sorted()
}

solution14("1가나23")

/* 모음 제거

 - 영어에선 a, e, i, o, u 다섯 가지 알파벳을 모음으로 분류합니다. 문자열 my_string이 매개변수로 주어질 때 모음을 제거한 문자열을 return하도록 solution 함수를 완성해주세요.
*/
func solution13(_ my_string:String) -> String {
    return my_string.replacingOccurrences(of: "[aeiou]", with: "", options: .regularExpression)
}

func solution12(_ my_string:String) -> String {
    return my_string.components(separatedBy: ["a", "e", "i", "o", "u"]).joined()
}

func solution11(_ my_string:String) -> String {
    return my_string.filter { !["a", "e", "i", "o", "u"].contains($0)}
}

func solution10(_ my_string:String) -> String {
    my_string.replacingOccurrences(of: "a", with: "").replacingOccurrences(of: "e", with: "").replacingOccurrences(of: "i", with: "").replacingOccurrences(of: "o", with: "").replacingOccurrences(of: "u", with: "")
}

// time error
func solution9(_ my_string:String) -> String { my_string.filter{ String($0) != "a" && String($0) != "e" && String($0) != "i" && String($0) != "o" && String($0) != "u" }
}

solution9("nice to meet you")

/* 팩토리얼

 - i팩토리얼 (i!)은 1부터 i까지 정수의 곱을 의미합니다. 예를들어 5! = 5 * 4 * 3 * 2 * 1 = 120 입니다. 정수 n이 주어질 때 다음 조건을 만족하는 가장 큰 정수 i를 return 하도록 solution 함수를 완성해주세요.
 
 i! ≤ n
*/
func solution8(_ n:Int) -> Int {
    if n == 1 {
        return 1
    }
    var result: Int = 1
    var multiply: Int = 1
    while multiply <= n {
        result += 1
        multiply *= result
    }
    return result-1
}

/* 최댓값 만들기 (1)

 - 정수 배열 numbers가 매개변수로 주어집니다. numbers의 원소 중 두 개를 곱해 만들 수 있는 최댓값을 return하도록 solution 함수를 완성해주세요.
*/
func solution7(_ numbers:[Int]) -> Int {
    var sorted = numbers.sorted()
    return sorted[numbers.count-2] * sorted[numbers.count-1]
}

/* 합성수 찾기
 
 - 약수의 개수가 세 개 이상인 수를 합성수라고 합니다. 자연수 n이 매개변수로 주어질 때 n이하의 합성수의 개수를 return하도록 solution 함수를 완성해주세요.
*/
func solution6(_ n: Int) -> Int { (1...n).filter { i in (1...i).filter { i % $0 == 0 }.count > 2 }.count }

func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

func solution5(_ n:Int) -> Int {
    if n < 4 {
        return 0
    }
    return (4...n).filter { !isPrime(num: $0) }.count
}

/* 주사위의 개수
 
 - 머쓱이는 직육면체 모양의 상자를 하나 가지고 있는데 이 상자에 정육면체 모양의 주사위를 최대한 많이 채우고 싶습니다. 상자의 가로, 세로, 높이가 저장되어있는 배열 box와 주사위 모서리의 길이 정수 n이 매개변수로 주어졌을 때, 상자에 들어갈 수 있는 주사위의 최대 개수를 return 하도록 solution 함수를 완성해주세요.
*/
func solution4(_ box:[Int], _ n:Int) -> Int {
    guard box.count > 2 && box[0] >= n && box[1] >= n && box[2] >= n else {
        return 0
    }
    var result:Int = 1
    for size in box {
        result *= size/n
    }
    return result
}

solution4([10,8,6],3)

/* 배열 회전시키기
 
 - 정수가 담긴 배열 numbers와 문자열 direction가 매개변수로 주어집니다. 배열 numbers의 원소를 direction방향으로 한 칸씩 회전시킨 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution3(_ numbers: [Int], _ direction: String) -> [Int] {
    var mutableNumbers = numbers

    if direction == "right" {
        mutableNumbers.insert(mutableNumbers.last!, at: 0)
        mutableNumbers.removeLast()
    } else {
        mutableNumbers.append(mutableNumbers.first!)
        mutableNumbers.removeFirst()
    }
    return mutableNumbers
}

func solution2(_ numbers:[Int], _ direction:String) -> [Int] {
    var result:[Int] = []
    if direction == "left" {
        for i in 1...numbers.count-1 {
            result.append(numbers[i])
        }
        result.append(numbers[0])
    } else {
        result.append(numbers[numbers.count-1])
        for i in 0...numbers.count-2 {
            result.append(numbers[i])
        }
    }
    return result
}

/* 공 던지기
 
 - 머쓱이는 친구들과 동그랗게 서서 공 던지기 게임을 하고 있습니다. 공은 1번부터 던지며 오른쪽으로 한 명을 건너뛰고 그다음 사람에게만 던질 수 있습니다. 친구들의 번호가 들어있는 정수 배열 numbers와 정수 K가 주어질 때, k번째로 공을 던지는 사람의 번호는 무엇인지 return 하도록 solution 함수를 완성해보세요.
*/
func solution(_ numbers:[Int], _ k:Int) -> Int {
    numbers[((k*2-1)%numbers.count)-1]
}
