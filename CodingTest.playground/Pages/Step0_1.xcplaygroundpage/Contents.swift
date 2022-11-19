import Foundation

/* 중앙값 구하기

 - 중앙값은 어떤 주어진 값들을 크기의 순서대로 정렬했을 때 가장 중앙에 위치하는 값을 의미합니다. 예를 들어 1, 2, 7, 10, 11의 중앙값은 7입니다. 정수 배열 array가 매개변수로 주어질 때, 중앙값을 return 하도록 solution 함수를 완성해보세요.
*/
func solution10(_ array:[Int]) -> Int {
    var sortArray:[Int] = array
    sortArray.sort()
    var index = array.count / 2
    return sortArray[index]
}

func solution9(_ array: [Int]) -> Int { array.sorted()[array.count / 2] }

/* 나머지 구하기

 - 정수 num1, num2가 매개변수로 주어질 때, num1를 num2로 나눈 나머지를 return 하도록 solution 함수를 완성해주세요.
*/
func solution8(_ num1:Int, _ num2:Int) -> Int {
    return num1 % num2
}

/* 배열 두배 만들기
 
 - 정수 배열 numbers가 매개변수로 주어집니다. numbers의 각 원소에 두배한 원소를 가진 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution7(_ numbers: [Int]) -> [Int] { numbers.map { $0 * 2 } }

func solution6(_ numbers:[Int]) -> [Int] {
    var results:[Int] = []
    for num in numbers {
        results.append(num * 2)
    }
    return results
}

/* 분수의 덧셈
 
 - 첫 번째 분수의 분자와 분모를 뜻하는 denum1, num1, 두 번째 분수의 분자와 분모를 뜻하는 denum2, num2가 매개변수로 주어집니다. 두 분수를 더한 값을 기약 분수로 나타냈을 때 분자와 분모를 순서대로 담은 배열을 return 하도록 solution 함수를 완성해보세요.
*/
// 최대공약수
func gcd(_ a: Int, _ b: Int) -> Int{
    if (b == 0) { return a }
    return gcd(b, a % b)
}

// 최소공배수
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution5(_ denum1:Int, _ num1:Int, _ denum2:Int, _ num2:Int) -> [Int] {
    var mother:Int = lcm(num1, num2)
    var child:Int = ((mother/num1) * denum1) + ((mother/num2) * denum2)
    var gValue:Int = gcd(mother, child)
    
    return [child/gValue, mother/gValue]
}

/* 숫자 비교하기
 
 - 정수 num1과 num2가 매개변수로 주어집니다. 두 수가 같으면 1 다르면 -1을 return하도록 solution 함수를 완성해주세요.
*/
func solution4(_ num1:Int, _ num2:Int) -> Int {
    return num1 == num2 ? 1 : -1
}


var num: Int = 3
var num2: Int = 2
var num3: Double = Double(num)/Double(num2)
var num4: Int = Int(num3 * 1000)

/* 두 수의 나눗셈
 
 - 정수 num1과 num2가 매개변수로 주어질 때, num1을 num2로 나눈 값에 1,000을 곱한 후 정수 부분을 return 하도록 soltuion 함수를 완성해주세요.
*/
func solution3(_ num1:Int, _ num2:Int) -> Int {
    return Int((Double(num1) / Double(num2)) * 1000)
}

// for 문
func solution2(_ array:[Int], _ n:Int) -> Int {
    var result: Int = 0
    for i in array {
        if (i == n) {
            result += 1
        }
    }
    return result
}

func solution1(_ array:[Int], _ height:Int) -> Int {
    var result: Int = 0

    for data in array {
        if (height < data) {
            result += 1
        }
    }
    return result
}
