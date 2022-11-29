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

/* JadenCase 문자열 만들기

 - JadenCase란 모든 단어의 첫 문자가 대문자이고, 그 외의 알파벳은 소문자인 문자열입니다. 단, 첫 문자가 알파벳이 아닐 때에는 이어지는 알파벳은 소문자로 쓰면 됩니다. (첫 번째 입출력 예 참고)
 문자열 s가 주어졌을 때, s를 JadenCase로 바꾼 문자열을 리턴하는 함수, solution을 완성해주세요.

 제한 조건
 s는 길이 1 이상 200 이하인 문자열입니다.
 s는 알파벳과 숫자, 공백문자(" ")로 이루어져 있습니다.
 숫자는 단어의 첫 문자로만 나옵니다.
 숫자로만 이루어진 단어는 없습니다.
 공백문자가 연속해서 나올 수 있습니다.
*/
func solution11(_ s:String) -> String {
    if s.count == 1 {
        return s.uppercased()
    }
    let list:[String] = s.components(separatedBy: " ")
    var result:String = ""
    for i in 0...list.count-1 {
        if list[i].count == 0 {
            
        } else if list[i].count == 1 {
            result += list[i].uppercased()
        } else {
            var strList:[Character] = Array(list[i])
        result += String(strList.removeFirst()).uppercased() + String(strList).lowercased()
        }
        result += (i == list.count-1 ? "" : " ")
    }
    return result
}

solution11("3people unFollowed me")

/* 행렬의 곱셈

 - 2차원 행렬 arr1과 arr2를 입력받아, arr1에 arr2를 곱한 결과를 반환하는 함수, solution을 완성해주세요.
 
 제한 조건
 행렬 arr1, arr2의 행과 열의 길이는 2 이상 100 이하입니다.
 행렬 arr1, arr2의 원소는 -10 이상 20 이하인 자연수입니다.
 곱할 수 있는 배열만 주어집니다.
*/
func solution10(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    for i in 0...arr1.count-1 {
        var list:[Int] = []
        for j in 0...arr2[0].count-1 {
            var num:Int = 0
            for k in 0...arr1[0].count-1 {
                num += arr1[i][k]*arr2[k][j]
            }
            list.append(num)
        }
        result.append(list)
    }
    return result
}

solution10([[2, 3, 2], [4, 2, 4], [3, 1, 4]],[[5, 4, 3], [2, 4, 1], [3, 1, 1]])
solution10([[1, 4], [3, 2], [4, 1]],[[3, 3], [3, 3]])

/* 하노이의 탑

 - 하노이 탑(Tower of Hanoi)은 퍼즐의 일종입니다. 세 개의 기둥과 이 기동에 꽂을 수 있는 크기가 다양한 원판들이 있고, 퍼즐을 시작하기 전에는 한 기둥에 원판들이 작은 것이 위에 있도록 순서대로 쌓여 있습니다. 게임의 목적은 다음 두 가지 조건을 만족시키면서, 한 기둥에 꽂힌 원판들을 그 순서 그대로 다른 기둥으로 옮겨서 다시 쌓는 것입니다.
 
 한 번에 하나의 원판만 옮길 수 있습니다.
 큰 원판이 작은 원판 위에 있어서는 안됩니다.
 하노이 탑의 세 개의 기둥을 왼쪽 부터 1번, 2번, 3번이라고 하겠습니다. 1번에는 n개의 원판이 있고 이 n개의 원판을 3번 원판으로 최소 횟수로 옮기려고 합니다.

 1번 기둥에 있는 원판의 개수 n이 매개변수로 주어질 때, n개의 원판을 3번 원판으로 최소로 옮기는 방법을 return하는 solution를 완성해주세요.

 제한사항
 n은 15이하의 자연수 입니다.
*/
// TODO
func solution9(_ n:Int) -> [[Int]] {
    return []
}

/* 피보나치 수

 - 피보나치 수는 F(0) = 0, F(1) = 1일 때, 1 이상의 n에 대하여 F(n) = F(n-1) + F(n-2) 가 적용되는 수 입니다.
 
 예를들어

 F(2) = F(0) + F(1) = 0 + 1 = 1
 F(3) = F(1) + F(2) = 1 + 1 = 2
 F(4) = F(2) + F(3) = 1 + 2 = 3
 F(5) = F(3) + F(4) = 2 + 3 = 5
 와 같이 이어집니다.

 2 이상의 n이 입력되었을 때, n번째 피보나치 수를 1234567으로 나눈 나머지를 리턴하는 함수, solution을 완성해 주세요.

 제한 사항
 n은 2 이상 100,000 이하인 자연수입니다.
*/
func solution8(_ n:Int) -> Int {
    var first:Int = 0
    var second:Int = 1
    var result:Int = 0
    for _ in 2...n {
        result = (first+second)%1234567
        first = second%1234567
        second = result%1234567
    }
    return result
}

/* 최솟값 만들기

 - 길이가 같은 배열 A, B 두개가 있습니다. 각 배열은 자연수로 이루어져 있습니다.
 배열 A, B에서 각각 한 개의 숫자를 뽑아 두 수를 곱합니다. 이러한 과정을 배열의 길이만큼 반복하며, 두 수를 곱한 값을 누적하여 더합니다. 이때 최종적으로 누적된 값이 최소가 되도록 만드는 것이 목표입니다. (단, 각 배열에서 k번째 숫자를 뽑았다면 다음에 k번째 숫자는 다시 뽑을 수 없습니다.)

 예를 들어 A = [1, 4, 2] , B = [5, 4, 4] 라면

 A에서 첫번째 숫자인 1, B에서 첫번째 숫자인 5를 뽑아 곱하여 더합니다. (누적된 값 : 0 + 5(1x5) = 5)
 A에서 두번째 숫자인 4, B에서 세번째 숫자인 4를 뽑아 곱하여 더합니다. (누적된 값 : 5 + 16(4x4) = 21)
 A에서 세번째 숫자인 2, B에서 두번째 숫자인 4를 뽑아 곱하여 더합니다. (누적된 값 : 21 + 8(2x4) = 29)
 즉, 이 경우가 최소가 되므로 29를 return 합니다.

 배열 A, B가 주어질 때 최종적으로 누적된 최솟값을 return 하는 solution 함수를 완성해 주세요.

 제한사항
 배열 A, B의 크기 : 1,000 이하의 자연수
 배열 A, B의 원소의 크기 : 1,000 이하의 자연수
*/
func solution7(_ A:[Int], _ B:[Int]) -> Int {
    var result:Int = 0
    let aList:[Int] = A.sorted(by: >)
    let bList:[Int] = B.sorted(by: <)
    for i in 0...aList.count-1 {
        result += aList[i]*bList[i]
    }
    return result
}

/* 최댓값과 최솟값

 - 문자열 s에는 공백으로 구분된 숫자들이 저장되어 있습니다. str에 나타나는 숫자 중 최소값과 최대값을 찾아 이를 "(최소값) (최대값)"형태의 문자열을 반환하는 함수, solution을 완성하세요.
 예를들어 s가 "1 2 3 4"라면 "1 4"를 리턴하고, "-1 -2 -3 -4"라면 "-4 -1"을 리턴하면 됩니다.

 제한 조건
 s에는 둘 이상의 정수가 공백으로 구분되어 있습니다.
*/
func solution6(_ s:String) -> String {
    var list:[Int] = s.components(separatedBy: " ").map {
        Int($0) ?? 0
    }.sorted(by: <)
    let min:Int = list[0]
    let max:Int = list[list.count-1]
    return "\(min) \(max)"
}

/* 멀리 뛰기

 - 효진이는 멀리 뛰기를 연습하고 있습니다. 효진이는 한번에 1칸, 또는 2칸을 뛸 수 있습니다. 칸이 총 4개 있을 때, 효진이는
 (1칸, 1칸, 1칸, 1칸)
 (1칸, 2칸, 1칸)
 (1칸, 1칸, 2칸)
 (2칸, 1칸, 1칸)
 (2칸, 2칸)
 의 5가지 방법으로 맨 끝 칸에 도달할 수 있습니다. 멀리뛰기에 사용될 칸의 수 n이 주어질 때, 효진이가 끝에 도달하는 방법이 몇 가지인지 알아내, 여기에 1234567를 나눈 나머지를 리턴하는 함수, solution을 완성하세요. 예를 들어 4가 입력된다면, 5를 return하면 됩니다.

 제한 사항
 n은 1 이상, 2000 이하인 정수입니다.
*/
// TODO
var oneCount = 100
var twoCount = 10
var dd = (oneCount+1...oneCount+twoCount).reduce(1, *)
dd
func solution5(_ n:Int) -> Int {
    var result: Int = 0
    for i in 0...n/2 {
        let oneCount = n - i*2
        let twoCount = i
        if twoCount == 0 || oneCount == 0 {
            result += 1
        } else if oneCount > twoCount {
            (oneCount+1...oneCount+twoCount).reduce(1, *)/(1...twoCount).reduce(1, *)
        } else {
            (twoCount+1...oneCount+twoCount).reduce(1, *)/(1...oneCount).reduce(1, *)
        }
    }
    
    return result
}

solution5(2000)

/* 땅따먹기

 - 땅따먹기 게임을 하려고 합니다. 땅따먹기 게임의 땅(land)은 총 N행 4열로 이루어져 있고, 모든 칸에는 점수가 쓰여 있습니다. 1행부터 땅을 밟으며 한 행씩 내려올 때, 각 행의 4칸 중 한 칸만 밟으면서 내려와야 합니다. 단, 땅따먹기 게임에는 한 행씩 내려올 때, 같은 열을 연속해서 밟을 수 없는 특수 규칙이 있습니다.
 
 예를 들면,

 | 1 | 2 | 3 | 5 |

 | 5 | 6 | 7 | 8 |

 | 4 | 3 | 2 | 1 |

 로 땅이 주어졌다면, 1행에서 네번째 칸 (5)를 밟았으면, 2행의 네번째 칸 (8)은 밟을 수 없습니다.

 마지막 행까지 모두 내려왔을 때, 얻을 수 있는 점수의 최대값을 return하는 solution 함수를 완성해 주세요. 위 예의 경우, 1행의 네번째 칸 (5), 2행의 세번째 칸 (7), 3행의 첫번째 칸 (4) 땅을 밟아 16점이 최고점이 되므로 16을 return 하면 됩니다.

 제한사항
 행의 개수 N : 100,000 이하의 자연수
 열의 개수는 4개이고, 땅(land)은 2차원 배열로 주어집니다.
 점수 : 100 이하의 자연수
*/
// TODO
func solution4(_ land:[[Int]]) -> Int {
    var result = 0
    var index = -1
    for i in land {
        var max = i.sorted(by: >)[0]
        if i.firstIndex(of: max) != index {
            result += max
            index = i.firstIndex(of: max)!
        } else {
            result += i.sorted(by: >)[1]
            index = i.firstIndex(of: i.sorted(by: >)[1]) ?? 0
        }
    }
    return result
}

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
// TODO
func solution1(_ board:[[Int]]) -> Int {
    var result:Int = board.count
    for i in board.count...0 {
        
    }
    return result
}
