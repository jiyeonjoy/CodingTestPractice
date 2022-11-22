import Foundation

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
