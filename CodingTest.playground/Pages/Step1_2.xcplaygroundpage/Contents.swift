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

/* 예산
 
 - S사에서는 각 부서에 필요한 물품을 지원해 주기 위해 부서별로 물품을 구매하는데 필요한 금액을 조사했습니다. 그러나, 전체 예산이 정해져 있기 때문에 모든 부서의 물품을 구매해 줄 수는 없습니다. 그래서 최대한 많은 부서의 물품을 구매해 줄 수 있도록 하려고 합니다.
 
 물품을 구매해 줄 때는 각 부서가 신청한 금액만큼을 모두 지원해 줘야 합니다. 예를 들어 1,000원을 신청한 부서에는 정확히 1,000원을 지원해야 하며, 1,000원보다 적은 금액을 지원해 줄 수는 없습니다.

 부서별로 신청한 금액이 들어있는 배열 d와 예산 budget이 매개변수로 주어질 때, 최대 몇 개의 부서에 물품을 지원할 수 있는지 return 하도록 solution 함수를 완성해주세요.

 제한사항
 d는 부서별로 신청한 금액이 들어있는 배열이며, 길이(전체 부서의 개수)는 1 이상 100 이하입니다.
 d의 각 원소는 부서별로 신청한 금액을 나타내며, 부서별 신청 금액은 1 이상 100,000 이하의 자연수입니다.
 budget은 예산을 나타내며, 1 이상 10,000,000 이하의 자연수입니다.
*/
func solution9(_ d:[Int], _ budget:Int) -> Int {
    var sorted = d.sorted()
    var count:Int = 0
    var b = budget
    while b > 0 && count < d.count {
        count += 1
        b -= sorted[count-1]
        if b < 0 {
            count -= 1
        }
    }
    return count
}

solution9([2, 2, 3, 3], 10)

/* 소수 만들기
 
 - 주어진 숫자 중 3개의 수를 더했을 때 소수가 되는 경우의 개수를 구하려고 합니다. 숫자들이 들어있는 배열 nums가 매개변수로 주어질 때, nums에 있는 숫자들 중 서로 다른 3개를 골라 더했을 때 소수가 되는 경우의 개수를 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 nums에 들어있는 숫자의 개수는 3개 이상 50개 이하입니다.
 nums의 각 원소는 1 이상 1,000 이하의 자연수이며, 중복된 숫자가 들어있지 않습니다.
*/
func solution8(_ nums:[Int]) -> Int {
    var answer = 0
    for i in 0...nums.count-3 {
        for j in 1...nums.count-2-i {
            for k in 1...nums.count-1-j-i {
                if isPrime(num: nums[i]+nums[i+j]+nums[i+j+k]) {
                    answer += 1
                }
            }
        }
    }
    return answer
}

func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

/* 직사각형 별찍기
 
 - 이 문제에는 표준 입력으로 두 개의 정수 n과 m이 주어집니다.
 별(*) 문자를 이용해 가로의 길이가 n, 세로의 길이가 m인 직사각형 형태를 출력해보세요.
*/
let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for i in 1...b {
    print(String(repeating: "*", count: a))
}

/* x만큼 간격이 있는 n개의 숫자
 
 - 함수 solution은 정수 x와 자연수 n을 입력 받아, x부터 시작해 x씩 증가하는 숫자를 n개 지니는 리스트를 리턴해야 합니다. 다음 제한 조건을 보고, 조건을 만족하는 함수, solution을 완성해주세요.
 
 제한 조건
 x는 -10000000 이상, 10000000 이하인 정수입니다.
 n은 1000 이하인 자연수입니다.
*/
func solution7(_ x:Int, _ n:Int) -> [Int64] {
    (1...n).map {
        Int64(x*$0)
    }
}

/* 행렬의 덧셈
 
 - 행렬의 덧셈은 행과 열의 크기가 같은 두 행렬의 같은 행, 같은 열의 값을 서로 더한 결과가 됩니다. 2개의 행렬 arr1과 arr2를 입력받아, 행렬 덧셈의 결과를 반환하는 함수, solution을 완성해주세요.
 
 제한 조건
 행렬 arr1, arr2의 행과 열의 길이는 500을 넘지 않습니다.
*/
func solution6(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result:[[Int]] = []
    for i in 0...arr1.count-1 {
        var row:[Int] = []
        for j in 0...arr1[0].count-1 {
            row.append(arr1[i][j] + arr2[i][j])
        }
        result.append(row)
    }
    return result
}

/* 핸드폰 번호 가리기
 
 - 프로그래머스 모바일은 개인정보 보호를 위해 고지서를 보낼 때 고객들의 전화번호의 일부를 가립니다.
 전화번호가 문자열 phone_number로 주어졌을 때, 전화번호의 뒷 4자리를 제외한 나머지 숫자를 전부 *으로 가린 문자열을 리턴하는 함수, solution을 완성해주세요.

 제한 조건
 phone_number는 길이 4 이상, 20이하인 문자열입니다.
*/
func solution5(_ phone_number:String) -> String {
    return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
}

func solution4(_ phone_number:String) -> String {
    String(repeating: "*", count: phone_number.count-4) +
    String(phone_number[String.Index(encodedOffset: phone_number.count-4)...String.Index(encodedOffset: phone_number.count-1)])
}

/* 하샤드 수
 
 - 양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다. 예를 들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다. 자연수 x를 입력받아 x가 하샤드 수인지 아닌지 검사하는 함수, solution을 완성해주세요.
 
 제한 조건
 x는 1 이상, 10000 이하인 정수입니다.
*/
func solution3(_ x:Int) -> Bool {
    x%String(x).map { Int(String($0)) ?? 0 }.reduce(0,+) == 0
}

/* 평균 구하기
 
 - 정수를 담고 있는 배열 arr의 평균값을 return하는 함수, solution을 완성해보세요.
*/
func solution2(_ arr:[Int]) -> Double {
    Double(arr.reduce(0,+))/Double(arr.count)
}

/* 콜라츠 추측
 
 - 1937년 Collatz란 사람에 의해 제기된 이 추측은, 주어진 수가 1이 될 때까지 다음 작업을 반복하면, 모든 수를 1로 만들 수 있다는 추측입니다. 작업은 다음과 같습니다.
 
 1-1. 입력된 수가 짝수라면 2로 나눕니다.
 1-2. 입력된 수가 홀수라면 3을 곱하고 1을 더합니다.
 2. 결과로 나온 수에 같은 작업을 1이 될 때까지 반복합니다.
 예를 들어, 주어진 수가 6이라면 6 → 3 → 10 → 5 → 16 → 8 → 4 → 2 → 1 이 되어 총 8번 만에 1이 됩니다. 위 작업을 몇 번이나 반복해야 하는지 반환하는 함수, solution을 완성해 주세요. 단, 주어진 수가 1인 경우에는 0을, 작업을 500번 반복할 때까지 1이 되지 않는다면 –1을 반환해 주세요.
*/
func solution1(_ num:Int) -> Int {
    if num == 1 {
        return 0
    }
    var result:Int = 1
    var value = num
    while result <= 500 {
        if value%2 == 0 {
            value /= 2
        } else {
            value *= 3
            value += 1
        }
        if value == 1 {
            return result
        }
        result += 1
    }
    return -1
}
