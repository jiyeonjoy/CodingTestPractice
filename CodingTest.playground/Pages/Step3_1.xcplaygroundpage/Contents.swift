import Foundation

/* 불량 사용자

 - 개발팀 내에서 이벤트 개발을 담당하고 있는 "무지"는 최근 진행된 카카오이모티콘 이벤트에 비정상적인 방법으로 당첨을 시도한 응모자들을 발견하였습니다. 이런 응모자들을 따로 모아 불량 사용자라는 이름으로 목록을 만들어서 당첨 처리 시 제외하도록 이벤트 당첨자 담당자인 "프로도" 에게 전달하려고 합니다. 이 때 개인정보 보호을 위해 사용자 아이디 중 일부 문자를 '*' 문자로 가려서 전달했습니다. 가리고자 하는 문자 하나에 '*' 문자 하나를 사용하였고 아이디 당 최소 하나 이상의 '*' 문자를 사용하였습니다.
 "무지"와 "프로도"는 불량 사용자 목록에 매핑된 응모자 아이디를 제재 아이디 라고 부르기로 하였습니다.

 예를 들어, 이벤트에 응모한 전체 사용자 아이디 목록이 다음과 같다면

 응모자 아이디
 frodo
 fradi
 crodo
 abc123
 frodoc
 다음과 같이 불량 사용자 아이디 목록이 전달된 경우,

 불량 사용자
 fr*d*
 abc1**
 불량 사용자에 매핑되어 당첨에서 제외되어야 야 할 제재 아이디 목록은 다음과 같이 두 가지 경우가 있을 수 있습니다.

 제재 아이디
 frodo
 abc123
 제재 아이디
 fradi
 abc123
 이벤트 응모자 아이디 목록이 담긴 배열 user_id와 불량 사용자 아이디 목록이 담긴 배열 banned_id가 매개변수로 주어질 때, 당첨에서 제외되어야 할 제재 아이디 목록은 몇가지 경우의 수가 가능한 지 return 하도록 solution 함수를 완성해주세요.

 [제한사항]
 user_id 배열의 크기는 1 이상 8 이하입니다.
 user_id 배열 각 원소들의 값은 길이가 1 이상 8 이하인 문자열입니다.
 응모한 사용자 아이디들은 서로 중복되지 않습니다.
 응모한 사용자 아이디는 알파벳 소문자와 숫자로만으로 구성되어 있습니다.
 banned_id 배열의 크기는 1 이상 user_id 배열의 크기 이하입니다.
 banned_id 배열 각 원소들의 값은 길이가 1 이상 8 이하인 문자열입니다.
 불량 사용자 아이디는 알파벳 소문자와 숫자, 가리기 위한 문자 '*' 로만 이루어져 있습니다.
 불량 사용자 아이디는 '*' 문자를 하나 이상 포함하고 있습니다.
 불량 사용자 아이디 하나는 응모자 아이디 중 하나에 해당하고 같은 응모자 아이디가 중복해서 제재 아이디 목록에 들어가는 경우는 없습니다.
 제재 아이디 목록들을 구했을 때 아이디들이 나열된 순서와 관계없이 아이디 목록의 내용이 동일하다면 같은 것으로 처리하여 하나로 세면 됩니다.
*/
func solution7(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedList: [[String]] = []
    for bId in banned_id {
        var list:[String] = []
        for user in user_id.filter({ $0.count == bId.count }) {
            var isMatch = true
            for i in 0...user.count-1 {
                if Array(bId)[i] != Character("*") {
                    if Array(bId)[i] != Array(user)[i] {
                        isMatch = false
                        break
                    }
                }
            }
            if isMatch {
                list.append(user)
            }
        }
        bannedList.append(list)
    }
    var result = Set<Set<String>>()
    func getList(_ savedList:Set<String>, _ index:Int) {
        for value in bannedList[index] {
            if !savedList.contains(value) {
                if index == bannedList.count-1 {
                    var saved = savedList
                    saved.insert(value)
                    result.insert(saved)
                } else {
                    var saved = savedList
                    saved.insert(value)
                    getList(saved, index+1)
                }
            }
        }
    }
    getList(Set<String>(), 0)
    return result.count
}

solution7(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"])

/* 기지국 설치
 
 - N개의 아파트가 일렬로 쭉 늘어서 있습니다. 이 중에서 일부 아파트 옥상에는 4g 기지국이 설치되어 있습니다. 기술이 발전해 5g 수요가 높아져 4g 기지국을 5g 기지국으로 바꾸려 합니다. 그런데 5g 기지국은 4g 기지국보다 전달 범위가 좁아, 4g 기지국을 5g 기지국으로 바꾸면 어떤 아파트에는 전파가 도달하지 않습니다.
 
 예를 들어 11개의 아파트가 쭉 늘어서 있고, [4, 11] 번째 아파트 옥상에는 4g 기지국이 설치되어 있습니다. 만약 이 4g 기지국이 전파 도달 거리가 1인 5g 기지국으로 바뀔 경우 모든 아파트에 전파를 전달할 수 없습니다. (전파의 도달 거리가 W일 땐, 기지국이 설치된 아파트를 기준으로 전파를 양쪽으로 W만큼 전달할 수 있습니다.)

 초기에, 1, 2, 6, 7, 8, 9번째 아파트에는 전파가 전달되지 않습니다.
 기지국설치1_pvskxt.png

 1, 7, 9번째 아파트 옥상에 기지국을 설치할 경우, 모든 아파트에 전파를 전달할 수 있습니다.
 기지국설치2_kml0pb.png

 더 많은 아파트 옥상에 기지국을 설치하면 모든 아파트에 전파를 전달할 수 있습니다.
 기지국설치3_xhv7r3.png

 이때, 우리는 5g 기지국을 최소로 설치하면서 모든 아파트에 전파를 전달하려고 합니다. 위의 예시에선 최소 3개의 아파트 옥상에 기지국을 설치해야 모든 아파트에 전파를 전달할 수 있습니다.

 아파트의 개수 N, 현재 기지국이 설치된 아파트의 번호가 담긴 1차원 배열 stations, 전파의 도달 거리 W가 매개변수로 주어질 때, 모든 아파트에 전파를 전달하기 위해 증설해야 할 기지국 개수의 최솟값을 리턴하는 solution 함수를 완성해주세요

 제한사항
 N: 200,000,000 이하의 자연수
 stations의 크기: 10,000 이하의 자연수
 stations는 오름차순으로 정렬되어 있고, 배열에 담긴 수는 N보다 같거나 작은 자연수입니다.
 W: 10,000 이하의 자연수
*/
func getKJGCount(_ range:Int, _ v:Int) ->Int {
    if v%range == 0 {
        return v/range
    } else {
        return v/range+1
    }
}

func solution6(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var startIndex:Int = 1
    var range:Int = w+w+1
    var result:Int = 0

    for i in 0...stations.count-1 {
        if stations[i] - w > startIndex {
            var v = stations[i] - w - startIndex
            var count = getKJGCount(range, v)
            result += count
            startIndex = max(stations[i]+w+1, startIndex+range*count)
        } else {
            startIndex = stations[i]+w+1
        }
        if i == stations.count-1 {
            if startIndex <= n {
                result += getKJGCount(range, n-startIndex+1)
            }
        }
    }
    return result
}

/* 베스트앨범
 
 - 스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.
 
 속한 노래가 많이 재생된 장르를 먼저 수록합니다.
 장르 내에서 많이 재생된 노래를 먼저 수록합니다.
 장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
 노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.

 제한사항
 genres[i]는 고유번호가 i인 노래의 장르입니다.
 plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
 genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
 장르 종류는 100개 미만입니다.
 장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
 모든 장르는 재생된 횟수가 다릅니다.
*/
func solution5(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dic:[String:[Int]] = [:]
    for i in 0...genres.count-1 {
        if dic[genres[i]] != nil {
            var list:[Int] = dic[genres[i]] ?? []
            list.append(plays[i])
            dic[genres[i]] = list
        } else {
            dic[genres[i]] = [plays[i]]
        }
    }
    var sorted = dic.sorted{ $0.value.reduce(0,+) > $1.value.reduce(0,+) }
    var valueList:[Int] = []
    var genreList:[String] = []
    for i in sorted {
        var list = i.value.sorted(by: >)
        valueList.append(list[0])
        genreList.append(i.key)
        if list.count > 1 {
            valueList.append(list[1])
            genreList.append(i.key)
        }
    }
    var result:[Int] = []
    var copyPlays = plays
    for i in 0...valueList.count-1 {
        for j in 0...genres.count-1 {
            if copyPlays[j] == valueList[i] && genres[j] == genreList[i] {
                result.append(j)
                copyPlays[j] = 0
                break
            }
        }
    }
    return result
}

solution5(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])

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
    var minCount:Int = words.count+1
    
    func findWord(_ begin:String, _ history: [String]) -> [String] {
        var copy = history
        copy.append(begin)
        for word in words {
            if !copy.contains(word) {
                var differentCount: Int = 0
                for i in 0...word.count-1 {
                    if Array(begin)[i] != Array(word)[i] {
                        differentCount += 1
                    }
                }
                if differentCount == 1 {
                    if word == target {
                        minCount = min(minCount, copy.count)
                    } else {
                        findWord(word, copy)
                    }
                }
            }
        }
        return copy
    }

    findWord(begin, [])

    return minCount
}

solution3("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]) // 4

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
    var visited:[Bool] = Array.init(repeating: false, count: n)
    var result:Int = 0
    while true {
        if visited.firstIndex(of: false) == nil {
            break
        }
        var start = visited.firstIndex(of: false)!
        result += 1
        visited = dfs(start: start, visited: visited, computers: computers)
    }
    return result
}

func dfs(start: Int, visited: [Bool], computers:[[Int]]) -> [Bool] {
    var copy = visited
    copy[start] = true
    
    for i in 0...computers.count-1 {
        if computers[start][i] == 1 && !copy[i] {
            copy = dfs(start: i, visited: copy, computers: computers)
        }
    }
    return copy
}

solution2(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])

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
