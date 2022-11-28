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

/*

 -
*/

/* 다음 큰 숫자

 - 자연수 n이 주어졌을 때, n의 다음 큰 숫자는 다음과 같이 정의 합니다.
 
 조건 1. n의 다음 큰 숫자는 n보다 큰 자연수 입니다.
 조건 2. n의 다음 큰 숫자와 n은 2진수로 변환했을 때 1의 갯수가 같습니다.
 조건 3. n의 다음 큰 숫자는 조건 1, 2를 만족하는 수 중 가장 작은 수 입니다.
 예를 들어서 78(1001110)의 다음 큰 숫자는 83(1010011)입니다.

 자연수 n이 매개변수로 주어질 때, n의 다음 큰 숫자를 return 하는 solution 함수를 완성해주세요.

 제한 사항
 n은 1,000,000 이하의 자연수 입니다.
*/
func solution3(_ n:Int) -> Int {
    var result:Int = n+1
    while true {
        if String(n, radix: 2).filter { $0 == "1" }.count == String(result, radix: 2).filter { $0 == "1" }.count {
            break
        } else {
            result += 1
        }
    }
    return result
}

/* 올바른 괄호

 - 괄호가 바르게 짝지어졌다는 것은 '(' 문자로 열렸으면 반드시 짝지어서 ')' 문자로 닫혀야 한다는 뜻입니다. 예를 들어
 
 "()()" 또는 "(())()" 는 올바른 괄호입니다.
 ")()(" 또는 "(()(" 는 올바르지 않은 괄호입니다.
 '(' 또는 ')' 로만 이루어진 문자열 s가 주어졌을 때, 문자열 s가 올바른 괄호이면 true를 return 하고, 올바르지 않은 괄호이면 false를 return 하는 solution 함수를 완성해 주세요.

 제한사항
 문자열 s의 길이 : 100,000 이하의 자연수
 문자열 s는 '(' 또는 ')' 로만 이루어져 있습니다.
*/
func solution2(_ s:String) -> Bool {
    var result:Bool = true
    var value:Int = 0
    for c in s {
        if c == "(" {
            value -= 1
        } else if c == ")" {
            value += 1
        }
        if value > 0 {
            result = false
            break
        }
    }
    if result && value != 0 {
        result = false
    }
    return result
}

/* 가장 큰 정사각형 찾기

 - 1와 0로 채워진 표(board)가 있습니다. 표 1칸은 1 x 1 의 정사각형으로 이루어져 있습니다. 표에서 1로 이루어진 가장 큰 정사각형을 찾아 넓이를 return 하는 solution 함수를 완성해 주세요. (단, 정사각형이란 축에 평행한 정사각형을 말합니다.)
 
 제한사항
 표(board)는 2차원 배열로 주어집니다.
 표(board)의 행(row)의 크기 : 1,000 이하의 자연수
 표(board)의 열(column)의 크기 : 1,000 이하의 자연수
 표(board)의 값은 1또는 0으로만 이루어져 있습니다.
*/
func solution1(_ board:[[Int]]) -> Int {
    var result:Int = board.count
    for i in board.count...0 {
        
    }
    return result
}
