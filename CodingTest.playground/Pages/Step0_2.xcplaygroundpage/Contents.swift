import Foundation

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
