import Foundation

/* 개미 군단

 - 개미 군단이 사냥을 나가려고 합니다. 개미군단은 사냥감의 체력에 딱 맞는 병력을 데리고 나가려고 합니다. 장군개미는 5의 공격력을, 병정개미는 3의 공격력을 일개미는 1의 공격력을 가지고 있습니다. 예를 들어 체력 23의 여치를 사냥하려고 할 때, 일개미 23마리를 데리고 가도 되지만, 장군개미 네 마리와 병정개미 한 마리를 데리고 간다면 더 적은 병력으로 사냥할 수 있습니다. 사냥감의 체력 hp가 매개변수로 주어질 때, 사냥감의 체력에 딱 맞게 최소한의 병력을 구성하려면 몇 마리의 개미가 필요한지를 return하도록 solution 함수를 완성해주세요.
*/
func solution23(_ hp:Int) -> Int {
    let five:Int = 5
    let three:Int = 3
    let one:Int = 1
    var result:Int = 0
    result += hp/five
    result += (hp%five)/three
    result += (hp%five)%three
    return result
}

/* 순서쌍의 개수

 - 순서쌍이란 두 개의 숫자를 순서를 정하여 짝지어 나타낸 쌍으로 (a, b)로 표기합니다. 자연수 n이 매개변수로 주어질 때 두 숫자의 곱이 n인 자연수 순서쌍의 개수를 return하도록 solution 함수를 완성해주세요.
*/
func solution22(_ n: Int) -> Int { (1...n).filter { n % $0 == 0 }.count }

func solution21(_ n:Int) -> Int {
    var result: Int = 1
    if n == 1 {
        return 1
    }
    for i in 1...n/2 {
        if n % i == 0 {
            result += 1
        }
    }
    return result
}

/* 진료 순서 정하기

 - 외과의사 머쓱이는 응급실에 온 환자의 응급도를 기준으로 진료 순서를 정하려고 합니다. 정수 배열 emergency가 매개변수로 주어질 때 응급도가 높은 순서대로 진료 순서를 정한 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution20(_ emergency:[Int]) -> [Int] {
    emergency.map {
        emergency.sorted(by: > ).firstIndex(of: $0)!+1
    }
}

func solution19(_ emergency:[Int]) -> [Int] {
    var dic:Dictionary<Int,Int> = [:]
    var i = 1
    emergency.sorted{ $0 > $1 }.map {
        dic[$0] = i
        i += 1
    }
    var result:[Int] = []
    for i in emergency {
        if let num = dic[i] {
            result.append(num)
        }
    }
    return result
}

solution20([3, 76, 24])

/* 외계행성의 나이

 - 우주여행을 하던 머쓱이는 엔진 고장으로 PROGRAMMERS-962 행성에 불시착하게 됐습니다. 입국심사에서 나이를 말해야 하는데, PROGRAMMERS-962 행성에서는 나이를 알파벳으로 말하고 있습니다. a는 0, b는 1, c는 2, ..., j는 9입니다. 예를 들어 23살은 cd, 51살은 fb로 표현합니다. 나이 age가 매개변수로 주어질 때 PROGRAMMER-962식 나이를 return하도록 solution 함수를 완성해주세요.
*/
func solution18(_ age:Int) -> String {
    let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    return String(age).map{alphabet[Int(String($0))!]}.joined()
}

func solution17(_ age:Int) -> String {
    let alphabet:String = "abcdefghij"
    var result:String = ""
    var num:Int = age
    while num>0 {
        var index:Int = num%10
        num = num/10
        result = String(alphabet[alphabet.index(alphabet.startIndex, offsetBy: index)]) + result
    }
    return result
}

solution17(23)

/* 배열 자르기

 - 정수 배열 numbers와 정수 num1, num2가 매개변수로 주어질 때, numbers의 num1번 째 인덱스부터 num2번째 인덱스까지 자른 정수 배열을 return 하도록 solution 함수를 완성해보세요.
*/
func solution16(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    return (num1...num2).map{numbers[$0]}
}

func solution15(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    guard numbers.count > num1 && numbers.count > num2 && num2 >= num1 else { return [] }
    return Array(numbers[num1...num2])
}

solution15([1,2,3,4,5], 0, 2)

/* 짝수의 합

 - 정수 n이 주어질 때, n이하의 짝수를 모두 더한 값을 return 하도록 solution 함수를 작성해주세요.
*/
func solution14(_ n:Int) -> Int { (1...n).filter {$0 % 2 == 0}.reduce(0,+) }

solution14(4)

/* 양꼬치

 - 머쓱이네 양꼬치 가게는 10인분을 먹으면 음료수 하나를 서비스로 줍니다. 양꼬치는 1인분에 12,000원, 음료수는 2,000원입니다. 정수 n과 k가 매개변수로 주어졌을 때, 양꼬치 n인분과 음료수 k개를 먹었다면 총얼마를 지불해야 하는지 return 하도록 solution 함수를 완성해보세요.
*/
func solution13(_ n:Int, _ k:Int) -> Int {
    guard (n > 0 && n < 1000), ((k >= (n / 10)) && k < 1000) else {
        return 0
    }
    let ramPrice: Int = 12000
    let drinkPrice: Int = 2000
    return (n * ramPrice) + ( (k - (n/10)) * drinkPrice)
}

func solution12(_ n:Int, _ k:Int) -> Int {
    var service:Int = n/10
    var price1:Int = n*12000
    var price2:Int = k-service > 0 ? (k-service)*2000 : 0
    return price1 + price2
}

solution12(10,3)

/* 각도기

 - 각에서 0도 초과 90도 미만은 예각, 90도는 직각, 90도 초과 180도 미만은 둔각 180도는 평각으로 분류합니다. 각 angle이 매개변수로 주어질 때 예각일 때 1, 직각일 때 2, 둔각일 때 3, 평각일 때 4를 return하도록 solution 함수를 완성해주세요.
 
 예각 : 0 < angle < 90
 직각 : angle = 90
 둔각 : 90 < angle < 180
 평각 : angle = 180
*/
func solution11(_ angle:Int) -> Int {
    angle < 90 ? 1 :
    angle == 90 ? 2 :
    angle < 180 ? 3 : 4
}

/* 특정 문자 제거하기

 - 문자열 my_string과 문자 letter이 매개변수로 주어집니다. my_string에서 letter를 제거한 문자열을 return하도록 solution 함수를 완성해주세요.
*/
func solution10(_ my_string:String, _ letter:String) -> String {
    return my_string.replacingOccurrences(of: letter, with: "")
}

func solution9(_ my_string:String, _ letter:String) -> String {
    return my_string.filter{String($0) != letter}
}

func solution8(_ my_string:String, _ letter:String) -> String { my_string.replacingOccurrences(of: letter, with: "", options: NSString.CompareOptions.literal, range: nil) }

solution8("hello", "h")

/* 문자 반복 출력하기
 
 - 문자열 my_string과 정수 n이 매개변수로 주어질 때, my_string에 들어있는 각 문자를 n만큼 반복한 문자열을 return 하도록 solution 함수를 완성해보세요.
*/
func solution7(_ my_string:String, _ n:Int) -> String {
    var result:String = ""
    for str in my_string {
        result += String(repeating: str, count: n)
    }
    return result
}

solution7("hello", 4)

/* 짝수 홀수 개수
 
 - 정수가 담긴 리스트 num_list가 주어질 때, num_list의 원소 중 짝수와 홀수의 개수를 담은 배열을 return 하도록 solution 함수를 완성해보세요.
*/
func solution6(_ numList: [Int]) -> [Int] { [numList.filter { $0 % 2 == 0 }.count, numList.filter { $0 % 2 == 1 }.count] }

func solution5(_ num_list:[Int]) -> [Int] {
    var even:Int = 0
    var odd:Int = 0
    for i in num_list {
        if i % 2 == 0 {
            even += 1
        } else {
            odd += 1
        }
    }
    return [even, odd]
}

solution5([1, 2, 3, 4, 5])

/* 직각삼각형 출력하기

 - "*"의 높이와 너비를 1이라고 했을 때, "*"을 이용해 직각 이등변 삼각형을 그리려고합니다. 정수 n 이 주어지면 높이와 너비가 n 인 직각 이등변 삼각형을 출력하도록 코드를 작성해보세요.
*/
//let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let n = [5]

let length = n.first!
for i in (1...length) {
    print(String(repeating: "*", count: i))
}

for i in 1...n[0] {
    var star:String = ""
    for j in 1...i {
        star += "*"
    }
    print(star)
}

/* 문자열 뒤집기

 - 문자열 my_string이 매개변수로 주어집니다. my_string을 거꾸로 뒤집은 문자열을 return하도록 solution 함수를 완성해주세요.
*/
func solution4(_ my_string:String) -> String { String(my_string.reversed()) }

solution4("jaron")

/* 배열 뒤집기

 - 정수가 들어 있는 배열 num_list가 매개변수로 주어집니다. num_list의 원소의 순서를 거꾸로 뒤집은 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution3(_ numList: [Int]) -> [Int] { numList.reversed() }

func solution2(_ num_list:[Int]) -> [Int] {
    var result:[Int] = []
    for num in num_list {
        result.insert(num, at: 0)
    }
    return result
}

solution2([1,2,3,4,5])

/* 나이 출력

 - 머쓱이는 40살인 선생님이 몇 년도에 태어났는지 궁금해졌습니다. 나이 age가 주어질 때, 2022년을 기준 출생 연도를 return 하는 solution 함수를 완성해주세요.
*/
func solution(_ age:Int) -> Int { 2022-age+1 }
