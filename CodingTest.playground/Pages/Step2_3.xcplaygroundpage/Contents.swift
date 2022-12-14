import Foundation

/* 행렬 테두리 회전하기

 - rows x columns 크기인 행렬이 있습니다. 행렬에는 1부터 rows x columns까지의 숫자가 한 줄씩 순서대로 적혀있습니다. 이 행렬에서 직사각형 모양의 범위를 여러 번 선택해, 테두리 부분에 있는 숫자들을 시계방향으로 회전시키려 합니다. 각 회전은 (x1, y1, x2, y2)인 정수 4개로 표현하며, 그 의미는 다음과 같습니다.
 
 x1 행 y1 열부터 x2 행 y2 열까지의 영역에 해당하는 직사각형에서 테두리에 있는 숫자들을 한 칸씩 시계방향으로 회전합니다.
 다음은 6 x 6 크기 행렬의 예시입니다.

 이 행렬에 (2, 2, 5, 4) 회전을 적용하면, 아래 그림과 같이 2행 2열부터 5행 4열까지 영역의 테두리가 시계방향으로 회전합니다. 이때, 중앙의 15와 21이 있는 영역은 회전하지 않는 것을 주의하세요.
 
 행렬의 세로 길이(행 개수) rows, 가로 길이(열 개수) columns, 그리고 회전들의 목록 queries가 주어질 때, 각 회전들을 배열에 적용한 뒤, 그 회전에 의해 위치가 바뀐 숫자들 중 가장 작은 숫자들을 순서대로 배열에 담아 return 하도록 solution 함수를 완성해주세요.

 제한사항
 rows는 2 이상 100 이하인 자연수입니다.
 columns는 2 이상 100 이하인 자연수입니다.
 처음에 행렬에는 가로 방향으로 숫자가 1부터 하나씩 증가하면서 적혀있습니다.
 즉, 아무 회전도 하지 않았을 때, i 행 j 열에 있는 숫자는 ((i-1) x columns + j)입니다.
 queries의 행의 개수(회전의 개수)는 1 이상 10,000 이하입니다.
 queries의 각 행은 4개의 정수 [x1, y1, x2, y2]입니다.
 x1 행 y1 열부터 x2 행 y2 열까지 영역의 테두리를 시계방향으로 회전한다는 뜻입니다.
 1 ≤ x1 < x2 ≤ rows, 1 ≤ y1 < y2 ≤ columns입니다.
 모든 회전은 순서대로 이루어집니다.
 예를 들어, 두 번째 회전에 대한 답은 첫 번째 회전을 실행한 다음, 그 상태에서 두 번째 회전을 실행했을 때 이동한 숫자 중 최솟값을 구하면 됩니다.
*/
func solution20(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    return []
}

/* 괄호 회전하기

 - 다음 규칙을 지키는 문자열을 올바른 괄호 문자열이라고 정의합니다.
 
 (), [], {} 는 모두 올바른 괄호 문자열입니다.
 만약 A가 올바른 괄호 문자열이라면, (A), [A], {A} 도 올바른 괄호 문자열입니다. 예를 들어, [] 가 올바른 괄호 문자열이므로, ([]) 도 올바른 괄호 문자열입니다.
 만약 A, B가 올바른 괄호 문자열이라면, AB 도 올바른 괄호 문자열입니다. 예를 들어, {} 와 ([]) 가 올바른 괄호 문자열이므로, {}([]) 도 올바른 괄호 문자열입니다.
 대괄호, 중괄호, 그리고 소괄호로 이루어진 문자열 s가 매개변수로 주어집니다. 이 s를 왼쪽으로 x (0 ≤ x < (s의 길이)) 칸만큼 회전시켰을 때 s가 올바른 괄호 문자열이 되게 하는 x의 개수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 s의 길이는 1 이상 1,000 이하입니다.
*/
func solution19(_ s:String) -> Int {
    if s.count == 1 {
        return 0
    }
    var result:Int = 0
    var charList = Array(s)
    for _ in 0...s.count-1 {
        charList.append(charList.first!)
        charList.removeFirst()
        
        var list:[Character] = []
        var isMatch = true
        
        for char in charList {
            if char == "[" || char == "{" || char == "("{
                list.append(char)
            } else if char == "]" {
                if list.contains("[") {
                    let index = list.lastIndex(of: "[")!
                    if (list.lastIndex(of: "{") ?? 0) > index
                        || (list.lastIndex(of: "(") ?? 0) > index {
                        isMatch = false
                        break
                    }
                    list.remove(at: index)
                } else {
                    isMatch = false
                    break
                }
            } else if char == "}" {
                if list.contains("{") {
                    let index = list.lastIndex(of: "{")!
                    if (list.lastIndex(of: "[") ?? 0) > index
                        || (list.lastIndex(of: "(") ?? 0) > index {
                        isMatch = false
                        break
                    }
                    list.remove(at: index)
                } else {
                    isMatch = false
                    break
                }
            } else if char == ")" {
                if list.contains("(") {
                    let index = list.lastIndex(of: "(")!
                    if (list.lastIndex(of: "[") ?? 0) > index
                        || (list.lastIndex(of: "{") ?? 0) > index {
                        isMatch = false
                        break
                    }
                    list.remove(at: index)
                } else {
                    isMatch = false
                    break
                }
            }
        }
        if list.count == 0 && isMatch {
            result += 1
        }
    }
    return result
}

solution19("[{]}")
solution19("[](){}")

/* 순위 검색

 - [본 문제는 정확성과 효율성 테스트 각각 점수가 있는 문제입니다.]
 
 카카오는 하반기 경력 개발자 공개채용을 진행 중에 있으며 현재 지원서 접수와 코딩테스트가 종료되었습니다. 이번 채용에서 지원자는 지원서 작성 시 아래와 같이 4가지 항목을 반드시 선택하도록 하였습니다.

 코딩테스트 참여 개발언어 항목에 cpp, java, python 중 하나를 선택해야 합니다.
 지원 직군 항목에 backend와 frontend 중 하나를 선택해야 합니다.
 지원 경력구분 항목에 junior와 senior 중 하나를 선택해야 합니다.
 선호하는 소울푸드로 chicken과 pizza 중 하나를 선택해야 합니다.
 인재영입팀에 근무하고 있는 니니즈는 코딩테스트 결과를 분석하여 채용에 참여한 개발팀들에 제공하기 위해 지원자들의 지원 조건을 선택하면 해당 조건에 맞는 지원자가 몇 명인 지 쉽게 알 수 있는 도구를 만들고 있습니다.
 예를 들어, 개발팀에서 궁금해하는 문의사항은 다음과 같은 형태가 될 수 있습니다.
 코딩테스트에 java로 참여했으며, backend 직군을 선택했고, junior 경력이면서, 소울푸드로 pizza를 선택한 사람 중 코딩테스트 점수를 50점 이상 받은 지원자는 몇 명인가?

 물론 이 외에도 각 개발팀의 상황에 따라 아래와 같이 다양한 형태의 문의가 있을 수 있습니다.

 코딩테스트에 python으로 참여했으며, frontend 직군을 선택했고, senior 경력이면서, 소울푸드로 chicken을 선택한 사람 중 코딩테스트 점수를 100점 이상 받은 사람은 모두 몇 명인가?
 코딩테스트에 cpp로 참여했으며, senior 경력이면서, 소울푸드로 pizza를 선택한 사람 중 코딩테스트 점수를 100점 이상 받은 사람은 모두 몇 명인가?
 backend 직군을 선택했고, senior 경력이면서 코딩테스트 점수를 200점 이상 받은 사람은 모두 몇 명인가?
 소울푸드로 chicken을 선택한 사람 중 코딩테스트 점수를 250점 이상 받은 사람은 모두 몇 명인가?
 코딩테스트 점수를 150점 이상 받은 사람은 모두 몇 명인가?
 즉, 개발팀에서 궁금해하는 내용은 다음과 같은 형태를 갖습니다.

 * [조건]을 만족하는 사람 중 코딩테스트 점수를 X점 이상 받은 사람은 모두 몇 명인가?
 [문제]
 지원자가 지원서에 입력한 4가지의 정보와 획득한 코딩테스트 점수를 하나의 문자열로 구성한 값의 배열 info, 개발팀이 궁금해하는 문의조건이 문자열 형태로 담긴 배열 query가 매개변수로 주어질 때,
 각 문의조건에 해당하는 사람들의 숫자를 순서대로 배열에 담아 return 하도록 solution 함수를 완성해 주세요.

 [제한사항]
 info 배열의 크기는 1 이상 50,000 이하입니다.
 info 배열 각 원소의 값은 지원자가 지원서에 입력한 4가지 값과 코딩테스트 점수를 합친 "개발언어 직군 경력 소울푸드 점수" 형식입니다.
 개발언어는 cpp, java, python 중 하나입니다.
 직군은 backend, frontend 중 하나입니다.
 경력은 junior, senior 중 하나입니다.
 소울푸드는 chicken, pizza 중 하나입니다.
 점수는 코딩테스트 점수를 의미하며, 1 이상 100,000 이하인 자연수입니다.
 각 단어는 공백문자(스페이스 바) 하나로 구분되어 있습니다.
 query 배열의 크기는 1 이상 100,000 이하입니다.
 query의 각 문자열은 "[조건] X" 형식입니다.
 [조건]은 "개발언어 and 직군 and 경력 and 소울푸드" 형식의 문자열입니다.
 언어는 cpp, java, python, - 중 하나입니다.
 직군은 backend, frontend, - 중 하나입니다.
 경력은 junior, senior, - 중 하나입니다.
 소울푸드는 chicken, pizza, - 중 하나입니다.
 '-' 표시는 해당 조건을 고려하지 않겠다는 의미입니다.
 X는 코딩테스트 점수를 의미하며 조건을 만족하는 사람 중 X점 이상 받은 사람은 모두 몇 명인 지를 의미합니다.
 각 단어는 공백문자(스페이스 바) 하나로 구분되어 있습니다.
 예를 들면, "cpp and - and senior and pizza 500"은 "cpp로 코딩테스트를 봤으며, 경력은 senior 이면서 소울푸드로 pizza를 선택한 지원자 중 코딩테스트 점수를 500점 이상 받은 사람은 모두 몇 명인가?"를 의미합니다.
*/
// TODO
func solution18(_ info:[String], _ query:[String]) -> [Int] {
    return []
}

/* 메뉴 리뉴얼

 - 레스토랑을 운영하던 스카피는 코로나19로 인한 불경기를 극복하고자 메뉴를 새로 구성하려고 고민하고 있습니다.
 기존에는 단품으로만 제공하던 메뉴를 조합해서 코스요리 형태로 재구성해서 새로운 메뉴를 제공하기로 결정했습니다. 어떤 단품메뉴들을 조합해서 코스요리 메뉴로 구성하면 좋을 지 고민하던 "스카피"는 이전에 각 손님들이 주문할 때 가장 많이 함께 주문한 단품메뉴들을 코스요리 메뉴로 구성하기로 했습니다.
 단, 코스요리 메뉴는 최소 2가지 이상의 단품메뉴로 구성하려고 합니다. 또한, 최소 2명 이상의 손님으로부터 주문된 단품메뉴 조합에 대해서만 코스요리 메뉴 후보에 포함하기로 했습니다.

 예를 들어, 손님 6명이 주문한 단품메뉴들의 조합이 다음과 같다면,
 (각 손님은 단품메뉴를 2개 이상 주문해야 하며, 각 단품메뉴는 A ~ Z의 알파벳 대문자로 표기합니다.)

 손님 번호    주문한 단품메뉴 조합
 1번 손님    A, B, C, F, G
 2번 손님    A, C
 3번 손님    C, D, E
 4번 손님    A, C, D, E
 5번 손님    B, C, F, G
 6번 손님    A, C, D, E, H
 가장 많이 함께 주문된 단품메뉴 조합에 따라 "스카피"가 만들게 될 코스요리 메뉴 구성 후보는 다음과 같습니다.

 코스 종류    메뉴 구성    설명
 요리 2개 코스    A, C    1번, 2번, 4번, 6번 손님으로부터 총 4번 주문됐습니다.
 요리 3개 코스    C, D, E    3번, 4번, 6번 손님으로부터 총 3번 주문됐습니다.
 요리 4개 코스    B, C, F, G    1번, 5번 손님으로부터 총 2번 주문됐습니다.
 요리 4개 코스    A, C, D, E    4번, 6번 손님으로부터 총 2번 주문됐습니다.
 [문제]
 각 손님들이 주문한 단품메뉴들이 문자열 형식으로 담긴 배열 orders, "스카피"가 추가하고 싶어하는 코스요리를 구성하는 단품메뉴들의 갯수가 담긴 배열 course가 매개변수로 주어질 때, "스카피"가 새로 추가하게 될 코스요리의 메뉴 구성을 문자열 형태로 배열에 담아 return 하도록 solution 함수를 완성해 주세요.

 [제한사항]
 orders 배열의 크기는 2 이상 20 이하입니다.
 orders 배열의 각 원소는 크기가 2 이상 10 이하인 문자열입니다.
 각 문자열은 알파벳 대문자로만 이루어져 있습니다.
 각 문자열에는 같은 알파벳이 중복해서 들어있지 않습니다.
 course 배열의 크기는 1 이상 10 이하입니다.
 course 배열의 각 원소는 2 이상 10 이하인 자연수가 오름차순으로 정렬되어 있습니다.
 course 배열에는 같은 값이 중복해서 들어있지 않습니다.
 정답은 각 코스요리 메뉴의 구성을 문자열 형식으로 배열에 담아 사전 순으로 오름차순 정렬해서 return 해주세요.
 배열의 각 원소에 저장된 문자열 또한 알파벳 오름차순으로 정렬되어야 합니다.
 만약 가장 많이 함께 주문된 메뉴 구성이 여러 개라면, 모두 배열에 담아 return 하면 됩니다.
 orders와 course 매개변수는 return 하는 배열의 길이가 1 이상이 되도록 주어집니다.
*/
func combinations<T>(source: [T], takenBy : Int) -> [[T]] {
    if(source.count == takenBy) {
        return [source]
    }

    if(source.isEmpty) {
        return []
    }

    if(takenBy == 0) {
        return []
    }

    if(takenBy == 1) {
        return source.map { [$0] }
    }

    var result : [[T]] = []

    let rest = Array(source.suffix(from: 1))
    let subCombos = combinations(source: rest, takenBy: takenBy - 1)
    result += subCombos.map { [source[0]] + $0 }
    result += combinations(source: rest, takenBy: takenBy)
    return result
}

func solution17(_ orders:[String], _ course:[Int]) -> [String] {
    var result:[String] = []
    
    for count in course {
        var list:[[Character]] = []
        for order in orders.filter({ $0.count >= count }) {
            list += combinations(source:order.sorted(by: <), takenBy: count)
        }
        var dic = Dictionary(grouping: list) { $0 }.sorted{ $0.value.count > $1.value.count }
        var filter = dic.filter{ $0.value.count > 1 && $0.value.count == dic.first!.value.count }
        for data in filter {
            result.append(String(data.key))
        }
    }
    return result.sorted(by: <)
}

solution17(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])

/* 이진 변환 반복하기

 - 0과 1로 이루어진 어떤 문자열 x에 대한 이진 변환을 다음과 같이 정의합니다.
 
 x의 모든 0을 제거합니다.
 x의 길이를 c라고 하면, x를 "c를 2진법으로 표현한 문자열"로 바꿉니다.
 예를 들어, x = "0111010"이라면, x에 이진 변환을 가하면 x = "0111010" -> "1111" -> "100" 이 됩니다.

 0과 1로 이루어진 문자열 s가 매개변수로 주어집니다. s가 "1"이 될 때까지 계속해서 s에 이진 변환을 가했을 때, 이진 변환의 횟수와 변환 과정에서 제거된 모든 0의 개수를 각각 배열에 담아 return 하도록 solution 함수를 완성해주세요.

 제한사항
 s의 길이는 1 이상 150,000 이하입니다.
 s에는 '1'이 최소 하나 이상 포함되어 있습니다.
*/
func solution16(_ s:String) -> [Int] {
    var chageCount = 0
    var removeZero = 0
    var value = s
    while value != "1" {
        var count = value.count
        value = value.filter { $0 != "0" }
        removeZero += count-value.count
        chageCount += 1
        value = String(Int(value.count), radix:2)
    }
    return [chageCount, removeZero]
}

/* 쿼드압축 후 개수 세기

 - 0과 1로 이루어진 2n x 2n 크기의 2차원 정수 배열 arr이 있습니다. 당신은 이 arr을 쿼드 트리와 같은 방식으로 압축하고자 합니다. 구체적인 방식은 다음과 같습니다.
 
 당신이 압축하고자 하는 특정 영역을 S라고 정의합니다.
 만약 S 내부에 있는 모든 수가 같은 값이라면, S를 해당 수 하나로 압축시킵니다.
 그렇지 않다면, S를 정확히 4개의 균일한 정사각형 영역(입출력 예를 참고해주시기 바랍니다.)으로 쪼갠 뒤, 각 정사각형 영역에 대해 같은 방식의 압축을 시도합니다.
 arr이 매개변수로 주어집니다. 위와 같은 방식으로 arr을 압축했을 때, 배열에 최종적으로 남는 0의 개수와 1의 개수를 배열에 담아서 return 하도록 solution 함수를 완성해주세요.

 제한사항
 arr의 행의 개수는 1 이상 1024 이하이며, 2의 거듭 제곱수 형태를 하고 있습니다. 즉, arr의 행의 개수는 1, 2, 4, 8, ..., 1024 중 하나입니다.
 arr의 각 행의 길이는 arr의 행의 개수와 같습니다. 즉, arr은 정사각형 배열입니다.
 arr의 각 행에 있는 모든 값은 0 또는 1 입니다.
*/
func getQuartered(_ arr:[[Int]]) -> [[[Int]]] {
    var result:[[[Int]]] = []
    var width:Int = arr.count/2
    result.append(arr[0...width-1].map {
        Array($0[0...width-1])
    })
    result.append(arr[0...width-1].map {
        Array($0[width...arr.count-1])
    })
    result.append(arr[width...arr.count-1].map {
        Array($0[0...width-1])
    })
    result.append(arr[width...arr.count-1].map {
        Array($0[width...arr.count-1])
    })
    return result
}

func checkValue(_ arr:[[Int]]) -> Int {
    var sum: Int = arr[0].reduce(0, +)
    if sum == 0 {
        for i in 1...arr.count-1 {
            if arr[i].reduce(0,+) != sum {
                return -1
            }
        }
        return 0
    } else if sum == arr[0].count {
        for i in 1...arr.count-1 {
            if arr[i].reduce(0,+) != sum {
                return -1
            }
        }
        return 1
    } else {
        return -1
    }
}

func solution15(_ arr:[[Int]]) -> [Int] {
    if checkValue(arr) == 0 {
        return [1, 0]
    } else if checkValue(arr) == 1 {
        return [0, 1]
    }
    
    var newArr = [arr]
    var width = arr.count

    var zeroCount:Int = 0
    var oneCount:Int = 0
    while width > 2 {
        width /= 2
        var list = newArr
        newArr = []
        for a in list {
            for b in getQuartered(a) {
                let value = checkValue(b)
                if value == 0 {
                    zeroCount += 1
                } else if value == 1 {
                    oneCount += 1
                } else {
                    newArr.append(b)
                }
            }
        }
    }
    for i in newArr {
        for j in i {
            for k in j {
                if k == 0 {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            }
        }
    }
    return [zeroCount, oneCount]
}

solution15([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]]) // [4,9]

/* 삼각 달팽이

 - 정수 n이 매개변수로 주어집니다. 다음 그림과 같이 밑변의 길이와 높이가 n인 삼각형에서 맨 위 꼭짓점부터 반시계 방향으로 달팽이 채우기를 진행한 후, 첫 행부터 마지막 행까지 모두 순서대로 합친 새로운 배열을 return 하도록 solution 함수를 완성해주세요.

 제한사항
 n은 1 이상 1,000 이하입니다.
*/
func solution14(_ n:Int) -> [Int] {
    var result:[[Int]] = []
    for _ in 1...n {
        result.append([])
    }
    var startIndex:Int = -1
    var endIndex:Int = n
    var value = 1
    for i in 1...(n+2)/3 {
        startIndex += 1
        endIndex -= 1
        if startIndex <= endIndex-1 {
            for j in startIndex...endIndex-1 {
                result[j].insert(value, at: i-1)
                value += 1
            }
        }
        if i <= endIndex+i-result[endIndex].count {
            for k in i...endIndex+i-result[endIndex].count {
                result[endIndex].insert(value, at: k-1)
                value += 1
            }
        }
        startIndex += 1
        if 1 <= endIndex-startIndex {
            for j in 1...endIndex-startIndex {
                result[endIndex-j].insert(value, at:result[endIndex-j].count-i+1)
                value += 1
            }
        }
    }
    var list:[Int] = []
    for r in result {
        list += r
    }
    return list
}

solution14(6)
// [1, 2, 15, 3, 16, 14, 4, 17, 21, 13, 5, 18, 19, 20, 12, 6, 7, 8, 9, 10, 11]
solution14(4)

/* [카카오 인턴] 수식 최대화

 - IT 벤처 회사를 운영하고 있는 라이언은 매년 사내 해커톤 대회를 개최하여 우승자에게 상금을 지급하고 있습니다.
 이번 대회에서는 우승자에게 지급되는 상금을 이전 대회와는 다르게 다음과 같은 방식으로 결정하려고 합니다.
 해커톤 대회에 참가하는 모든 참가자들에게는 숫자들과 3가지의 연산문자(+, -, *) 만으로 이루어진 연산 수식이 전달되며, 참가자의 미션은 전달받은 수식에 포함된 연산자의 우선순위를 자유롭게 재정의하여 만들 수 있는 가장 큰 숫자를 제출하는 것입니다.
 단, 연산자의 우선순위를 새로 정의할 때, 같은 순위의 연산자는 없어야 합니다. 즉, + > - > * 또는 - > * > + 등과 같이 연산자 우선순위를 정의할 수 있으나 +,* > - 또는 * > +,-처럼 2개 이상의 연산자가 동일한 순위를 가지도록 연산자 우선순위를 정의할 수는 없습니다. 수식에 포함된 연산자가 2개라면 정의할 수 있는 연산자 우선순위 조합은 2! = 2가지이며, 연산자가 3개라면 3! = 6가지 조합이 가능합니다.
 만약 계산된 결과가 음수라면 해당 숫자의 절댓값으로 변환하여 제출하며 제출한 숫자가 가장 큰 참가자를 우승자로 선정하며, 우승자가 제출한 숫자를 우승상금으로 지급하게 됩니다.

 예를 들어, 참가자 중 네오가 아래와 같은 수식을 전달받았다고 가정합니다.

 "100-200*300-500+20"

 일반적으로 수학 및 전산학에서 약속된 연산자 우선순위에 따르면 더하기와 빼기는 서로 동등하며 곱하기는 더하기, 빼기에 비해 우선순위가 높아 * > +,- 로 우선순위가 정의되어 있습니다.
 대회 규칙에 따라 + > - > * 또는 - > * > + 등과 같이 연산자 우선순위를 정의할 수 있으나 +,* > - 또는 * > +,- 처럼 2개 이상의 연산자가 동일한 순위를 가지도록 연산자 우선순위를 정의할 수는 없습니다.
 수식에 연산자가 3개 주어졌으므로 가능한 연산자 우선순위 조합은 3! = 6가지이며, 그 중 + > - > * 로 연산자 우선순위를 정한다면 결괏값은 22,000원이 됩니다.
 반면에 * > + > - 로 연산자 우선순위를 정한다면 수식의 결괏값은 -60,420 이지만, 규칙에 따라 우승 시 상금은 절댓값인 60,420원이 됩니다.

 참가자에게 주어진 연산 수식이 담긴 문자열 expression이 매개변수로 주어질 때, 우승 시 받을 수 있는 가장 큰 상금 금액을 return 하도록 solution 함수를 완성해주세요.

 [제한사항]
 expression은 길이가 3 이상 100 이하인 문자열입니다.
 expression은 공백문자, 괄호문자 없이 오로지 숫자와 3가지의 연산자(+, -, *) 만으로 이루어진 올바른 중위표기법(연산의 두 대상 사이에 연산기호를 사용하는 방식)으로 표현된 연산식입니다. 잘못된 연산식은 입력으로 주어지지 않습니다.
 즉, "402+-561*"처럼 잘못된 수식은 올바른 중위표기법이 아니므로 주어지지 않습니다.
 expression의 피연산자(operand)는 0 이상 999 이하의 숫자입니다.
 즉, "100-2145*458+12"처럼 999를 초과하는 피연산자가 포함된 수식은 입력으로 주어지지 않습니다.
 "-56+100"처럼 피연산자가 음수인 수식도 입력으로 주어지지 않습니다.
 expression은 적어도 1개 이상의 연산자를 포함하고 있습니다.
 연산자 우선순위를 어떻게 적용하더라도, expression의 중간 계산값과 최종 결괏값은 절댓값이 263 - 1 이하가 되도록 입력이 주어집니다.
 같은 연산자끼리는 앞에 있는 것의 우선순위가 더 높습니다.
*/
// TODO
func solution13(_ expression:String) -> Int64 {
    return 0
}

/* 튜플

 - 셀수있는 수량의 순서있는 열거 또는 어떤 순서를 따르는 요소들의 모음을 튜플(tuple)이라고 합니다. n개의 요소를 가진 튜플을 n-튜플(n-tuple)이라고 하며, 다음과 같이 표현할 수 있습니다.
 
 (a1, a2, a3, ..., an)
 튜플은 다음과 같은 성질을 가지고 있습니다.

 중복된 원소가 있을 수 있습니다. ex : (2, 3, 1, 2)
 원소에 정해진 순서가 있으며, 원소의 순서가 다르면 서로 다른 튜플입니다. ex : (1, 2, 3) ≠ (1, 3, 2)
 튜플의 원소 개수는 유한합니다.
 원소의 개수가 n개이고, 중복되는 원소가 없는 튜플 (a1, a2, a3, ..., an)이 주어질 때(단, a1, a2, ..., an은 자연수), 이는 다음과 같이 집합 기호 '{', '}'를 이용해 표현할 수 있습니다.

 {{a1}, {a1, a2}, {a1, a2, a3}, {a1, a2, a3, a4}, ... {a1, a2, a3, a4, ..., an}}
 예를 들어 튜플이 (2, 1, 3, 4)인 경우 이는

 {{2}, {2, 1}, {2, 1, 3}, {2, 1, 3, 4}}
 와 같이 표현할 수 있습니다. 이때, 집합은 원소의 순서가 바뀌어도 상관없으므로

 {{2}, {2, 1}, {2, 1, 3}, {2, 1, 3, 4}}
 {{2, 1, 3, 4}, {2}, {2, 1, 3}, {2, 1}}
 {{1, 2, 3}, {2, 1}, {1, 2, 4, 3}, {2}}
 는 모두 같은 튜플 (2, 1, 3, 4)를 나타냅니다.

 특정 튜플을 표현하는 집합이 담긴 문자열 s가 매개변수로 주어질 때, s가 표현하는 튜플을 배열에 담아 return 하도록 solution 함수를 완성해주세요.

 [제한사항]
 s의 길이는 5 이상 1,000,000 이하입니다.
 s는 숫자와 '{', '}', ',' 로만 이루어져 있습니다.
 숫자가 0으로 시작하는 경우는 없습니다.
 s는 항상 중복되는 원소가 없는 튜플을 올바르게 표현하고 있습니다.
 s가 표현하는 튜플의 원소는 1 이상 100,000 이하인 자연수입니다.
 return 하는 배열의 길이가 1 이상 500 이하인 경우만 입력으로 주어집니다.
*/
func solution12(_ s:String) -> [Int] {
    var str = s
    str.removeFirst()
    str.removeFirst()
    str.removeLast()
    str.removeLast()
    var tuples:[[Int]] = str.components(separatedBy: "},{").map {
        $0.components(separatedBy: ",").map {
            Int($0) ?? 0
        }
    }.sorted { $0.count < $1.count }
    
    var result:[Int] = []
    for tuple in tuples {
        var tupleFilter = tuple.filter { !result.contains($0) }
        result.append(tupleFilter[0])
    }
    return result
}

solution12("{{2},{2,1},{2,1,3},{2,1,3,4}}")

/* 멀쩡한 사각형

 - 가로 길이가 Wcm, 세로 길이가 Hcm인 직사각형 종이가 있습니다. 종이에는 가로, 세로 방향과 평행하게 격자 형태로 선이 그어져 있으며, 모든 격자칸은 1cm x 1cm 크기입니다. 이 종이를 격자 선을 따라 1cm × 1cm의 정사각형으로 잘라 사용할 예정이었는데, 누군가가 이 종이를 대각선 꼭지점 2개를 잇는 방향으로 잘라 놓았습니다. 그러므로 현재 직사각형 종이는 크기가 같은 직각삼각형 2개로 나누어진 상태입니다. 새로운 종이를 구할 수 없는 상태이기 때문에, 이 종이에서 원래 종이의 가로, 세로 방향과 평행하게 1cm × 1cm로 잘라 사용할 수 있는 만큼만 사용하기로 하였습니다.
 가로의 길이 W와 세로의 길이 H가 주어질 때, 사용할 수 있는 정사각형의 개수를 구하는 solution 함수를 완성해 주세요.

 제한사항
 W, H : 1억 이하의 자연수
*/
// TODO
func solution11(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0

    return answer
}

/* 괄호 변환

 - 카카오에 신입 개발자로 입사한 "콘"은 선배 개발자로부터 개발역량 강화를 위해 다른 개발자가 작성한 소스 코드를 분석하여 문제점을 발견하고 수정하라는 업무 과제를 받았습니다. 소스를 컴파일하여 로그를 보니 대부분 소스 코드 내 작성된 괄호가 개수는 맞지만 짝이 맞지 않은 형태로 작성되어 오류가 나는 것을 알게 되었습니다.
 수정해야 할 소스 파일이 너무 많아서 고민하던 "콘"은 소스 코드에 작성된 모든 괄호를 뽑아서 올바른 순서대로 배치된 괄호 문자열을 알려주는 프로그램을 다음과 같이 개발하려고 합니다.

 용어의 정의
 '(' 와 ')' 로만 이루어진 문자열이 있을 경우, '(' 의 개수와 ')' 의 개수가 같다면 이를 균형잡힌 괄호 문자열이라고 부릅니다.
 그리고 여기에 '('와 ')'의 괄호의 짝도 모두 맞을 경우에는 이를 올바른 괄호 문자열이라고 부릅니다.
 예를 들어, "(()))("와 같은 문자열은 "균형잡힌 괄호 문자열" 이지만 "올바른 괄호 문자열"은 아닙니다.
 반면에 "(())()"와 같은 문자열은 "균형잡힌 괄호 문자열" 이면서 동시에 "올바른 괄호 문자열" 입니다.

 '(' 와 ')' 로만 이루어진 문자열 w가 "균형잡힌 괄호 문자열" 이라면 다음과 같은 과정을 통해 "올바른 괄호 문자열"로 변환할 수 있습니다.

 1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
 2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
 3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
   3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
 4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
   4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
   4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
   4-3. ')'를 다시 붙입니다.
   4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
   4-5. 생성된 문자열을 반환합니다.
 "균형잡힌 괄호 문자열" p가 매개변수로 주어질 때, 주어진 알고리즘을 수행해 "올바른 괄호 문자열"로 변환한 결과를 return 하도록 solution 함수를 완성해 주세요.

 매개변수 설명
 p는 '(' 와 ')' 로만 이루어진 문자열이며 길이는 2 이상 1,000 이하인 짝수입니다.
 문자열 p를 이루는 '(' 와 ')' 의 개수는 항상 같습니다.
 만약 p가 이미 "올바른 괄호 문자열"이라면 그대로 return 하면 됩니다.
*/
func solution10(_ p:String) -> String {
    func setRightString(p:String, second:String) -> String {
        if p == "" {
            return ""
        }
        var result:String = "("
        result += getRightString(p: second)
        result += ")"
        for i in 1..<p.count-1 {
            if Array(p)[i] == "(" {
                result += ")"
            } else {
                result += "("
            }
        }
        return result
    }
    
    func getRightString(p:String) -> String {
        if p == "" {
            return ""
        }
        var first:[Character] = []
        var second:[Character] = []
        var value:Int = 0
        var index = 0
        var isWright = true
        for s in p {
            if s == "(" {
                value -= 1
            } else {
                value += 1
            }
            index += 1
            if value == 0 {
                break
            } else if value > 0 {
                isWright = false
            }
        }
        first = Array(Array(p)[0..<index])
        if index+1 < p.count {
            second = Array(Array(p)[index..<p.count])
        }
        if !isWright {
            first = Array(setRightString(p: String(first), second: String(second)))
            second = []
        } else {
            second = Array(getRightString(p: String(second)))
        }
        return String(first+second)
    }
    return getRightString(p: p)
}

solution10("()))((()")
solution10("(()())()")

/* 문자열 압축

 - 데이터 처리 전문가가 되고 싶은 "어피치"는 문자열을 압축하는 방법에 대해 공부를 하고 있습니다. 최근에 대량의 데이터 처리를 위한 간단한 비손실 압축 방법에 대해 공부를 하고 있는데, 문자열에서 같은 값이 연속해서 나타나는 것을 그 문자의 개수와 반복되는 값으로 표현하여 더 짧은 문자열로 줄여서 표현하는 알고리즘을 공부하고 있습니다.
 간단한 예로 "aabbaccc"의 경우 "2a2ba3c"(문자가 반복되지 않아 한번만 나타난 경우 1은 생략함)와 같이 표현할 수 있는데, 이러한 방식은 반복되는 문자가 적은 경우 압축률이 낮다는 단점이 있습니다. 예를 들면, "abcabcdede"와 같은 문자열은 전혀 압축되지 않습니다. "어피치"는 이러한 단점을 해결하기 위해 문자열을 1개 이상의 단위로 잘라서 압축하여 더 짧은 문자열로 표현할 수 있는지 방법을 찾아보려고 합니다.

 예를 들어, "ababcdcdababcdcd"의 경우 문자를 1개 단위로 자르면 전혀 압축되지 않지만, 2개 단위로 잘라서 압축한다면 "2ab2cd2ab2cd"로 표현할 수 있습니다. 다른 방법으로 8개 단위로 잘라서 압축한다면 "2ababcdcd"로 표현할 수 있으며, 이때가 가장 짧게 압축하여 표현할 수 있는 방법입니다.

 다른 예로, "abcabcdede"와 같은 경우, 문자를 2개 단위로 잘라서 압축하면 "abcabc2de"가 되지만, 3개 단위로 자른다면 "2abcdede"가 되어 3개 단위가 가장 짧은 압축 방법이 됩니다. 이때 3개 단위로 자르고 마지막에 남는 문자열은 그대로 붙여주면 됩니다.

 압축할 문자열 s가 매개변수로 주어질 때, 위에 설명한 방법으로 1개 이상 단위로 문자열을 잘라 압축하여 표현한 문자열 중 가장 짧은 것의 길이를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 s의 길이는 1 이상 1,000 이하입니다.
 s는 알파벳 소문자로만 이루어져 있습니다.
*/
// TODO
func solution9(_ s:String) -> Int {
    return 0
}

/* 방문 길이

 - 게임 캐릭터를 4가지 명령어를 통해 움직이려 합니다. 명령어는 다음과 같습니다.
 
 U: 위쪽으로 한 칸 가기

 D: 아래쪽으로 한 칸 가기

 R: 오른쪽으로 한 칸 가기

 L: 왼쪽으로 한 칸 가기

 캐릭터는 좌표평면의 (0, 0) 위치에서 시작합니다. 좌표평면의 경계는 왼쪽 위(-5, 5), 왼쪽 아래(-5, -5), 오른쪽 위(5, 5), 오른쪽 아래(5, -5)로 이루어져 있습니다.
 
 명령어가 매개변수 dirs로 주어질 때, 게임 캐릭터가 처음 걸어본 길의 길이를 구하여 return 하는 solution 함수를 완성해 주세요.

 제한사항
 dirs는 string형으로 주어지며, 'U', 'D', 'R', 'L' 이외에 문자는 주어지지 않습니다.
 dirs의 길이는 500 이하의 자연수입니다.
*/
func solution8(_ dirs:String) -> Int {
    var x:Int = 0
    var y:Int = 0
    var result:Int = 0
    var list:[[Int]] = []
    for dir in dirs {
        var exX = x
        var exY = y
        var isAdd = true
        if dir == "U" {
            if y != 5 {
                y += 1
            } else {
                isAdd = false
            }
        } else if dir == "D" {
            if y != -5 {
                y -= 1
            } else {
                isAdd = false
            }
        } else if dir == "R" {
            if x != 5 {
                x += 1
            } else {
                isAdd = false
            }
        } else {
             if x != -5 {
                x -= 1
            } else {
                isAdd = false
            }
        }
        if isAdd && !list.contains([exX,exY,x,y]) && !list.contains([x,y,exX,exY])  {
            list.append([exX, exY, x, y])
            result += 1
        }
    }
    return result
}

/* 스킬트리

 - 선행 스킬이란 어떤 스킬을 배우기 전에 먼저 배워야 하는 스킬을 뜻합니다.
 
 예를 들어 선행 스킬 순서가 스파크 → 라이트닝 볼트 → 썬더일때, 썬더를 배우려면 먼저 라이트닝 볼트를 배워야 하고, 라이트닝 볼트를 배우려면 먼저 스파크를 배워야 합니다.

 위 순서에 없는 다른 스킬(힐링 등)은 순서에 상관없이 배울 수 있습니다. 따라서 스파크 → 힐링 → 라이트닝 볼트 → 썬더와 같은 스킬트리는 가능하지만, 썬더 → 스파크나 라이트닝 볼트 → 스파크 → 힐링 → 썬더와 같은 스킬트리는 불가능합니다.

 선행 스킬 순서 skill과 유저들이 만든 스킬트리1를 담은 배열 skill_trees가 매개변수로 주어질 때, 가능한 스킬트리 개수를 return 하는 solution 함수를 작성해주세요.

 제한 조건
 스킬은 알파벳 대문자로 표기하며, 모든 문자열은 알파벳 대문자로만 이루어져 있습니다.
 스킬 순서와 스킬트리는 문자열로 표기합니다.
 예를 들어, C → B → D 라면 "CBD"로 표기합니다
 선행 스킬 순서 skill의 길이는 1 이상 26 이하이며, 스킬은 중복해 주어지지 않습니다.
 skill_trees는 길이 1 이상 20 이하인 배열입니다.
 skill_trees의 원소는 스킬을 나타내는 문자열입니다.
 skill_trees의 원소는 길이가 2 이상 26 이하인 문자열이며, 스킬이 중복해 주어지지 않습니다.
*/
func solution7(_ skill:String, _ skill_trees:[String]) -> Int {
    var result:Int = 0
    for tree in skill_trees {
        var index = -1
        var isAdd = true
        for s in skill {
            var current:Int = Array(tree).firstIndex(of: s) ?? tree.count
            if current >= index {
                index = Array(tree).firstIndex(of: s) ?? tree.count
            } else {
                isAdd = false
                break
            }
        }
        if isAdd {
            result += 1
        }
    }
    return result
}

/* 타겟 넘버

 - n개의 음이 아닌 정수들이 있습니다. 이 정수들을 순서를 바꾸지 않고 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.
 
 -1+1+1+1+1 = 3
 +1-1+1+1+1 = 3
 +1+1-1+1+1 = 3
 +1+1+1-1+1 = 3
 +1+1+1+1-1 = 3
 사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.

 제한사항
 주어지는 숫자의 개수는 2개 이상 20개 이하입니다.
 각 숫자는 1 이상 50 이하인 자연수입니다.
 타겟 넘버는 1 이상 1000 이하인 자연수입니다.
*/

func combinations<T>(source: [T], takenBy : Int) -> [[T]] {
    if(source.count == takenBy) {
        return [source]
    }

    if(source.isEmpty) {
        return []
    }

    if(takenBy == 0) {
        return []
    }

    if(takenBy == 1) {
        return source.map { [$0] }
    }

    var result : [[T]] = []

    let rest = Array(source.suffix(from: 1))
    let subCombos = combinations(source: rest, takenBy: takenBy - 1)
    result += subCombos.map { [source[0]] + $0 }
    result += combinations(source: rest, takenBy: takenBy)
    return result
}

func allCombos<T>(elements: Array<T>) -> [[T]] {
    var answer: [[T]] = []
    for i in 1...elements.count {
        answer.append(contentsOf: combinations(source: elements, takenBy: i))
    }
    return answer
}

func solution6(_ numbers:[Int], _ target:Int) -> Int {
    var value = (numbers.reduce(0, +)-target)/2
    var list:[[Int]] = allCombos(elements: numbers).filter {
        $0.reduce(0,+) == value
    }
    return list.count
}

solution6([4, 1, 2, 1], 4)

/* 후보키

 - 후보키
 프렌즈대학교 컴퓨터공학과 조교인 제이지는 네오 학과장님의 지시로, 학생들의 인적사항을 정리하는 업무를 담당하게 되었다.

 그의 학부 시절 프로그래밍 경험을 되살려, 모든 인적사항을 데이터베이스에 넣기로 하였고, 이를 위해 정리를 하던 중에 후보키(Candidate Key)에 대한 고민이 필요하게 되었다.

 후보키에 대한 내용이 잘 기억나지 않던 제이지는, 정확한 내용을 파악하기 위해 데이터베이스 관련 서적을 확인하여 아래와 같은 내용을 확인하였다.

 관계 데이터베이스에서 릴레이션(Relation)의 튜플(Tuple)을 유일하게 식별할 수 있는 속성(Attribute) 또는 속성의 집합 중, 다음 두 성질을 만족하는 것을 후보 키(Candidate Key)라고 한다.
 유일성(uniqueness) : 릴레이션에 있는 모든 튜플에 대해 유일하게 식별되어야 한다.
 최소성(minimality) : 유일성을 가진 키를 구성하는 속성(Attribute) 중 하나라도 제외하는 경우 유일성이 깨지는 것을 의미한다. 즉, 릴레이션의 모든 튜플을 유일하게 식별하는 데 꼭 필요한 속성들로만 구성되어야 한다.
 제이지를 위해, 아래와 같은 학생들의 인적사항이 주어졌을 때, 후보 키의 최대 개수를 구하라.

 cand_key1.png

 위의 예를 설명하면, 학생의 인적사항 릴레이션에서 모든 학생은 각자 유일한 "학번"을 가지고 있다. 따라서 "학번"은 릴레이션의 후보 키가 될 수 있다.
 그다음 "이름"에 대해서는 같은 이름("apeach")을 사용하는 학생이 있기 때문에, "이름"은 후보 키가 될 수 없다. 그러나, 만약 ["이름", "전공"]을 함께 사용한다면 릴레이션의 모든 튜플을 유일하게 식별 가능하므로 후보 키가 될 수 있게 된다.
 물론 ["이름", "전공", "학년"]을 함께 사용해도 릴레이션의 모든 튜플을 유일하게 식별할 수 있지만, 최소성을 만족하지 못하기 때문에 후보 키가 될 수 없다.
 따라서, 위의 학생 인적사항의 후보키는 "학번", ["이름", "전공"] 두 개가 된다.

 릴레이션을 나타내는 문자열 배열 relation이 매개변수로 주어질 때, 이 릴레이션에서 후보 키의 개수를 return 하도록 solution 함수를 완성하라.

 제한사항
 relation은 2차원 문자열 배열이다.
 relation의 컬럼(column)의 길이는 1 이상 8 이하이며, 각각의 컬럼은 릴레이션의 속성을 나타낸다.
 relation의 로우(row)의 길이는 1 이상 20 이하이며, 각각의 로우는 릴레이션의 튜플을 나타낸다.
 relation의 모든 문자열의 길이는 1 이상 8 이하이며, 알파벳 소문자와 숫자로만 이루어져 있다.
 relation의 모든 튜플은 유일하게 식별 가능하다.(즉, 중복되는 튜플은 없다.)
*/
// TODO
func solution5(_ relation:[[String]]) -> Int {
    return 0
}

/* 오픈채팅방

 - 오픈채팅방
 카카오톡 오픈채팅방에서는 친구가 아닌 사람들과 대화를 할 수 있는데, 본래 닉네임이 아닌 가상의 닉네임을 사용하여 채팅방에 들어갈 수 있다.

 신입사원인 김크루는 카카오톡 오픈 채팅방을 개설한 사람을 위해, 다양한 사람들이 들어오고, 나가는 것을 지켜볼 수 있는 관리자창을 만들기로 했다. 채팅방에 누군가 들어오면 다음 메시지가 출력된다.

 "[닉네임]님이 들어왔습니다."

 채팅방에서 누군가 나가면 다음 메시지가 출력된다.

 "[닉네임]님이 나갔습니다."

 채팅방에서 닉네임을 변경하는 방법은 다음과 같이 두 가지이다.

 채팅방을 나간 후, 새로운 닉네임으로 다시 들어간다.
 채팅방에서 닉네임을 변경한다.
 닉네임을 변경할 때는 기존에 채팅방에 출력되어 있던 메시지의 닉네임도 전부 변경된다.

 예를 들어, 채팅방에 "Muzi"와 "Prodo"라는 닉네임을 사용하는 사람이 순서대로 들어오면 채팅방에는 다음과 같이 메시지가 출력된다.

 "Muzi님이 들어왔습니다."
 "Prodo님이 들어왔습니다."

 채팅방에 있던 사람이 나가면 채팅방에는 다음과 같이 메시지가 남는다.

 "Muzi님이 들어왔습니다."
 "Prodo님이 들어왔습니다."
 "Muzi님이 나갔습니다."

 Muzi가 나간후 다시 들어올 때, Prodo 라는 닉네임으로 들어올 경우 기존에 채팅방에 남아있던 Muzi도 Prodo로 다음과 같이 변경된다.

 "Prodo님이 들어왔습니다."
 "Prodo님이 들어왔습니다."
 "Prodo님이 나갔습니다."
 "Prodo님이 들어왔습니다."

 채팅방은 중복 닉네임을 허용하기 때문에, 현재 채팅방에는 Prodo라는 닉네임을 사용하는 사람이 두 명이 있다. 이제, 채팅방에 두 번째로 들어왔던 Prodo가 Ryan으로 닉네임을 변경하면 채팅방 메시지는 다음과 같이 변경된다.

 "Prodo님이 들어왔습니다."
 "Ryan님이 들어왔습니다."
 "Prodo님이 나갔습니다."
 "Prodo님이 들어왔습니다."

 채팅방에 들어오고 나가거나, 닉네임을 변경한 기록이 담긴 문자열 배열 record가 매개변수로 주어질 때, 모든 기록이 처리된 후, 최종적으로 방을 개설한 사람이 보게 되는 메시지를 문자열 배열 형태로 return 하도록 solution 함수를 완성하라.

 제한사항
 record는 다음과 같은 문자열이 담긴 배열이며, 길이는 1 이상 100,000 이하이다.
 다음은 record에 담긴 문자열에 대한 설명이다.
 모든 유저는 [유저 아이디]로 구분한다.
 [유저 아이디] 사용자가 [닉네임]으로 채팅방에 입장 - "Enter [유저 아이디] [닉네임]" (ex. "Enter uid1234 Muzi")
 [유저 아이디] 사용자가 채팅방에서 퇴장 - "Leave [유저 아이디]" (ex. "Leave uid1234")
 [유저 아이디] 사용자가 닉네임을 [닉네임]으로 변경 - "Change [유저 아이디] [닉네임]" (ex. "Change uid1234 Muzi")
 첫 단어는 Enter, Leave, Change 중 하나이다.
 각 단어는 공백으로 구분되어 있으며, 알파벳 대문자, 소문자, 숫자로만 이루어져있다.
 유저 아이디와 닉네임은 알파벳 대문자, 소문자를 구별한다.
 유저 아이디와 닉네임의 길이는 1 이상 10 이하이다.
 채팅방에서 나간 유저가 닉네임을 변경하는 등 잘못 된 입력은 주어지지 않는다.
*/
func solution4(_ record:[String]) -> [String] {
    var userDic:[String:String] = [:]
    record.filter {
        Array($0)[0] == "C" || Array($0)[0] == "E"
    }.map {
        var list = $0.components(separatedBy: " ")
        userDic[list[1]] = list[2]
    }
    var result:[String] = []
    for data in record {
        var list = data.components(separatedBy: " ")
        if list[0] == "Enter" {
            var nickName:String = userDic[list[1]] ?? list[2]
            userDic[list[1]] = nickName
            result.append("\(nickName)님이 들어왔습니다.")
        } else if list[0] == "Leave" {
            var nickName:String = userDic[list[1]] ?? ""
            result.append("\(nickName)님이 나갔습니다.")
        }
    }
    return result
}

solution4(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])

/* 큰 수 만들기

 - 어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 구하려 합니다.
 
 예를 들어, 숫자 1924에서 수 두 개를 제거하면 [19, 12, 14, 92, 94, 24] 를 만들 수 있습니다. 이 중 가장 큰 숫자는 94 입니다.

 문자열 형식으로 숫자 number와 제거할 수의 개수 k가 solution 함수의 매개변수로 주어집니다. number에서 k 개의 수를 제거했을 때 만들 수 있는 수 중 가장 큰 숫자를 문자열 형태로 return 하도록 solution 함수를 완성하세요.

 제한 조건
 number는 2자리 이상, 1,000,000자리 이하인 숫자입니다.
 k는 1 이상 number의 자릿수 미만인 자연수입니다.
*/
func solution3(_ number:String, _ k:Int) -> String {
    var numberList:[Character] = Array(number)
    var count = k
    var index = 0
    var result:[Character] = []
    while count > 0 {
        if index+count == numberList.count {
            return String(result)
        }
        var maxValue:Character = numberList[index]
        var maxIndex:Int = index
        for i in index...index+count {
            if numberList[i] == "9" {
                maxValue = "9"
                maxIndex = i
                break
            } else if maxValue < numberList[i] {
                maxValue = numberList[i]
                maxIndex = i
            }
        }
        count -= maxIndex-index
        index = maxIndex+1
        result.append(maxValue)
    }
    if index < number.count-1 {
        result += numberList[index...number.count-1]
    }
    return String(result)
}

solution3("1924", 2)
solution3("4321", 1) // "432"
solution3("4177252841", 4) // "775841"
solution3("1231234", 3) // 3234

// 시간초과
func solution35(_ number:String, _ k:Int) -> String {
    var numberList:[Character] = Array(number)
    var count = k
    var index = 0
    var result:[Character] = []
    while count > 0 {
        if index+count == numberList.count {
            print("aaa")
            return String(result)
        }
        var list:[Character] = Array(numberList[index...index+count])
        var maxValue:Character = "0"
        for i in list {
            if i == "9" {
                maxValue = "9"
                break
            } else if maxValue < i {
                maxValue = i
            }
        }
        for i in index...index+count {
            index += 1
            if numberList[i] < maxValue {
                count -= 1
                print(count)
            } else {
                result.append(numberList[i])
                break
            }
        }
        
    }
    if index < number.count-1 {
        result += numberList[index...number.count-1]
    }
    return String(result)
}

// 시간초과
func solution34(_ number:String, _ k:Int) -> String {
    var result:[Character] = Array(number)
    var count = k
    var index = 0
    while count > 0 {
        if index+count == result.count {
            return String(result[0..<index].filter{ $0 != Character("A") })
        }
        var list:[Character] = Array(result[index...index+count])
        var maxValue:Character = list.max()!
        var minValue:Character = list.min()!
        if maxValue == minValue {
            for i in index+count+1...result.count-1 {
                if result[i] > maxValue {
                    index = i-1
                    break
                } else if result[i] < maxValue {
                    index = i
                    break
                }
            }
        } else {
            for i in index...index+count {
                index += 1
                if result[i] < maxValue {
                    count -= 1
                    result[i] = Character("A")
                } else {
                    break
                }
            }
        }
    }
    
    return String(result.filter{ $0 != Character("A") })
}

struct MaxHeap<T: Comparable> {
    var heap: [T] = []

    var isEmpty: Bool {
        heap.count <= 1 ? true : false
    }

    init() {}
    init(_ element: T) {
        heap.append(element)
        heap.append(element)
    }
    
    mutating func insert(_ element: T) {
        if heap.isEmpty {
            heap.append(element)
            heap.append(element)
            return
        }
        heap.append(element)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 { // rootNode
                return false
            }
            let parentIndex = insertIndex / 2
            return heap[insertIndex] > heap[parentIndex] ? true : false
        }
        
        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus {case left, right, none}
    
    mutating func pop() -> T? {
        if heap.count <= 1 {
            return nil
        }
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = poppedIndex * 2
            let rightChildIndex = leftChildIndex + 1
            
            // case1. 모든(왼쪽) 자식 노드가 없는 경우, (완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= heap.count {
                return .none
            }
            
            // case2. 왼쪽 자식 노드만 있는 경우,
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
            }
            
            // case3. 왼쪽&오른쪽 자식 노드 모두 있는 경우
            // case3-1. 자식들보다 자신이 모두 큰 경우(자신이 제일 큰 경우)
            if (heap[poppedIndex] > heap[leftChildIndex]) && (heap[poppedIndex] > heap[rightChildIndex]) {
                return .none
            }
            
            // case3-2. 자식들이 자신보다 모두 큰 경우(왼쪽과 오른쪽 자식 중, 더 큰 자식을 선별)
            if (heap[poppedIndex] < heap[leftChildIndex]) && (heap[poppedIndex] < heap[rightChildIndex]) {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            
            // case3-3. 왼쪽과 오른쪽 자식 중, 한 자식만 자신보다 큰 경우, (= 둘 중 하나의 자식만 큰 경우)
            if (heap[leftChildIndex] > heap[poppedIndex]) || (heap[rightChildIndex] > heap[poppedIndex]) {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            return .none
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(leftChildIndex, poppedIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = poppedIndex * 2 + 1
                heap.swapAt(rightChildIndex, poppedIndex)
                poppedIndex = rightChildIndex
            }
        }
        
    }
}

// 시간초과
func solution33(_ number:String, _ k:Int) -> String {
    var result:[Character] = Array(number)
    var count = k
    var index = 0
    while count > 0 {
        if index+count == result.count {
            return String(result[0..<index].filter{ $0 != Character("A") })
        }
        var maxHeap: MaxHeap<Character> = MaxHeap()
        for i in index...index+count {
            maxHeap.insert(result[i])
        }
        var maxValue:Character = maxHeap.pop()!
        for i in index...index+count {
            index += 1
            if result[i] < maxValue {
                count -= 1
                result[i] = Character("A")
            } else {
                break
            }
        }
    }
    return String(result.filter{ $0 != Character("A") })
}

// 시간초과
func solution32(_ number:String, _ k:Int) -> String {
    var result:[Character] = Array(number)
    var count = k
    var index = 0
    while count > 0 {
        if index+count == result.count {
            return String(result[0..<index].filter{ $0 != Character("A") })
        }
        var list:[Character] = Array(result[index...index+count])
        var maxValue:Character = list.max()!
        for i in index...index+count {
            index += 1
            if result[i] < maxValue {
                count -= 1
                result[i] = Character("A")
            } else {
                break
            }
        }
    }
    return String(result.filter{ $0 != Character("A") })
}

// 시간초과
func solution31(_ number:String, _ k:Int) -> String {
    if number.count-k == 1 {
        return String(number.sorted(by: >)[0])
    }
    var max:Int = 0
    var list = combinations(source: Array(number), takenBy: number.count-k).sorted{ ($0[0] > $1[0]) || ($0[0] == $1[0] && $0[1] > $1[1]) }
    var first = list[0][0]
    var second = list[0][1]
    for i in list {
        if i[0] == first && i[1] == second {
            if Int(String(i)) ?? 0 > max {
                max = Int(String(i))!
            }
        } else {
            break
        }
    }
    return String(max)
}

solution31("1231234", 3) // 3234

/* 조이스틱

 - 조이스틱으로 알파벳 이름을 완성하세요. 맨 처음엔 A로만 이루어져 있습니다.
 ex) 완성해야 하는 이름이 세 글자면 AAA, 네 글자면 AAAA

 조이스틱을 각 방향으로 움직이면 아래와 같습니다.

 ▲ - 다음 알파벳
 ▼ - 이전 알파벳 (A에서 아래쪽으로 이동하면 Z로)
 ◀ - 커서를 왼쪽으로 이동 (첫 번째 위치에서 왼쪽으로 이동하면 마지막 문자에 커서)
 ▶ - 커서를 오른쪽으로 이동 (마지막 위치에서 오른쪽으로 이동하면 첫 번째 문자에 커서)
 예를 들어 아래의 방법으로 "JAZ"를 만들 수 있습니다.

 - 첫 번째 위치에서 조이스틱을 위로 9번 조작하여 J를 완성합니다.
 - 조이스틱을 왼쪽으로 1번 조작하여 커서를 마지막 문자 위치로 이동시킵니다.
 - 마지막 위치에서 조이스틱을 아래로 1번 조작하여 Z를 완성합니다.
 따라서 11번 이동시켜 "JAZ"를 만들 수 있고, 이때가 최소 이동입니다.
 만들고자 하는 이름 name이 매개변수로 주어질 때, 이름에 대해 조이스틱 조작 횟수의 최솟값을 return 하도록 solution 함수를 만드세요.
 
 제한 사항
 name은 알파벳 대문자로만 이루어져 있습니다.
 name의 길이는 1 이상 20 이하입니다.
*/
// TODO
func solution2(_ name:String) -> Int {
    let uppercase:[Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var result1:Int = 0
    for char in name {
        if uppercase.firstIndex(of: char)! < 13 {
            result1 += uppercase.firstIndex(of: char)!
        } else {
            result1 += 26 - uppercase.firstIndex(of: char)!
        }
        result1 += 1
    }
    result1 -= 1
    
    var result2:Int = 1
    for char in name.reversed() {
        if uppercase.firstIndex(of: char)! < 13 {
            result2 += uppercase.firstIndex(of: char)!
        } else {
            result2 += 26 - uppercase.firstIndex(of: char)!
        }
        result2 += 1
    }
    result2 -= 1
    return min(result1,result2)
}

/* 카펫

 - Leo는 카펫을 사러 갔다가 아래 그림과 같이 중앙에는 노란색으로 칠해져 있고 테두리 1줄은 갈색으로 칠해져 있는 격자 모양 카펫을 봤습니다.
 
 Leo는 집으로 돌아와서 아까 본 카펫의 노란색과 갈색으로 색칠된 격자의 개수는 기억했지만, 전체 카펫의 크기는 기억하지 못했습니다.

 Leo가 본 카펫에서 갈색 격자의 수 brown, 노란색 격자의 수 yellow가 매개변수로 주어질 때 카펫의 가로, 세로 크기를 순서대로 배열에 담아 return 하도록 solution 함수를 작성해주세요.

 제한사항
 갈색 격자의 수 brown은 8 이상 5,000 이하인 자연수입니다.
 노란색 격자의 수 yellow는 1 이상 2,000,000 이하인 자연수입니다.
 카펫의 가로 길이는 세로 길이와 같거나, 세로 길이보다 깁니다.
*/
func solution1(_ brown:Int, _ yellow:Int) -> [Int] {
    var width:Int = brown/2 + 2 - 1
    var length:Int = 1

    for i in 1...brown/2+2 {
        if (width-2)*(length-2) == yellow {
            break;
        }
        width -= 1
        length += 1
    }
    return [width,length]
}
