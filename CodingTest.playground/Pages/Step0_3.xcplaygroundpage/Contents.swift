import Foundation

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
