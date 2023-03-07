import Foundation

/* N-Queen

 - 가로, 세로 길이가 n인 정사각형으로된 체스판이 있습니다. 체스판 위의 n개의 퀸이 서로를 공격할 수 없도록 배치하고 싶습니다.
 
 예를 들어서 n이 4인경우 다음과 같이 퀸을 배치하면 n개의 퀸은 서로를 한번에 공격 할 수 없습니다.
 
 체스판의 가로 세로의 세로의 길이 n이 매개변수로 주어질 때, n개의 퀸이 조건에 만족 하도록 배치할 수 있는 방법의 수를 return하는 solution함수를 완성해주세요.

 제한사항
 퀸(Queen)은 가로, 세로, 대각선으로 이동할 수 있습니다.
 n은 12이하의 자연수 입니다.
*/
func solution12(_ n:Int) -> Int {
    if n < 4 {
        return 0
    }
    var cp:[[Int]] = []
    for _ in 1...n {
        var list:[Int] = []
        for _ in 1...n {
            list.append(1)
        }
        cp.append(list)
    }
    
    var result:Int = 0
    for i in 0...n-1 {
        var copy = cp
        copy[0][i] = 0
        copy = setZero(copy, 0, i)
        var isS = true
        var count:Int = 1
        for j in 1...n-1 {
            count *= copy[j].filter{ $0 == 1 }.count
            var next:Int = copy[j].firstIndex(of: 1) ?? -1
            if next == -1 {
                isS = false
                break
            } else {
                copy = setZero(copy, j, next)
            }
        }
        if isS {
            result += count
        }
    }
    return result
}

func setZero(_ cp:[[Int]], _ c:Int, _ r:Int) -> [[Int]] {
    var copy = cp
    var min:Int = c >= r ? r : c
    for i in 0...cp.count-1 {
        copy[c][r] = 0
        copy[c][i] = 0
        copy[i][r] = 0
        if c - min + i < cp.count && r - min + i < cp.count {
            copy[c-min+i][r-min+i] = 0
        }
        if c+i+1 < cp.count && c+i+1 > -1 && r-1-i < cp.count && r-1-i > -1 {
            copy[c+i+1][r-1-i] = 0
        }
        if c-i-1 < cp.count && c-i-1 > -1 && r+1+i < cp.count && r+1+i > -1 {
            copy[c-i-1][r+1+i] = 0
        }
    }
    return copy
}

solution12(5)

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
func solution111(_ s:String) -> String {
    let list:[String] = s.components(separatedBy: " ")
    var result = ""
    for i in 0..<list.count {
        if list[i].count == 1 {
            result += "\(list[i].uppercased()) "
        } else if list[i].count > 1 {
            var strList:[Character] = Array(list[i])
            result += "\(String(strList.removeFirst()).uppercased())\(String(strList).lowercased()) "
        } else {
            result += " "
        }
    }
    result.removeLast()
    
    return result
}

print("//\(solution111("m  "))//")
print("//\(solution111("3people unFollowed me"))//")

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

print("//\(solution11("m  "))//")
print("//\(solution11("3people unFollowed me"))//")

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
func solution92(_ n:Int) -> [[Int]] {
    var result:[[Int]] = []
    func hanoi(_ n:Int, _ start:Int, _ middle:Int, _ end:Int) {
        if(n == 1) {
            result.append([start, end])
            return
        }
        hanoi(n-1, start, end, middle)
        hanoi(1, start, middle, end)
        hanoi(n-1, middle, start, end)
    }
    hanoi(n, 1, 2, 3)
    
    return result
}

func solution91(_ n:Int) -> [[Int]] {
    var result:[[Int]] = []
    var isEven = n%2==0
    var first:Int = isEven ? 2 : 1
    var second:Int = isEven ? 1 : 2
    for i in 1...n {
        for j in 1...Int(pow(2, Double(i-1))) {
            result.append([first, 3])
        }
    }
    return result
}
solution91(1)
solution91(2) // [ [1,2], [1,3], [2,3] ]

func solution9(_ n:Int) -> [[Int]] {
    var firstTower:[Int] = Array(2...n).reversed()
    var secondTower:[Int] = []
    var thirdTower:[Int] = []
    var result:[[Int]] = []
    if n%2 == 0 {
        secondTower.append(1)
        result.append([1,2])
    } else {
        thirdTower.append(1)
        result.append([1,3])
    }
    while true {
        if firstTower.isEmpty && secondTower.isEmpty {
            break
        }
        
        if secondTower.isEmpty {
            if thirdTower.last! > firstTower.last! {
                secondTower.append(firstTower.last!)
                firstTower.removeLast()
                result.append([1,2])
            } else {
                thirdTower.append(firstTower.last!)
                firstTower.removeLast()
                result.append([1,3])
            }
        } else if thirdTower.isEmpty {
            if secondTower.last! > firstTower.last! {
                thirdTower.append(firstTower.last!)
                firstTower.removeLast()
                result.append([1,3])
            } else {
                secondTower.append(firstTower.last!)
                firstTower.removeLast()
                result.append([1,2])
            }
        } else if firstTower.isEmpty {
            
        }
    }
    
    return result
}

solution9(2) // [ [1,2], [1,3], [2,3] ]

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
func solution5(_ n:Int) -> Int {
    if n < 4 {
        return n
    }
    var a:Int = 1
    var b:Int = 2
    var result: Int = 0
    for _ in 3...n {
        result = (a+b)%1234567
        a = b
        b = result
    }
    return result
}

solution5(1000)

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
func getMax(_ list:[Int], _ exceptIndex:Int) -> Int {
    var newList:[Int] = list
    newList[exceptIndex] = 0
    let max:Int = newList.max() ?? 0
    return max
}

func getMaxList(_ maxList:[Int], _ list:[Int]) -> [Int] {
    var newMaxList:[Int] = []
    let maxValue:Int = maxList.max() ?? 0
    let index:Int = maxList.firstIndex(of: maxValue) ?? 0
    for i in 0...maxList.count-1 {
        if i != index {
            newMaxList.append(list[i] + maxValue)
        } else {
            newMaxList.append(list[i] + getMax(maxList, i))
        }
    }
    return newMaxList
}

func solution4(_ land:[[Int]]) -> Int {
    var maxList:[Int] = []
    for i in land {
        if maxList.isEmpty {
            maxList = i
        } else {
            maxList = getMaxList(maxList, i)
        }
    }
    return maxList.max() ?? 0
}

solution4([[1,2,3,5],[5,6,7,8],[4,3,2,1]]) // 16

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
// 성공!!
func solution111111111111(_ board:[[Int]]) -> Int {
    var max:Int = 0
    var zeroList:[[Int]] = []
    for i in 0...board.count-1 {
        if i+max < board.count {
            var jumpIndex = -1
            for j in 0...board[0].count-1 {
                if j+max < board[0].count {
                    if board[i][j] == 1 && j > jumpIndex && zeroList.filter({ $0[0] >= i && $0[0] <= i+max && $0[1] >= j && $0[1] <= j+max }).count == 0 {
                        var isStop = false
                        var isMax = false
                        while !isStop {
                            if i+max < board.count && j+max < board[0].count {
                                if !isMax {
                                    for k in i...i+max {
                                        for l in j...j+max {
                                            if board[k][l] == 0 {
                                                isStop = true
                                                zeroList.append([k,l])
                                                if l > jumpIndex {
                                                    jumpIndex = l
                                                }
                                                break
                                            }
                                        }
                                        if isStop {
                                            break
                                        }
                                    }
                                } else {
                                    for k in i...i+max-1 {
                                        if board[k][j+max] == 0 {
                                            isStop = true
                                            zeroList.append([k,j+max])
                                            if j+max > jumpIndex {
                                                jumpIndex = j+max
                                            }
                                            break
                                        }
                                    }
                                    if !isStop {
                                        for l in j...j+max {
                                            if board[i+max][l] == 0 {
                                                isStop = true
                                                zeroList.append([i+max,l])
                                                if l > jumpIndex {
                                                    jumpIndex = l
                                                }
                                                break
                                            }
                                        }
                                    }
                                }
                                if !isStop {
                                    isMax = true
                                    max += 1
                                }
                            } else {
                                isStop = true
                                break
                            }
                        }
                    }
                } else {
                    break
                }
            }
        } else {
            break
        }
    }
    return max*max
}

solution111111111111([[0, 0, 1, 1], [1, 1, 1, 1]])

// 2,3 실패
func solution11111111111(_ board:[[Int]]) -> Int {
    var max:Int = 0
    for i in 0...board.count-1 {
        if i+max < board.count {
            var jumpIndex = -1
            for j in 0...board[0].count-1 {
                if j+max < board[0].count {
                    if board[i][j] == 1 && j > jumpIndex {
                        var isStop = false
                        var isMax = false
                        while !isStop {
                            if i+max < board.count && j+max < board[0].count {
                                if !isMax {
                                    for k in i...i+max {
                                        for l in j...j+max {
                                            if board[k][l] == 0 {
                                                isStop = true
                                                if l > jumpIndex {
                                                    jumpIndex = l
                                                }
                                                break
                                            }
                                        }
                                        if isStop {
                                            break
                                        }
                                    }
                                } else {
                                    for k in i...i+max-1 {
                                        if board[k][j+max] == 0 {
                                            isStop = true
                                            if j+max > jumpIndex {
                                                jumpIndex = j+max
                                            }
                                            break
                                        }
                                    }
                                    if !isStop {
                                        for l in j...j+max {
                                            if board[i+max][l] == 0 {
                                                isStop = true
                                                if l > jumpIndex {
                                                    jumpIndex = l
                                                }
                                                break
                                            }
                                        }
                                    }
                                }
                                if !isStop {
                                    isMax = true
                                    max += 1
                                }
                            } else {
                                isStop = true
                                break
                            }
                        }
                    }
                } else {
                    break
                }
            }
        } else {
            break
        }
    }
    return max*max
}

solution11111111111([[0, 0, 1, 1], [1, 1, 1, 1]])

// 효울성 1,3 실패
func solution1111111111(_ board:[[Int]]) -> Int {
    var max:Int = 0
    var zeroList:[[Int]] = []
    for i in 0...board.count-1 {
        if i+max < board.count {
            var zeroFilterList = zeroList.filter({ $0[0] >= i && $0[0] <= i+max })
            for j in 0...board[0].count-1 {
                if j+max < board[0].count {
                    if board[i][j] == 1 && zeroFilterList.filter({ $0[1] >= j && $0[1] <= j+max }).count == 0 {
                        var isStop = false
                        var isMax = false
                        while !isStop {
                            if i+max < board.count && j+max < board[0].count {
                                if !isMax {
                                    for k in i...i+max {
                                        for l in j...j+max {
                                            if board[k][l] == 0 {
                                                isStop = true
                                                zeroList.append([k,l])
                                                break
                                            }
                                        }
                                        if isStop {
                                            break
                                        }
                                    }
                                } else {
                                    for k in i...i+max-1 {
                                        if board[k][j+max] == 0 {
                                            isStop = true
                                            zeroList.append([k,j+max])
                                            break
                                        }
                                    }
                                    if !isStop {
                                        for l in j...j+max {
                                            if board[i+max][l] == 0 {
                                                isStop = true
                                                zeroList.append([i+max,l])
                                                break
                                            }
                                        }
                                    }
                                }
                                if !isStop {
                                    isMax = true
                                    max += 1
                                }
                            } else {
                                isStop = true
                                break
                            }
                        }
                    }
                } else {
                    break
                }
            }
        } else {
            break
        }
    }
    return max*max
}

solution1111111111([[0, 0, 1, 1], [1, 1, 1, 1]])

// 효율성 1 탈락
func solution111111111(_ board:[[Int]]) -> Int {
    var max:Int = 0
    var zeroList:[[Int]] = []
    for i in 0...board.count-1 {
        if i+max < board.count {
            for j in 0...board[0].count-1 {
                if j+max < board[0].count {
                    if board[i][j] == 1 && zeroList.filter({ $0[0] >= i && $0[0] <= i+max && $0[1] >= j && $0[1] <= j+max }).count == 0 {
                        var isStop = false
                        var isMax = false
                        while !isStop {
                            if i+max < board.count && j+max < board[0].count {
                                if !isMax {
                                    for k in i...i+max {
                                        for l in j...j+max {
                                            if board[k][l] == 0 {
                                                isStop = true
                                                zeroList.append([k,l])
                                                break
                                            }
                                        }
                                        if isStop {
                                            break
                                        }
                                    }
                                } else {
                                    for k in i...i+max-1 {
                                        if board[k][j+max] == 0 {
                                            isStop = true
                                            zeroList.append([k,j+max])
                                            break
                                        }
                                    }
                                    if !isStop {
                                        for l in j...j+max {
                                            if board[i+max][l] == 0 {
                                                isStop = true
                                                zeroList.append([i+max,l])
                                                break
                                            }
                                        }
                                    }
                                }
                                if !isStop {
                                    isMax = true
                                    max += 1
                                }
                            } else {
                                isStop = true
                                break
                            }
                        }
                    }
                } else {
                    break
                }
            }
        } else {
            break
        }
    }
    return max*max
}

solution111111111([[0, 0, 1, 1], [1, 1, 1, 1]])

// 효율성 2,3 탈락
func solution11111111(_ board:[[Int]]) -> Int {
    var max:Int = 0
    for i in 0...board.count-1 {
        if i+max < board.count {
            for j in 0...board[0].count-1 {
                if j+max < board[0].count {
                    if board[i][j] == 1 {
                        var isStop = false
                        var isMax = false
                        while !isStop {
                            if i+max < board.count && j+max < board[0].count {
                                if !isMax {
                                    for b in board[i...i+max] {
                                        for k in j...j+max {
                                            if b[k] == 0 {
                                                isStop = true
                                                break
                                            }
                                        }
                                        if isStop {
                                            break
                                        }
                                    }
                                } else {
                                    for b in board[i...i+max-1] {
                                        if b[j+max] != 1 {
                                            isStop = true
                                            break
                                        }
                                    }
                                    if !isStop {
                                        for k in j...j+max {
                                            if board[i+max][k] == 0 {
                                                isStop = true
                                                break
                                            }
                                        }
                                    }
                                }
                                if !isStop {
                                    isMax = true
                                    max += 1
                                }
                            } else {
                                isStop = true
                                break
                            }
                        }
                    }
                } else {
                    break
                }
            }
        } else {
            break
        }
    }
    return max*max
}

solution11111111([[0, 0, 1, 1], [1, 1, 1, 1]])
solution11111111([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])

func solution1111111(_ board:[[Int]]) -> Int {
    var max:Int = 0
    for i in 0...board.count-1 {
        for j in 0...board[0].count-1 {
            if board[i][j] == 1 {
                var isStop = false
                while !isStop {
                    if i+max < board.count && j+max < board[0].count {
                        for k in 0...max {
                            for l in 0...max {
                                if board[i+k][j+l] == 0 {
                                    isStop = true
                                    break
                                }
                            }
                            if isStop {
                                break
                            }
                        }
                        if !isStop {
                            max += 1
                        }
                    } else {
                        isStop = true
                    }
                }
            }
        }
    }
    return max*max
}

solution1111111([[0, 0, 1, 1], [1, 1, 1, 1]])
solution1111111([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])

func solution111111(_ board:[[Int]]) -> Int {
    var maxOneOne:Int = 0
    var boardFilter:[Int] = board.map({
        var maxOne:Int = 0
        var count:Int = 0
        for i in 0...$0.count-1 {
            if $0[i] == 1 {
                count += 1
            } else {
                if maxOne < count {
                    maxOne = count
                }
                count = 0
            }
        }
        if maxOne < count {
            maxOne = count
        }
        if maxOneOne < maxOne {
            maxOneOne = maxOne
        }
        return maxOne
    });
    if maxOneOne == 0 || maxOneOne == 1 {
        return maxOneOne
    }
    if board.count == 1 || board[0].count == 1 {
        return 1
    }
    var max:Int = min(boardFilter.count, maxOneOne)+1
    for _ in 0...max-3 {
        max -= 1
        if boardFilter.filter({ $0 >= max }).count >= max {
            for i in 0...board.count-max {
                if boardFilter[i] >= max {
                    var zeroLow:Int = -1
                    for j in 0...board[0].count-max {
                        if zeroLow < j {
                            var isS = true
                            for k in i...i+max-1 {
                                for l in j...j+max-1 {
                                    if board[k][l] == 0 {
                                        isS = false
                                        zeroLow = l
                                        break
                                    }
                                }
                                if !isS {
                                    break
                                }
                            }
                            if isS {
                                return max*max
                            }
                        }
                    }
                }
            }
        }
    }
    return 1
}

solution111111([[0, 0, 1, 1], [1, 1, 1, 1]])
solution111111([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])

func solution11111(_ board:[[Int]]) -> Int {
    if board.count == 0 {
        return 0
    }
    var boardFilter:[Int] = board.map({
        return $0.map { String($0) }.joined().components(separatedBy: "0").sorted{
            $0.count > $1.count
        }[0].count
    })
    var boardFilterSorted = boardFilter.sorted(by: >)
    if boardFilterSorted[0] == 0 || boardFilterSorted[0] == 1 {
        return boardFilterSorted[0]
    }
    if board.count == 1 || board[0].count == 1 {
        return 1
    }
    var max:Int = min(boardFilter.count, boardFilterSorted[0])+1
    for _ in 0...max-3 {
        max -= 1
        for i in 0...board.count-max {
            if boardFilter[i] >= max {
                var zeros:[Int] = []
                for j in 0...board[0].count-max {
                    if zeros.count == 0 || zeros.last! < j  {
                        var isS = true
                        for k in i...i+max-1 {
                            for l in j...j+max-1 {
                                if board[k][l] == 0 {
                                    isS = false
                                    zeros.append(l)
                                    break
                                }
                            }
                            if !isS {
                                break
                            }
                        }
                        if isS {
                            return max*max
                        }
                    }
                }
            }
        }
    }
    return 1
}

solution11111([[0, 0, 1, 1], [1, 1, 1, 1]])
solution11111([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])

// 27.90
func solution1111(_ board:[[Int]]) -> Int {
    if board.count == 0 {
        return 0
    }
    var boardFilter:[Int] = board.map({
        var maxOne:Int = 0
        var count:Int = 0
        for i in 0...$0.count-1 {
            if $0[i] == 1 {
                count += 1
            } else {
                if maxOne < count {
                    maxOne = count
                }
                count = 0
            }
        }
        if maxOne < count {
            maxOne = count
        }
        return maxOne
    });
    var boardFilterSorted = boardFilter.sorted(by: >)
    if boardFilterSorted[0] == 0 {
        return 0
    }
    if board.count == 1 || board[0].count == 1 {
        return 1
    }
    var max:Int = min(boardFilter.count, boardFilterSorted[0])+1
    for _ in 0...max-3 {
        max -= 1
        for i in 0...board.count-max {
            if boardFilter[i] >= max {
                var zeros:[Int] = []
                for j in 0...board[0].count-max {
                    if zeros.count == 0 || zeros.last! < j  {
                        var isS = true
                        for k in i...i+max-1 {
                            for l in j...j+max-1 {
                                if board[k][l] == 0 {
                                    isS = false
                                    zeros.append(l)
                                    break
                                }
                            }
                            if !isS {
                                break
                            }
                        }
                        if isS {
                            return max*max
                        }
                    }
                }
            }
        }
    }
    return 1
}

solution1111([[0, 0, 1, 1], [1, 1, 1, 1]])
solution1111([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])

func solution111(_ board:[[Int]]) -> Int {
    if board.count == 0 {
        return 0
    }
    var boardFilter = board.map({ $0.filter{ $0 == 1 }.count });
    if boardFilter.filter({ $0 > 0 }).count == 0 {
        return 0
    }
    if board.count == 1 || board[0].count == 1 {
        return 1
    }
    var max:Int = min(board.count, board[0].count)+1
    for _ in 0...max-3 {
        max -= 1
        for i in 0...board.count-max {
            if boardFilter[i] >= max &&
                board[i].map({ String($0) }).joined().contains(String(repeating: "1", count: max)) {
                var zeros:[Int] = []
                for j in 0...board[0].count-max {
                    if zeros.count == 0 || zeros.last! < j  {
                        var isS = true
                        for k in i...i+max-1 {
                            for l in j...j+max-1 {
                                if board[k][l] == 0 {
                                    isS = false
                                    zeros.append(l)
                                    break
                                }
                            }
                            if !isS {
                                break
                            }
                        }
                        if isS {
                            return max*max
                        }
                    }
                }
            }
        }
    }
    return 1
}

solution111([[0, 0, 1, 1], [1, 1, 1, 1]])
solution111([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])

func solution11(_ board:[[Int]]) -> Int {
    if board.count == 0 {
        return 0
    }
    var boardFilter = board.filter({ $0.filter{ $0 == 1 }.count > 0 }).sorted{ $0.count > $1.count };
    if boardFilter.count == 0 {
        return 0
    }
    if board.count == 1 || board[0].count == 1 {
        return 1
    }
    var max:Int = min(boardFilter.count, boardFilter[0].count)+1
    for _ in 0...max-3 {
        max -= 1
        for i in 0...board.count-max {
            if board[i].map({ String($0) }).joined().contains(String(repeating: "1", count: max)) {
                var zeros:[Int] = []
                for j in 0...board[0].count-max {
                    if zeros.count == 0 || zeros.last! < j  {
                        var isS = true
                        for k in i...i+max-1 {
                            for l in j...j+max-1 {
                                if board[k][l] == 0 {
                                    isS = false
                                    zeros.append(l)
                                    break
                                }
                            }
                            if !isS {
                                break
                            }
                        }
                        if isS {
                            return max*max
                        }
                    }
                }
            }
        }
    }
    return 1
}

solution11([[0, 0, 1, 1], [1, 1, 1, 1]])
solution11([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])

func solution1(_ board:[[Int]]) -> Int {
    if board.count == 0 {
        return 0
    }
    if board.filter({ $0.filter{ $0 == 1 }.count > 0 }).count == 0 {
        return 0
    }
    if board.count == 1 || board[0].count == 1 {
        return 1
    }
    var max:Int = min(board.count, board[0].count)+1
    for _ in 0...max-3 {
        max -= 1
        for i in 0...board.count-max {
            if board[i].map({ String($0) }).joined().contains(String(repeating: "1", count: max)) {
//            if board[i].filter({ $0 == 1 }).count >= max {
                for j in 0...board[0].count-max {
                    var isS = true
                    for k in i...i+max-1 {
//                        if board[k][j...j+max-1].contains(0) {
//                            isS = false
//                            break
//                        }
                        for l in j...j+max-1 {
                            if board[k][l] == 0 {
                                isS = false
                                break
                            }
                        }
                        if !isS {
                            break
                        }
                    }
                    if isS {
                        return max*max
                    }
                }
            }
        }
    }
    return 1
}

solution1([[0, 0, 1, 1], [1, 1, 1, 1]])
solution1([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])
