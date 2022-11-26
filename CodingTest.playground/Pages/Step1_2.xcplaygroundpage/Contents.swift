import Foundation

/* 내적
 
 - 길이가 같은 두 1차원 정수 배열 a, b가 매개변수로 주어집니다. a와 b의 내적을 return 하도록 solution 함수를 완성해주세요.
 
 이때, a와 b의 내적은 a[0]*b[0] + a[1]*b[1] + ... + a[n-1]*b[n-1] 입니다. (n은 a, b의 길이)
*/
func solution20(_ a:[Int], _ b:[Int]) -> Int {
    var result:Int = 0
    for i in 0...a.count-1 {
        result += a[i] * b[i]
    }
    return result
}

/* 3진법 뒤집기
 
 - 자연수 n이 매개변수로 주어집니다. n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수를 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 n은 1 이상 100,000,000 이하인 자연수입니다.
*/
func solution19(_ n:Int) -> Int {
    Int(String(Array(String(n, radix: 3)).reversed()), radix: 3) ?? 0
}

solution19(45)

/* 두 개 뽑아서 더하기
 
 - 정수 배열 numbers가 주어집니다. numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를 배열에 오름차순으로 담아 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 numbers의 길이는 2 이상 100 이하입니다.
 numbers의 모든 수는 0 이상 100 이하입니다.
*/
func solution18(_ numbers:[Int]) -> [Int] {
    var result:[Int] = []
    for i in 0...numbers.count-2 {
        for j in 1...numbers.count-i-1 {
            let sum = numbers[i]+numbers[i+j]
            if !result.contains(sum) {
                result.append(sum)
            }
        }
    }
    return result.sorted()
}

solution18([2,1,3,4,1])

/* [카카오 인턴] 키패드 누르기
 
 - 스마트폰 전화 키패드의 각 칸에 다음과 같이 숫자들이 적혀 있습니다.
 이 전화 키패드에서 왼손과 오른손의 엄지손가락만을 이용해서 숫자만을 입력하려고 합니다.
 맨 처음 왼손 엄지손가락은 * 키패드에 오른손 엄지손가락은 # 키패드 위치에서 시작하며, 엄지손가락을 사용하는 규칙은 다음과 같습니다.

 엄지손가락은 상하좌우 4가지 방향으로만 이동할 수 있으며 키패드 이동 한 칸은 거리로 1에 해당합니다.
 왼쪽 열의 3개의 숫자 1, 4, 7을 입력할 때는 왼손 엄지손가락을 사용합니다.
 오른쪽 열의 3개의 숫자 3, 6, 9를 입력할 때는 오른손 엄지손가락을 사용합니다.
 가운데 열의 4개의 숫자 2, 5, 8, 0을 입력할 때는 두 엄지손가락의 현재 키패드의 위치에서 더 가까운 엄지손가락을 사용합니다.
 4-1. 만약 두 엄지손가락의 거리가 같다면, 오른손잡이는 오른손 엄지손가락, 왼손잡이는 왼손 엄지손가락을 사용합니다.
 순서대로 누를 번호가 담긴 배열 numbers, 왼손잡이인지 오른손잡이인 지를 나타내는 문자열 hand가 매개변수로 주어질 때, 각 번호를 누른 엄지손가락이 왼손인 지 오른손인 지를 나타내는 연속된 문자열 형태로 return 하도록 solution 함수를 완성해주세요.

 [제한사항]
 numbers 배열의 크기는 1 이상 1,000 이하입니다.
 numbers 배열 원소의 값은 0 이상 9 이하인 정수입니다.
 hand는 "left" 또는 "right" 입니다.
 "left"는 왼손잡이, "right"는 오른손잡이를 의미합니다.
 왼손 엄지손가락을 사용한 경우는 L, 오른손 엄지손가락을 사용한 경우는 R을 순서대로 이어붙여 문자열 형태로 return 해주세요.
*/
func solution17(_ numbers:[Int], _ hand:String) -> String {
    var result:String = ""
    let dic:[Int:[Int]] = [
        1:[0,0],
        2:[0,1],
        3:[0,2],
        4:[1,0],
        5:[1,1],
        6:[1,2],
        7:[2,0],
        8:[2,1],
        9:[2,2],
        0:[3,1],
    ]
    var lastL:[Int] = [3,0]
    var lastR:[Int] = [3,2]
    
    for number in numbers {
        if number == 1 || number == 4 || number == 7 {
            lastL = dic[number]!
            result += "L"
        } else if number == 3 || number == 6 || number == 9 {
            lastR = dic[number]!
            result += "R"
        } else {
            var sizeL = abs(lastL[0]-dic[number]![0])+abs(lastL[1]-dic[number]![1])
            var sizeR = abs(lastR[0]-dic[number]![0])+abs(lastR[1]-dic[number]![1])
            if sizeL < sizeR || (sizeL == sizeR && hand == "left") {
                lastL = dic[number]!
                result += "L"
            } else {
                lastR = dic[number]!
                result += "R"
            }
        }
    }
    return result
}

solution17([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")

/* 크레인 인형뽑기 게임
 
 - 게임개발자인 "죠르디"는 크레인 인형뽑기 기계를 모바일 게임으로 만들려고 합니다.
 "죠르디"는 게임의 재미를 높이기 위해 화면 구성과 규칙을 다음과 같이 게임 로직에 반영하려고 합니다.
 게임 화면은 "1 x 1" 크기의 칸들로 이루어진 "N x N" 크기의 정사각 격자이며 위쪽에는 크레인이 있고 오른쪽에는 바구니가 있습니다. (위 그림은 "5 x 5" 크기의 예시입니다). 각 격자 칸에는 다양한 인형이 들어 있으며 인형이 없는 칸은 빈칸입니다. 모든 인형은 "1 x 1" 크기의 격자 한 칸을 차지하며 격자의 가장 아래 칸부터 차곡차곡 쌓여 있습니다. 게임 사용자는 크레인을 좌우로 움직여서 멈춘 위치에서 가장 위에 있는 인형을 집어 올릴 수 있습니다. 집어 올린 인형은 바구니에 쌓이게 되는 데, 이때 바구니의 가장 아래 칸부터 인형이 순서대로 쌓이게 됩니다. 다음 그림은 [1번, 5번, 3번] 위치에서 순서대로 인형을 집어 올려 바구니에 담은 모습입니다.
 만약 같은 모양의 인형 두 개가 바구니에 연속해서 쌓이게 되면 두 인형은 터뜨려지면서 바구니에서 사라지게 됩니다. 위 상태에서 이어서 [5번] 위치에서 인형을 집어 바구니에 쌓으면 같은 모양 인형 두 개가 없어집니다.
 크레인 작동 시 인형이 집어지지 않는 경우는 없으나 만약 인형이 없는 곳에서 크레인을 작동시키는 경우에는 아무런 일도 일어나지 않습니다. 또한 바구니는 모든 인형이 들어갈 수 있을 만큼 충분히 크다고 가정합니다. (그림에서는 화면표시 제약으로 5칸만으로 표현하였음)

 게임 화면의 격자의 상태가 담긴 2차원 배열 board와 인형을 집기 위해 크레인을 작동시킨 위치가 담긴 배열 moves가 매개변수로 주어질 때, 크레인을 모두 작동시킨 후 터트려져 사라진 인형의 개수를 return 하도록 solution 함수를 완성해주세요.

 [제한사항]
 board 배열은 2차원 배열로 크기는 "5 x 5" 이상 "30 x 30" 이하입니다.
 board의 각 칸에는 0 이상 100 이하인 정수가 담겨있습니다.
 0은 빈 칸을 나타냅니다.
 1 ~ 100의 각 숫자는 각기 다른 인형의 모양을 의미하며 같은 숫자는 같은 모양의 인형을 나타냅니다.
 moves 배열의 크기는 1 이상 1,000 이하입니다.
 moves 배열 각 원소들의 값은 1 이상이며 board 배열의 가로 크기 이하인 자연수입니다.
*/
func solution16(_ board:[[Int]], _ moves:[Int]) -> Int {
    var newBoard = board
    var result:Int = 0
    var saveList:[Int] = []
    
    for move in moves {
        for i in 0...newBoard.count-1 {
            if newBoard[i][move-1] != 0 {
                if saveList.count > 0 && saveList[saveList.count-1] == newBoard[i][move-1] {
                    result += 2
                    saveList.removeLast()
                } else {
                    saveList.append(newBoard[i][move-1])
                }
                newBoard[i][move-1] = 0
                break
            }
        }
    }
    return result
}

solution16([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])

/* 실패율
 
 - 슈퍼 게임 개발자 오렐리는 큰 고민에 빠졌다. 그녀가 만든 프랜즈 오천성이 대성공을 거뒀지만, 요즘 신규 사용자의 수가 급감한 것이다. 원인은 신규 사용자와 기존 사용자 사이에 스테이지 차이가 너무 큰 것이 문제였다.
 
 이 문제를 어떻게 할까 고민 한 그녀는 동적으로 게임 시간을 늘려서 난이도를 조절하기로 했다. 역시 슈퍼 개발자라 대부분의 로직은 쉽게 구현했지만, 실패율을 구하는 부분에서 위기에 빠지고 말았다. 오렐리를 위해 실패율을 구하는 코드를 완성하라.

 실패율은 다음과 같이 정의한다.
 스테이지에 도달했으나 아직 클리어하지 못한 플레이어의 수 / 스테이지에 도달한 플레이어 수
 전체 스테이지의 개수 N, 게임을 이용하는 사용자가 현재 멈춰있는 스테이지의 번호가 담긴 배열 stages가 매개변수로 주어질 때, 실패율이 높은 스테이지부터 내림차순으로 스테이지의 번호가 담겨있는 배열을 return 하도록 solution 함수를 완성하라.

 제한사항
 스테이지의 개수 N은 1 이상 500 이하의 자연수이다.
 stages의 길이는 1 이상 200,000 이하이다.
 stages에는 1 이상 N + 1 이하의 자연수가 담겨있다.
 각 자연수는 사용자가 현재 도전 중인 스테이지의 번호를 나타낸다.
 단, N + 1 은 마지막 스테이지(N 번째 스테이지) 까지 클리어 한 사용자를 나타낸다.
 만약 실패율이 같은 스테이지가 있다면 작은 번호의 스테이지가 먼저 오도록 하면 된다.
 스테이지에 도달한 유저가 없는 경우 해당 스테이지의 실패율은 0 으로 정의한다.
*/
func solution15(_ N:Int, _ stages:[Int]) -> [Int] {
    var dic = Dictionary(grouping: stages) { $0 }
    for i in 1...N {
        if dic[i] == nil {
            dic[i] = []
        }
    }
    dic[N+1] = nil
    let sorted = dic.sorted { $0.key < $1.key }
    var count:Int = stages.count
    var failList:[Double] = sorted.map {
        count -= $0.value.count
        if count + $0.value.count == 0 {
            return 0
        }
        return Double($0.value.count) / Double(count + $0.value.count)
    }
    let failSorted = failList.sorted(by: >)
    return failSorted.map {
        let index = failList.firstIndex(of: $0)!
        failList[index] = -1
        return index+1
    }
}

solution15(5,[2, 1, 2, 6, 2, 4, 3, 3])
solution15(4, [4, 4, 4, 4, 4])

/* 체육복
 
 - 점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다. 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다. 예를 들어, 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다. 체육복이 없으면 수업을 들을 수 없기 때문에 체육복을 적절히 빌려 최대한 많은 학생이 체육수업을 들어야 합니다.
 
 전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때, 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성해주세요.

 제한사항
 전체 학생의 수는 2명 이상 30명 이하입니다.
 체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있습니다.
 여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.
*/
func solution14(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserveCount: Int = 0
    var lostList = lost
    var reserveList = reserve
    for i in lost {
        if reserveList.contains(i) {
            reserveList.remove(at: reserveList.firstIndex(of: i)!)
            lostList.remove(at: lostList.firstIndex(of: i)!)
            reserveCount += 1
        }
    }
    for i in lostList.sorted() {
        if reserveList.contains(i-1) {
            reserveList.remove(at: reserveList.firstIndex(of: i-1)!)
            reserveCount += 1
        } else if reserveList.contains(i+1) {
            reserveList.remove(at: reserveList.firstIndex(of: i+1)!)
            reserveCount += 1
        }
    }
    return n - lost.count + reserveCount
}

solution14(5, [2, 4], [1, 3, 5])

/* 모의고사
 
 - 수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.
 
 1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
 2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
 3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...

 1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.

 제한 조건
 시험은 최대 10,000 문제로 구성되어있습니다.
 문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
 가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.
*/
func solution13(_ answers:[Int]) -> [Int] {
    let aList:[Int] = [1,2,3,4,5]
    let bList:[Int] = [2,1,2,3,2,4,2,5]
    let cList:[Int] = [3,3,1,1,2,2,4,4,5,5]
    var a:Int = 0
    var b:Int = 0
    var c:Int = 0
    
    for i in 0...answers.count-1 {
        if aList[i%aList.count] == answers[i] {
            a += 1
        }
         if bList[i%bList.count] == answers[i] {
            b += 1
        }
         if cList[i%cList.count] == answers[i] {
            c += 1
        }
    }
    var result: [Int] = []
    if a == max(a,b,c) {
        result.append(1)
    }
    if b == max(a,b,c) {
        result.append(2)
    }
    if c == max(a,b,c) {
        result.append(3)
    }
    return result
}

solution13([1,2,3,4,5])

/* K번째수
 
 - 배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.
 
 예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면

 array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.
 1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.
 2에서 나온 배열의 3번째 숫자는 5입니다.
 배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때, commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.

 제한사항
 array의 길이는 1 이상 100 이하입니다.
 array의 각 원소는 1 이상 100 이하입니다.
 commands의 길이는 1 이상 50 이하입니다.
 commands의 각 원소는 길이가 3입니다.
*/
func solution12(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result:[Int] = []
    for command in commands {
        result.append((command[0]-1...command[1]-1).map {
            return array[$0]
        }.sorted()[command[2]-1])
    }
    return result
}

solution12([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])

/* [1차] 다트 게임
 
 - 다트 게임
 카카오톡에 뜬 네 번째 별! 심심할 땐? 카카오톡 게임별~

 Game Star

 카카오톡 게임별의 하반기 신규 서비스로 다트 게임을 출시하기로 했다. 다트 게임은 다트판에 다트를 세 차례 던져 그 점수의 합계로 실력을 겨루는 게임으로, 모두가 간단히 즐길 수 있다.
 갓 입사한 무지는 코딩 실력을 인정받아 게임의 핵심 부분인 점수 계산 로직을 맡게 되었다. 다트 게임의 점수 계산 로직은 아래와 같다.

 다트 게임은 총 3번의 기회로 구성된다.
 각 기회마다 얻을 수 있는 점수는 0점에서 10점까지이다.
 점수와 함께 Single(S), Double(D), Triple(T) 영역이 존재하고 각 영역 당첨 시 점수에서 1제곱, 2제곱, 3제곱 (점수1 , 점수2 , 점수3 )으로 계산된다.
 옵션으로 스타상(*) , 아차상(#)이 존재하며 스타상(*) 당첨 시 해당 점수와 바로 전에 얻은 점수를 각 2배로 만든다. 아차상(#) 당첨 시 해당 점수는 마이너스된다.
 스타상(*)은 첫 번째 기회에서도 나올 수 있다. 이 경우 첫 번째 스타상(*)의 점수만 2배가 된다. (예제 4번 참고)
 스타상(*)의 효과는 다른 스타상(*)의 효과와 중첩될 수 있다. 이 경우 중첩된 스타상(*) 점수는 4배가 된다. (예제 4번 참고)
 스타상(*)의 효과는 아차상(#)의 효과와 중첩될 수 있다. 이 경우 중첩된 아차상(#)의 점수는 -2배가 된다. (예제 5번 참고)
 Single(S), Double(D), Triple(T)은 점수마다 하나씩 존재한다.
 스타상(*), 아차상(#)은 점수마다 둘 중 하나만 존재할 수 있으며, 존재하지 않을 수도 있다.
 0~10의 정수와 문자 S, D, T, *, #로 구성된 문자열이 입력될 시 총점수를 반환하는 함수를 작성하라.
*/
func solution11(_ dartResult:String) -> Int {
    var result:Int = 0
    
    var numStr:String = ""
    var numInt:Int = 0
    var save:Int = 0
    dartResult.map {
        if $0 == "S" {
            numInt = Int(numStr) ?? 0
            numStr = ""
        } else if $0 == "D" {
            numInt = Int(pow(Double(numStr) ?? 0, 2))
            numStr = ""
        } else if $0 == "T" {
            numInt = Int(pow(Double(numStr) ?? 0, 3))
            numStr = ""
        } else if $0 == "*" {
            numInt *= 2
            result += save
        } else if $0 == "#" {
            numInt = -numInt
        } else {
            if numStr == "" {
                save = numInt
                result += numInt
            }
            numStr += String($0)
        }
    }
    result += numInt
    return result
}

solution11("1D2S#10S")
solution11("1S2D*3T")

/* [1차] 비밀지도
 
 - 비밀지도
 네오는 평소 프로도가 비상금을 숨겨놓는 장소를 알려줄 비밀지도를 손에 넣었다. 그런데 이 비밀지도는 숫자로 암호화되어 있어 위치를 확인하기 위해서는 암호를 해독해야 한다. 다행히 지도 암호를 해독할 방법을 적어놓은 메모도 함께 발견했다.

 지도는 한 변의 길이가 n인 정사각형 배열 형태로, 각 칸은 "공백"(" ") 또는 "벽"("#") 두 종류로 이루어져 있다.
 전체 지도는 두 장의 지도를 겹쳐서 얻을 수 있다. 각각 "지도 1"과 "지도 2"라고 하자. 지도 1 또는 지도 2 중 어느 하나라도 벽인 부분은 전체 지도에서도 벽이다. 지도 1과 지도 2에서 모두 공백인 부분은 전체 지도에서도 공백이다.
 "지도 1"과 "지도 2"는 각각 정수 배열로 암호화되어 있다.
 암호화된 배열은 지도의 각 가로줄에서 벽 부분을 1, 공백 부분을 0으로 부호화했을 때 얻어지는 이진수에 해당하는 값의 배열이다.
 secret map

 네오가 프로도의 비상금을 손에 넣을 수 있도록, 비밀지도의 암호를 해독하는 작업을 도와줄 프로그램을 작성하라.

 입력 형식
 입력으로 지도의 한 변 크기 n 과 2개의 정수 배열 arr1, arr2가 들어온다.

 1 ≦ n ≦ 16
 arr1, arr2는 길이 n인 정수 배열로 주어진다.
 정수 배열의 각 원소 x를 이진수로 변환했을 때의 길이는 n 이하이다. 즉, 0 ≦ x ≦ 2n - 1을 만족한다.
 출력 형식
 원래의 비밀지도를 해독하여 '#', 공백으로 구성된 문자열 배열로 출력하라.
*/
func solution10(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        var binary1:[String] = arr1.map {
        return String(repeating: "0", count: n - String($0, radix: 2).count) + String($0, radix: 2)
    }
    var binary2:[String] = arr2.map {
        return String(repeating: "0", count: n - String($0, radix: 2).count) + String($0, radix: 2)
    }
    
    var result:[String] = []
    for i in 0...n-1 {
        var str = ""
        for j in 0...n-1 {
            if Array(binary1[i])[j] == "1" || Array(binary2[i])[j] == "1" {
                str += "#"
            } else {
                str += " "
            }
        }
        result.append(str)
    }
    return result
}

solution10(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10])

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

for _ in 1...b {
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
