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

/* 암호 해독

 - 군 전략가 머쓱이는 전쟁 중 적군이 다음과 같은 암호 체계를 사용한다는 것을 알아냈습니다.
 
 암호화된 문자열 cipher를 주고받습니다.
 그 문자열에서 code의 배수 번째 글자만 진짜 암호입니다.
 문자열 cipher와 정수 code가 매개변수로 주어질 때 해독된 암호 문자열을 return하도록 solution 함수를 완성해주세요.
*/
func solution19(_ cipher:String, _ code:Int) -> String {
    var result:String = ""
    var list = Array(cipher)
    for i in 1...cipher.count {
        if i%code == 0 {
           result += String(list[i-1])
        }
    }
    return result
}

/* 369게임

 - 머쓱이는 친구들과 369게임을 하고 있습니다. 369게임은 1부터 숫자를 하나씩 대며 3, 6, 9가 들어가는 숫자는 숫자 대신 3, 6, 9의 개수만큼 박수를 치는 게임입니다. 머쓱이가 말해야하는 숫자 order가 매개변수로 주어질 때, 머쓱이가 쳐야할 박수 횟수를 return 하도록 solution 함수를 완성해보세요.
*/
func solution18(_ order:Int) -> Int {
    String(order).filter {
        String($0) == "3" || String($0) == "6" || String($0) == "9"
    }.count
}

/* 가까운 수

 - 정수 배열 array와 정수 n이 매개변수로 주어질 때, array에 들어있는 정수 중 n과 가장 가까운 수를 return 하도록 solution 함수를 완성해주세요.
*/
func solution17(_ array:[Int], _ n:Int) -> Int {
    array.sorted().sorted {
        abs($0-n) < abs($1-n)
    }[0]
}

solution17([3, 10, 28], 20)

/* 삼각형의 완성조건 (1)

 - 선분 세 개로 삼각형을 만들기 위해서는 다음과 같은 조건을 만족해야 합니다.
 
 가장 긴 변의 길이는 다른 두 변의 길이의 합보다 작아야 합니다.
 삼각형의 세 변의 길이가 담긴 배열 sides이 매개변수로 주어집니다. 세 변으로 삼각형을 만들 수 있다면 1, 만들 수 없다면 2를 return하도록 solution 함수를 완성해주세요.
*/
func solution16(_ sides:[Int]) -> Int {
    let sorted:[Int] = sides.sorted(by: >)
    return sorted[0] < sorted[1]+sorted[2] ? 1 : 2
}

/* 중복된 문자 제거

 - 문자열 my_string이 매개변수로 주어집니다. my_string에서 중복된 문자를 제거하고 하나의 문자만 남긴 문자열을 return하도록 solution 함수를 완성해주세요.
*/
func solution15(_ my_string:String) -> String {
    var result:String = ""
    my_string.map {
        if !result.contains($0) {
            result += String($0)
        }
    }
    return result
}

solution15("people")

/* k의 개수

 - 1부터 13까지의 수에서, 1은 1, 10, 11, 12, 13 이렇게 총 6번 등장합니다. 정수 i, j, k가 매개변수로 주어질 때, i부터 j까지 k가 몇 번 등장하는지 return 하도록 solution 함수를 완성해주세요.
*/
func solution14(_ i:Int, _ j:Int, _ k:Int) -> Int {
    var str:String = ""
    for num in i...j {
        str += "\(num)"
    }
    return str.filter{ String($0) == "\(k)" }.count
}

solution14(1,5,1)

/* A로 B 만들기

 - 문자열 before와 after가 매개변수로 주어질 때, before의 순서를 바꾸어 after를 만들 수 있으면 1을, 만들 수 없으면 0을 return 하도록 solution 함수를 완성해보세요.
*/
func solution13(_ before: String, _ after: String) -> Int { Array(before).sorted() == Array(after).sorted() ? 1 : 0 }

func solution12(_ before:String, _ after:String) -> Int {
    before.compactMap{ String($0) }.sorted().joined()
    == after.compactMap{ String($0) }.sorted().joined() ? 1 : 0
}

solution12("olleh", "hello")

/* 이진수 더하기

 - 이진수를 의미하는 두 개의 문자열 bin1과 bin2가 매개변수로 주어질 때, 두 이진수의 합을 return하도록 solution 함수를 완성해주세요.
*/
func solution11(_ bin1:String, _ bin2:String) -> String {
    String(Int(bin1, radix: 2)! + Int(bin2, radix: 2)!, radix: 2)
}

solution11("10", "11")

/* 치킨 쿠폰

 - 프로그래머스 치킨은 치킨을 시켜먹으면 한 마리당 쿠폰을 한 장 발급합니다. 쿠폰을 열 장 모으면 치킨을 한 마리 서비스로 받을 수 있고, 서비스 치킨에도 쿠폰이 발급됩니다. 시켜먹은 치킨의 수 chicken이 매개변수로 주어질 때 받을 수 있는 최대 서비스 치킨의 수를 return하도록 solution 함수를 완성해주세요.
*/
func solution10(_ chicken:Int) -> Int {
    var chickenCount:Int = chicken
    var service:Int = 0
    while chickenCount/10 > 0 {
        service += chickenCount/10
        chickenCount = chickenCount/10 + chickenCount%10
    }
    return service
}

solution10(1081)

/* 로그인 성공?

 - 머쓱이는 프로그래머스에 로그인하려고 합니다. 머쓱이가 입력한 아이디와 패스워드가 담긴 배열 id_pw와 회원들의 정보가 담긴 2차원 배열 db가 주어질 때, 다음과 같이 로그인 성공, 실패에 따른 메시지를 return하도록 solution 함수를 완성해주세요.
 
 아이디와 비밀번호가 모두 일치하는 회원정보가 있으면 "login"을 return합니다.
 로그인이 실패했을 때 아이디가 일치하는 회원이 없다면 “fail”를, 아이디는 일치하지만 비밀번호가 일치하는 회원이 없다면 “wrong pw”를 return 합니다.
*/
func solution9(_ id_pw:[String], _ db:[[String]]) -> String {
    for data in db {
        if id_pw[0] == data[0] {
            if id_pw[1] == data[1] {
                return "login"
            } else {
                return "wrong pw"
            }
        }
    }
    return "fail"
}

/* 등수 매기기

 - 영어 점수와 수학 점수의 평균 점수를 기준으로 학생들의 등수를 매기려고 합니다. 영어 점수와 수학 점수를 담은 2차원 정수 배열 score가 주어질 때, 영어 점수와 수학 점수의 평균을 기준으로 매긴 등수를 담은 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution8(_ score: [[Int]]) -> [Int] {
    return score.map { Double($0.reduce(0, +)) / Double($0.count) }.map { score.map { Double($0.reduce(0, +)) / Double($0.count) }.sorted(by: >).firstIndex(of: $0)! + 1 }
}

func solution7(_ score:[[Int]]) -> [Int] {
    var list:[Double] = score.map{ Double($0[0]+$0[1])/Double(2) }
    var sorted:[Double] = list.sorted(by: >)
    return list.map {
        (sorted.firstIndex(of:$0) ?? 0)+1
    }
}

solution7([[80, 70], [90, 50], [40, 70], [50, 80]])

/* 특이한 정렬

 - 정수 n을 기준으로 n과 가까운 수부터 정렬하려고 합니다. 이때 n으로부터의 거리가 같다면 더 큰 수를 앞에 오도록 배치합니다. 정수가 담긴 배열 numlist와 정수 n이 주어질 때 numlist의 원소를 n으로부터 가까운 순서대로 정렬한 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution6(_ numlist:[Int], _ n:Int) -> [Int] {
    return numlist.sorted(by: >).sorted {
            abs($0-n) < abs($1-n)
    }
}

solution6([1,2,3,4,5], 3)

/* 유한소수 판별하기

 - 소수점 아래 숫자가 계속되지 않고 유한개인 소수를 유한소수라고 합니다. 분수를 소수로 고칠 때 유한소수로 나타낼 수 있는 분수인지 판별하려고 합니다. 유한소수가 되기 위한 분수의 조건은 다음과 같습니다.
 
 기약분수로 나타내었을 때, 분모의 소인수가 2와 5만 존재해야 합니다.
 두 정수 a와 b가 매개변수로 주어질 때, a/b가 유한소수이면 1을, 무한소수라면 2를 return하도록 solution 함수를 완성해주세요.
*/
func gcd(_ a: Int, _ b: Int) -> Int{
    if (b == 0) { return a }
    return gcd(b, a % b)
}

func solution5(_ a:Int, _ b:Int) -> Int {
    var num:Int = b/gcd(a,b)
    while num%2 == 0 {
        num /= 2
    }
    while num%5 == 0 {
        num /= 5
    }
    return num == 1 ? 1 : 2
}

solution5(11,22)

/* 겹치는 선분의 길이

 - 빨간색, 초록색, 파란색 선분이 x축 위에 있습니다. 세 선분의 x좌표 시작과 끝이 [[start, end], [start, end], [start, end]] 형태로 들어있는 2차원 배열 lines가 매개변수로 주어질 때, 두 개 이상의 선분이 겹치는 부분의 길이를return 하도록 solution 함수를 완성해보세요.
 
 lines가 [[0, 2], [-3, -1], [-2, 1]]일 때 그림으로 나타내면 다음과 같습니다.

 선분이 두 개 이상 겹친 곳은 [-2, -1], [0, 1]로 2만큼 겹쳐있습니다.
*/
func solution4(_ lines:[[Int]]) -> Int {
    var result = Set<Int>()
    for i in lines[0][0]+1...lines[0][1] {
        if (i > lines[1][0] && i <= lines[1][1]) ||
            (i > lines[2][0] && i <= lines[2][1]) {
            result.insert(i)
        }
    }
    for i in lines[1][0]+1...lines[1][1] {
        if (i > lines[2][0] && i <= lines[2][1]) {
            result.insert(i)
        }
    }
    return result.count
}

/* 평행

 - 점 네 개의 좌표를 담은 이차원 배열  dots가 다음과 같이 매개변수로 주어집니다.
 
 [[x1, y1], [x2, y2], [x3, y3], [x4, y4]]
 주어진 네 개의 점을 두 개씩 이었을 때, 두 직선이 평행이 되는 경우가 있으면 1을 없으면 0을 return 하도록 solution 함수를 완성해보세요.
*/
func solution3(_ dots:[[Int]]) -> Int {
    if Double(dots[0][1] - dots[1][1])/Double(dots[0][0]-dots[1][0])
    == Double(dots[2][1] - dots[3][1])/Double(dots[2][0]-dots[3][0]) {
        return 1
    }
    if Double(dots[0][1] - dots[2][1])/Double(dots[0][0]-dots[2][0])
    == Double(dots[1][1] - dots[3][1])/Double(dots[1][0]-dots[3][0]) {
        return 1
    }
    if Double(dots[0][1] - dots[3][1])/Double(dots[0][0]-dots[3][0])
    == Double(dots[2][1] - dots[1][1])/Double(dots[2][0]-dots[1][0]) {
        return 1
    }
    return 0
}

/* 저주의 숫자 3

 - 3x 마을 사람들은 3을 저주의 숫자라고 생각하기 때문에 3의 배수와 숫자 3을 사용하지 않습니다. 3x 마을 사람들의 숫자는 다음과 같습니다.
 
 10진법    3x 마을에서 쓰는 숫자    10진법    3x 마을에서 쓰는 숫자
 1    1    6    8
 2    2    7    10
 3    4    8    11
 4    5    9    14
 5    7    10    16
 정수 n이 매개변수로 주어질 때, n을 3x 마을에서 사용하는 숫자로 바꿔 return하도록 solution 함수를 완성해주세요.
*/
func solution2(_ n: Int) -> Int {
    var answer = 0

    for i in 1..<n + 1 {
        answer += 1
        while answer % 3 == 0 || String(answer).contains("3") {
            answer += 1
        }
    }
    return answer
}

func solution(_ n:Int) -> Int {
    var result:Int = 0
    var list:[Int] = []
    while list.count != n {
        result += 1
        if (result%3 != 0 && !String(result).contains("3")) {
            list.append(result)
        }
    }
    return result
}

solution(15)
