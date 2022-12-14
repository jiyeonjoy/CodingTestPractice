import Foundation

/* 숫자 게임
 
 - xx 회사의 2xN명의 사원들은 N명씩 두 팀으로 나눠 숫자 게임을 하려고 합니다. 두 개의 팀을 각각 A팀과 B팀이라고 하겠습니다. 숫자 게임의 규칙은 다음과 같습니다.
 
 먼저 모든 사원이 무작위로 자연수를 하나씩 부여받습니다.
 각 사원은 딱 한 번씩 경기를 합니다.
 각 경기당 A팀에서 한 사원이, B팀에서 한 사원이 나와 서로의 수를 공개합니다. 그때 숫자가 큰 쪽이 승리하게 되고, 승리한 사원이 속한 팀은 승점을 1점 얻게 됩니다.
 만약 숫자가 같다면 누구도 승점을 얻지 않습니다.
 전체 사원들은 우선 무작위로 자연수를 하나씩 부여받았습니다. 그다음 A팀은 빠르게 출전순서를 정했고 자신들의 출전 순서를 B팀에게 공개해버렸습니다. B팀은 그것을 보고 자신들의 최종 승점을 가장 높이는 방법으로 팀원들의 출전 순서를 정했습니다. 이때의 B팀이 얻는 승점을 구해주세요.
 A 팀원들이 부여받은 수가 출전 순서대로 나열되어있는 배열 A와 i번째 원소가 B팀의 i번 팀원이 부여받은 수를 의미하는 배열 B가 주어질 때, B 팀원들이 얻을 수 있는 최대 승점을 return 하도록 solution 함수를 완성해주세요.

 제한사항
 A와 B의 길이는 같습니다.
 A와 B의 길이는 1 이상 100,000 이하입니다.
 A와 B의 각 원소는 1 이상 1,000,000,000 이하의 자연수입니다.
*/
// 성공!
func solution4(_ a:[Int], _ b:[Int]) -> Int {
    var sortedA = a.sorted(by: >)
    var sortedB = b.sorted(by: >)
    var result:Int = 0
    var bFrontIndex = 0
    for i in 0...a.count-1 {
        if sortedA[i] < sortedB[bFrontIndex] {
            result += 1
            bFrontIndex += 1
        }
    }
    return result
}

// 효율성 1,2 실패
func solution41(_ a:[Int], _ b:[Int]) -> Int {
    var sortedA = a.sorted(by: >)
    var sortedB = b.sorted(by: >)
    var result:Int = 0
    for i in 0...a.count-1 {
        if sortedA[i] < sortedB[0] {
            result += 1
            sortedB.remove(at: 0)
        } else {
            sortedB.removeLast()
        }
    }
    return result
}

solution4([5,1,3,7], [2,2,6,8])

/* 단어 변환

 - 두 개의 단어 begin, target과 단어의 집합 words가 있습니다. 아래와 같은 규칙을 이용하여 begin에서 target으로 변환하는 가장 짧은 변환 과정을 찾으려고 합니다.
 
 1. 한 번에 한 개의 알파벳만 바꿀 수 있습니다.
 2. words에 있는 단어로만 변환할 수 있습니다.
 예를 들어 begin이 "hit", target가 "cog", words가 ["hot","dot","dog","lot","log","cog"]라면 "hit" -> "hot" -> "dot" -> "dog" -> "cog"와 같이 4단계를 거쳐 변환할 수 있습니다.

 두 개의 단어 begin, target과 단어의 집합 words가 매개변수로 주어질 때, 최소 몇 단계의 과정을 거쳐 begin을 target으로 변환할 수 있는지 return 하도록 solution 함수를 작성해주세요.

 제한사항
 각 단어는 알파벳 소문자로만 이루어져 있습니다.
 각 단어의 길이는 3 이상 10 이하이며 모든 단어의 길이는 같습니다.
 words에는 3개 이상 50개 이하의 단어가 있으며 중복되는 단어는 없습니다.
 begin과 target은 같지 않습니다.
 변환할 수 없는 경우에는 0를 return 합니다.
*/
func solution3(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    var result:Int = 0
    
    
    
    return result
}

/* 네트워크

 - 네트워크란 컴퓨터 상호 간에 정보를 교환할 수 있도록 연결된 형태를 의미합니다. 예를 들어, 컴퓨터 A와 컴퓨터 B가 직접적으로 연결되어있고, 컴퓨터 B와 컴퓨터 C가 직접적으로 연결되어 있을 때 컴퓨터 A와 컴퓨터 C도 간접적으로 연결되어 정보를 교환할 수 있습니다. 따라서 컴퓨터 A, B, C는 모두 같은 네트워크 상에 있다고 할 수 있습니다.
 
 컴퓨터의 개수 n, 연결에 대한 정보가 담긴 2차원 배열 computers가 매개변수로 주어질 때, 네트워크의 개수를 return 하도록 solution 함수를 작성하시오.

 제한사항
 컴퓨터의 개수 n은 1 이상 200 이하인 자연수입니다.
 각 컴퓨터는 0부터 n-1인 정수로 표현합니다.
 i번 컴퓨터와 j번 컴퓨터가 연결되어 있으면 computers[i][j]를 1로 표현합니다.
 computer[i][i]는 항상 1입니다.
*/
func solution2(_ n:Int, _ computers:[[Int]]) -> Int {
    var result:Int = 0
    var list:[[Int]] = []
    for i in 0...computers.count-1 {
        if computers[i].filter{ $0 == 1 }.count == 1 {
            result += 1
        } else {
            var existList:[Int] = []
            for j in 0...list.count-1 {
                if list[j].contains(i) {
                    existList.append(j)
                }
            }
            
        }
    }
    return result
}

/* 이중우선순위큐

 - 이중 우선순위 큐는 다음 연산을 할 수 있는 자료구조를 말합니다.
 
 명령어    수신 탑(높이)
 I 숫자    큐에 주어진 숫자를 삽입합니다.
 D 1    큐에서 최댓값을 삭제합니다.
 D -1    큐에서 최솟값을 삭제합니다.
 이중 우선순위 큐가 할 연산 operations가 매개변수로 주어질 때, 모든 연산을 처리한 후 큐가 비어있으면 [0,0] 비어있지 않으면 [최댓값, 최솟값]을 return 하도록 solution 함수를 구현해주세요.

 제한사항
 operations는 길이가 1 이상 1,000,000 이하인 문자열 배열입니다.
 operations의 원소는 큐가 수행할 연산을 나타냅니다.
 원소는 “명령어 데이터” 형식으로 주어집니다.- 최댓값/최솟값을 삭제하는 연산에서 최댓값/최솟값이 둘 이상인 경우, 하나만 삭제합니다.
 빈 큐에 데이터를 삭제하라는 연산이 주어질 경우, 해당 연산은 무시합니다.
*/
func solution1(_ operations:[String]) -> [Int] {
    var list:[Int] = []
    for o in operations {
        var oList = o.components(separatedBy: " ")
        if oList[0] == "I" {
            list.append(Int(oList[1])!)
        } else if oList[1] == "1" {
            if list.count > 0 {
                list.remove(at: list.firstIndex(of: list.max()!)!)
            }
        } else {
            if list.count > 0 {
                list.remove(at: list.firstIndex(of: list.min()!)!)
            }
        }
    }
    if list.count == 0 {
        return [0,0]
    }
    return [list.max()!, list.min()!]
}

solution1(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"])
