import Foundation

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
