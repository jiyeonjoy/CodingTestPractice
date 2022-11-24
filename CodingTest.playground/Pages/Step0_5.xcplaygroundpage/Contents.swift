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
