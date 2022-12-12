import Foundation

/* 점 찍기

 - 좌표평면을 좋아하는 진수는 x축과 y축이 직교하는 2차원 좌표평면에 점을 찍으면서 놀고 있습니다. 진수는 두 양의 정수 k, d가 주어질 때 다음과 같이 점을 찍으려 합니다.
 
 원점(0, 0)으로부터 x축 방향으로 a*k(a = 0, 1, 2, 3 ...), y축 방향으로 b*k(b = 0, 1, 2, 3 ...)만큼 떨어진 위치에 점을 찍습니다.
 원점과 거리가 d를 넘는 위치에는 점을 찍지 않습니다.
 예를 들어, k가 2, d가 4인 경우에는 (0, 0), (0, 2), (0, 4), (2, 0), (2, 2), (4, 0) 위치에 점을 찍어 총 6개의 점을 찍습니다.

 정수 k와 원점과의 거리를 나타내는 정수 d가 주어졌을 때, 점이 총 몇 개 찍히는지 return 하는 solution 함수를 완성하세요.

 제한사항
 1 ≤ k ≤ 1,000,000
 1 ≤ d ≤ 1,000,000
*/
func solution21(_ k:Int, _ d:Int) -> Int64 {
    var result:Int64 = 0
    for i in 0...d/k {
        result += Int64(sqrt(pow(Double(d)/Double(k),2)-pow(Double(i),2)))+1
    }
    return result
}

solution21(1,5)
solution21(2,4)

/* 귤 고르기

 - 경화는 과수원에서 귤을 수확했습니다. 경화는 수확한 귤 중 'k'개를 골라 상자 하나에 담아 판매하려고 합니다. 그런데 수확한 귤의 크기가 일정하지 않아 보기에 좋지 않다고 생각한 경화는 귤을 크기별로 분류했을 때 서로 다른 종류의 수를 최소화하고 싶습니다.
 
 예를 들어, 경화가 수확한 귤 8개의 크기가 [1, 3, 2, 5, 4, 5, 2, 3] 이라고 합시다. 경화가 귤 6개를 판매하고 싶다면, 크기가 1, 4인 귤을 제외한 여섯 개의 귤을 상자에 담으면, 귤의 크기의 종류가 2, 3, 5로 총 3가지가 되며 이때가 서로 다른 종류가 최소일 때입니다.

 경화가 한 상자에 담으려는 귤의 개수 k와 귤의 크기를 담은 배열 tangerine이 매개변수로 주어집니다. 경화가 귤 k개를 고를 때 크기가 서로 다른 종류의 수의 최솟값을 return 하도록 solution 함수를 작성해주세요.

 제한사항
 1 ≤ k ≤ tangerine의 길이 ≤ 100,000
 1 ≤ tangerine의 원소 ≤ 10,000,000
*/
func solution20(_ k:Int, _ tangerine:[Int]) -> Int {
    var result:Int = 0
    var value:Int = k
    let dic = Dictionary(grouping: tangerine) {
        $0
    }.sorted {
        $0.value.count > $1.value.count
    }
    for d in dic {
        if value <= 0 {
            break
        } else {
            value -= d.value.count
            result += 1
        }
    }
    return result
}

solution20(6,[1, 3, 2, 5, 4, 5, 2, 3])

/* 숫자 카드 나누기

 - 철수와 영희는 선생님으로부터 숫자가 하나씩 적힌 카드들을 절반씩 나눠서 가진 후, 다음 두 조건 중 하나를 만족하는 가장 큰 양의 정수 a의 값을 구하려고 합니다.
 
 철수가 가진 카드들에 적힌 모든 숫자를 나눌 수 있고 영희가 가진 카드들에 적힌 모든 숫자들 중 하나도 나눌 수 없는 양의 정수 a
 영희가 가진 카드들에 적힌 모든 숫자를 나눌 수 있고, 철수가 가진 카드들에 적힌 모든 숫자들 중 하나도 나눌 수 없는 양의 정수 a
 예를 들어, 카드들에 10, 5, 20, 17이 적혀 있는 경우에 대해 생각해 봅시다. 만약, 철수가 [10, 17]이 적힌 카드를 갖고, 영희가 [5, 20]이 적힌 카드를 갖는다면 두 조건 중 하나를 만족하는 양의 정수 a는 존재하지 않습니다. 하지만, 철수가 [10, 20]이 적힌 카드를 갖고, 영희가 [5, 17]이 적힌 카드를 갖는다면, 철수가 가진 카드들의 숫자는 모두 10으로 나눌 수 있고, 영희가 가진 카드들의 숫자는 모두 10으로 나눌 수 없습니다. 따라서 철수와 영희는 각각 [10, 20]이 적힌 카드, [5, 17]이 적힌 카드로 나눠 가졌다면 조건에 해당하는 양의 정수 a는 10이 됩니다.

 철수가 가진 카드에 적힌 숫자들을 나타내는 정수 배열 arrayA와 영희가 가진 카드에 적힌 숫자들을 나타내는 정수 배열 arrayB가 주어졌을 때, 주어진 조건을 만족하는 가장 큰 양의 정수 a를 return하도록 solution 함수를 완성해 주세요. 만약, 조건을 만족하는 a가 없다면, 0을 return 해 주세요.

 제한사항
 1 ≤ arrayA의 길이 = arrayB의 길이 ≤ 500,000
 1 ≤ arrayA의 원소, arrayB의 원소 ≤ 100,000,000
 arrayA와 arrayB에는 중복된 원소가 있을 수 있습니다.
*/

// 최대공약수
func gcd(_ a: Int, _ b: Int) -> Int{
    if (b == 0) { return a }
    return gcd(b, a % b)
}

func solution19(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let sortedA = arrayA.sorted(by: <)
    let sortedB = arrayB.sorted(by: <)
    var gcdA = sortedA[0]
    if sortedA.count > 1 {
        for i in 1...sortedA.count-1 {
            gcdA = gcd(sortedA[i], gcdA)
            if gcdA == 1 {
                break
            }
        }
    }
    var gcdB = sortedB[0]
    if sortedB.count > 1 {
        for i in 1...sortedB.count-1 {
            gcdB = gcd(sortedB[i], gcdB)
            if gcdB == 1 {
                break
            }
        }
    }
    if gcdA == 1 && gcdB == 1 {
        return 0
    }
    if gcdA != 1 {
        for i in 0...sortedB.count-1 {
            if sortedB[i]%gcdA == 0 {
                gcdA = 0
                break
            }
        }
    } else {
        gcdA = 0
    }
    if gcdB != 1 {
        for i in 0...sortedA.count-1 {
            if sortedA[i]%gcdB == 0 {
                gcdB = 0
                break
            }
        }
    } else {
        gcdB = 0
    }
    return max(gcdA, gcdB)
}

solution19([10, 17],[5, 20, 10])

/* 우박수열 정적분

 - 콜라츠 추측이란 로타르 콜라츠(Lothar Collatz)가 1937년에 제기한 추측으로 모든 자연수 n에 대해 다음 작업을 반복하면 항상 1로 만들 수 있다는 추측입니다.
 
 1-1. 입력된 수가 짝수라면 2로 나눕니다.
 1-2. 입력된 수가 홀수라면 3을 곱하고 1을 더합니다.
 2.결과로 나온 수가 1보다 크다면 1번 작업을 반복합니다.
 예를 들어 주어진 수가 5 라면 5 ⇒ 16 ⇒ 8 ⇒ 4 ⇒2 ⇒ 1 이되어 총 5번만에 1이 됩니다.

 수가 커졌다 작아지기를 반복하는 모습이 비구름에서 빗방울이 오르락내리락하며 우박이 되는 모습과 비슷하다고 하여 우박수 또는 우박수열로 불리기도 합니다. 현재 이 추측이 참인지 거짓인지 증명되지 않았지만 약 1해까지의 수에서 반례가 없음이 밝혀져 있습니다.

 은지는 우박수열을 좌표 평면 위에 꺾은선 그래프로 나타내보려고 합니다. 초항이 K인 우박수열이 있다면, x = 0일때 y = K이고 다음 우박수는 x = 1에 표시합니다. 이런 식으로 우박수가 1이 될 때까지 점들을 찍고 인접한 점들끼리 직선으로 연결하면 다음과 같이 꺾은선 그래프를 만들 수 있습니다.
 
 은지는 이렇게 만든 꺾은선 그래프를 정적분 해보고 싶어졌습니다. x에 대한 어떤 범위 [a, b]가 주어진다면 이 범위에 대한 정적분 결과는 꺾은선 그래프와 x = a, x = b, y = 0 으로 둘러 쌓인 공간의 면적과 같습니다. 은지는 이것을 우박수열 정적분이라고 정의하였고 다양한 구간에 대해서 우박수열 정적분을 해보려고 합니다.

 단, 우박수열 그래프의 가로축 길이를 미리 알 수 없기 때문에 구간의 시작은 음이 아닌 정수, 구간의 끝은 양이 아닌 정수로 표현합니다. 이는 각각 꺾은선 그래프가 시작하는 점과 끝나는 점의 x좌표에 대한 상대적인 오프셋을 의미합니다.

 예를 들어, 5를 초항으로 하는 우박수열은 5 ⇒ 16 ⇒ 8 ⇒ 4 ⇒ 2 ⇒ 1 입니다. 이를 좌표 평면으로 옮기면 (0, 5), (1, 16), (2, 8), (3, 4), (4, 2), (5, 1) 에 점이 찍히고 점들을 연결하면 꺾은선 그래프가 나옵니다. 이를 [0,0] 구간에 대해 정적분 한다면 전체 구간에 대한 정적분이며, [1,-2] 구간에 대해 정적분 한다면 1 ≤ x ≤ 3인 구간에 대한 정적분입니다.

 우박수의 초항 k와, 정적분을 구하는 구간들의 목록 ranges가 주어졌을 때 정적분의 결과 목록을 return 하도록 solution을 완성해주세요. 단, 주어진 구간의 시작점이 끝점보다 커서 유효하지 않은 구간이 주어질 수 있으며 이때의 정적분 결과는 -1로 정의합니다.

 제한사항
 2 ≤ k ≤ 10,000
 1 ≤ ranges의 길이 ≤ 10,000
 ranges의 원소는 [a, b] 형식이며 0 ≤ a < 200, -200 < b ≤ 0 입니다.
 주어진 모든 입력에 대해 정적분의 결과는 227 을 넘지 않습니다.
 본 문제는 정답에 실수형이 포함되는 문제입니다. 입출력 예의 소수 부분 .0이 코드 실행 버튼 클릭 후 나타나는 결괏값, 기댓값 표시와 다를 수 있습니다.
*/
func getCollatz(_ num:Double) -> Double {
    if Int(num)%2 == 0 {
        return num/2
    } else {
        return num*3+1
    }
}

func solution18(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var collatzList:[Double] = [Double(k)]
    var sizeList:[Double] = []
    while collatzList.last! != 1 {
        var lastNum = collatzList.last!
        var num = getCollatz(lastNum)
        sizeList.append((lastNum+num)/2)
        collatzList.append(num)
    }
    
    var result:[Double] = []
    for range in ranges {
        if sizeList.count + range[1] == range[0] {
            result.append(0)
        } else if sizeList.count + range[1] < range[0] {
            result.append(-1)
        } else {
            result.append(sizeList[range[0]...sizeList.count-1+range[1]].reduce(0, +))
        }
    }
    return result
}

solution18(5, [[0,0],[0,-1],[2,-3],[3,-3]])

/* 롤케이크 자르기

 - 철수는 롤케이크를 두 조각으로 잘라서 동생과 한 조각씩 나눠 먹으려고 합니다. 이 롤케이크에는 여러가지 토핑들이 일렬로 올려져 있습니다. 철수와 동생은 롤케이크를 공평하게 나눠먹으려 하는데, 그들은 롤케이크의 크기보다 롤케이크 위에 올려진 토핑들의 종류에 더 관심이 많습니다. 그래서 잘린 조각들의 크기와 올려진 토핑의 개수에 상관없이 각 조각에 동일한 가짓수의 토핑이 올라가면 공평하게 롤케이크가 나누어진 것으로 생각합니다.
 
 예를 들어, 롤케이크에 4가지 종류의 토핑이 올려져 있다고 합시다. 토핑들을 1, 2, 3, 4와 같이 번호로 표시했을 때, 케이크 위에 토핑들이 [1, 2, 1, 3, 1, 4, 1, 2] 순서로 올려져 있습니다. 만약 세 번째 토핑(1)과 네 번째 토핑(3) 사이를 자르면 롤케이크의 토핑은 [1, 2, 1], [3, 1, 4, 1, 2]로 나뉘게 됩니다. 철수가 [1, 2, 1]이 놓인 조각을, 동생이 [3, 1, 4, 1, 2]가 놓인 조각을 먹게 되면 철수는 두 가지 토핑(1, 2)을 맛볼 수 있지만, 동생은 네 가지 토핑(1, 2, 3, 4)을 맛볼 수 있으므로, 이는 공평하게 나누어진 것이 아닙니다. 만약 롤케이크의 네 번째 토핑(3)과 다섯 번째 토핑(1) 사이를 자르면 [1, 2, 1, 3], [1, 4, 1, 2]로 나뉘게 됩니다. 이 경우 철수는 세 가지 토핑(1, 2, 3)을, 동생도 세 가지 토핑(1, 2, 4)을 맛볼 수 있으므로, 이는 공평하게 나누어진 것입니다. 공평하게 롤케이크를 자르는 방법은 여러가지 일 수 있습니다. 위의 롤케이크를 [1, 2, 1, 3, 1], [4, 1, 2]으로 잘라도 공평하게 나뉩니다. 어떤 경우에는 롤케이크를 공평하게 나누지 못할 수도 있습니다.

 롤케이크에 올려진 토핑들의 번호를 저장한 정수 배열 topping이 매개변수로 주어질 때, 롤케이크를 공평하게 자르는 방법의 수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ topping의 길이 ≤ 1,000,000
 1 ≤ topping의 원소 ≤ 10,000
*/
func solution174(_ topping:[Int]) -> Int {
    if topping.count == 1 {
        return 0
    }
    var sameIndexList:[Int] = []
    var startIndex:Int = 0
    var endIndex:Int = topping.count-1
    var mediumIndex:Int = startIndex + (endIndex-startIndex+1)/2
    while true {
        if sameIndexList.count > 1 && sameIndexList[0] == startIndex && sameIndexList[sameIndexList.count-1] == endIndex {
            break
        }
        if endIndex - startIndex < 1 ||
            startIndex > endIndex ||
            mediumIndex <= startIndex ||
            mediumIndex >= endIndex {
            break
        }
        if sameIndexList.count == 0 {
            var firstSet:Set<Int> = Set<Int>()
            firstSet.formUnion(topping[0...mediumIndex])
            var secondSet:Set<Int> = Set<Int>()
            secondSet.formUnion(topping[mediumIndex+1...topping.count-1])
            if firstSet.count == secondSet.count {
                sameIndexList.append(mediumIndex)
                mediumIndex = startIndex + (mediumIndex-startIndex+1)/2
            } else if firstSet.count < secondSet.count {
                startIndex = mediumIndex
            } else {
                endIndex = mediumIndex
            }
        } else {
            var firstSet:Set<Int> = Set<Int>()
            firstSet.formUnion(topping[0...mediumIndex])
            var secondSet:Set<Int> = Set<Int>()
            secondSet.formUnion(topping[mediumIndex+1...topping.count-1])
            if firstSet.count == secondSet.count {
                if !sameIndexList.contains(startIndex) {
                    sameIndexList.insert(mediumIndex, at: 0)
                    mediumIndex = startIndex + (mediumIndex-startIndex+1)/2
                } else {
                    sameIndexList.append(mediumIndex)
                    mediumIndex = mediumIndex + (endIndex-mediumIndex+1)/2
                }
            } else if firstSet.count < secondSet.count {
                startIndex = mediumIndex
            } else {
                endIndex = mediumIndex
            }
        }
     }
    
    return sameIndexList.count > 1 ? sameIndexList[sameIndexList.count-1] - sameIndexList[0] + 1 : sameIndexList.count
}

solution174([1, 2, 3, 1, 4])
solution174([1, 2, 1, 3, 1, 4, 1, 2])

func solution173(_ topping:[Int]) -> Int {
    if topping.count == 1 {
        return 0
    }
    var isMatch = false
    var matchIndex = 0
    for i in 0...topping.count-1 {
        var firstSet:Set<Int> = Set<Int>()
        firstSet.formUnion(topping[0...i])
        var secondSet:Set<Int> = Set<Int>()
        secondSet.formUnion(topping[i+1...topping.count-1])
        if firstSet.count == secondSet.count {
            isMatch = true
            matchIndex = i
            break
        } else if firstSet.count > secondSet.count {
            break
        }
    }
    if !isMatch {
        return 0
    }
    var matchIndex2 = 0
    for i in 0...topping.count-1 {
        var firstSet:Set<Int> = Set<Int>()
        firstSet.formUnion(topping[0...topping.count-i-2])
        var secondSet:Set<Int> = Set<Int>()
        secondSet.formUnion(topping[topping.count-1-i...topping.count-1])
        if firstSet.count == secondSet.count {
            matchIndex2 = topping.count-1-i
            break
        }
    }
    
    return matchIndex2-matchIndex
}

solution173([1, 2, 3, 1, 4])
solution173([1, 2, 1, 3, 1, 4, 1, 2])

func solution172(_ topping:[Int]) -> Int {
    if topping.count == 1 {
        return 0
    }
    var result:Int = 0
    for i in 0...topping.count-1 {
        var firstSet:Set<Int> = Set<Int>()
        firstSet.formUnion(topping[0...i])
        var secondSet:Set<Int> = Set<Int>()
        secondSet.formUnion(topping[i+1...topping.count-1])
        if firstSet.count == secondSet.count {
            result += 1
        } else if firstSet.count > secondSet.count {
            break
        }
    }
    return result
}

solution172([1, 2, 3, 1, 4])
solution172([1, 2, 1, 3, 1, 4, 1, 2])

func solution171(_ topping:[Int]) -> Int {
    var set0:Set<Int> = Set<Int>()
    set0.formUnion(topping)
    if set0.count == 1 {
        return topping.count-1
    }
    var minCount:Int = (set0.count+1)/2
    var set1:Set<Int> = Set<Int>()
    set1.formUnion(topping[0...minCount-1])
    
    var set2:Set<Int> = Set<Int>()
    var firstCount:Int = set1.count
    var secondCount:Int = 0
    var result:Int = 0
    for i in minCount...topping.count-1 {
        if firstCount < minCount {
            if !set1.contains(topping[i]) {
                set1.insert(topping[i])
                firstCount += 1
            }
        } else {
            if secondCount == 0 {
                set2.formUnion(topping[i...topping.count-1])
                firstCount = set1.count
                secondCount = set2.count
                if firstCount == secondCount {
                    result += 1
                } else if firstCount > secondCount {
                    break
                }
                if topping.firstIndex(of: topping[i]) == i {
                    firstCount += 1
                }
                if topping.lastIndex(of: topping[i]) == i {
                    secondCount -= 1
                }
            } else {
                if topping.firstIndex(of: topping[i]) == i {
                    firstCount += 1
                }
                if topping.lastIndex(of: topping[i]) == i {
                    secondCount -= 1
                }
            }
            if firstCount == secondCount {
                result += 1
            } else if firstCount > secondCount {
                break
            }
        }
    }
    return result
}

solution171([1, 2, 3, 1, 4])
solution171([1, 2, 1, 3, 1, 4, 1, 2])

func solution17(_ topping:[Int]) -> Int {
    var set0:Set<Int> = Set<Int>()
    set0.formUnion(topping)
    if set0.count == 1 {
        return topping.count-1
    }
    var aList:[Int] = []
    var bList:[Int] = []
    var set1:Set<Int> = Set<Int>()
    
    set1.formUnion(topping[0...(set0.count > 4 ? set0.count/2-2 : 0)])
    var isMatch = false
    var set2:Set<Int> = Set<Int>()
    set2.formUnion(topping[(set0.count > 4 ? set0.count/2-2 : 0)...topping.count-1])
    var result:Int = 0
    
    for i in (set0.count > 4 ? set0.count/2-1 : 1)...topping.count-1-set0.count/2 {
        if isMatch {
            bList.removeFirst()
            if aList.contains(topping[i]) && bList.contains(topping[i]) {
                result += 1
            } else {
                break
            }
        } else {
            set1.insert(topping[i])
            set2.removeAll()
            set2.formUnion(topping[i+1...topping.count-1])
            if set1.count == set2.count {
                isMatch = true
                result += 1
                aList = Array(topping[0...i])
                bList = Array(topping[i+1...topping.count-1])
            } else if set1.count > set2.count {
                break
            }
        }
    }
    return result
}

solution17([1, 2, 1, 3, 1, 4, 1, 2])

/* 택배상자

 - 영재는 택배상자를 트럭에 싣는 일을 합니다. 영재가 실어야 하는 택배상자는 크기가 모두 같으며 1번 상자부터 n번 상자까지 번호가 증가하는 순서대로 컨테이너 벨트에 일렬로 놓여 영재에게 전달됩니다. 컨테이너 벨트는 한 방향으로만 진행이 가능해서 벨트에 놓인 순서대로(1번 상자부터) 상자를 내릴 수 있습니다. 하지만 컨테이너 벨트에 놓인 순서대로 택배상자를 내려 바로 트럭에 싣게 되면 택배 기사님이 배달하는 순서와 택배상자가 실려 있는 순서가 맞지 않아 배달에 차질이 생깁니다. 따라서 택배 기사님이 미리 알려준 순서에 맞게 영재가 택배상자를 실어야 합니다.
 
 만약 컨테이너 벨트의 맨 앞에 놓인 상자가 현재 트럭에 실어야 하는 순서가 아니라면 그 상자를 트럭에 실을 순서가 될 때까지 잠시 다른 곳에 보관해야 합니다. 하지만 고객의 물건을 함부로 땅에 둘 수 없어 보조 컨테이너 벨트를 추가로 설치하였습니다. 보조 컨테이너 벨트는 앞 뒤로 이동이 가능하지만 입구 외에 다른 면이 막혀 있어서 맨 앞의 상자만 뺄 수 있습니다(즉, 가장 마지막에 보조 컨테이너 벨트에 보관한 상자부터 꺼내게 됩니다). 보조 컨테이너 벨트를 이용해도 기사님이 원하는 순서대로 상자를 싣지 못 한다면, 더 이상 상자를 싣지 않습니다.

 예를 들어, 영재가 5개의 상자를 실어야 하며, 택배 기사님이 알려준 순서가 기존의 컨테이너 벨트에 네 번째, 세 번째, 첫 번째, 두 번째, 다섯 번째 놓인 택배상자 순서인 경우, 영재는 우선 첫 번째, 두 번째, 세 번째 상자를 보조 컨테이너 벨트에 보관합니다. 그 후 네 번째 상자를 트럭에 싣고 보조 컨테이너 벨트에서 세 번째 상자 빼서 트럭에싣습니다. 다음으로 첫 번째 상자를 실어야 하지만 보조 컨테이너 벨트에서는 두 번째 상자를, 기존의 컨테이너 벨트에는 다섯 번째 상자를 꺼낼 수 있기 때문에 더이상의 상자는 실을 수 없습니다. 따라서 트럭에는 2개의 상자만 실리게 됩니다.

 택배 기사님이 원하는 상자 순서를 나타내는 정수 배열 order가 주어졌을 때, 영재가 몇 개의 상자를 실을 수 있는지 return 하는 solution 함수를 완성하세요.

 제한사항
 1 ≤ order의 길이 ≤ 1,000,000
 order는 1이상 order의 길이 이하의 모든 정수가 한번씩 등장합니다.
 order[i]는 기존의 컨테이너 벨트에 order[i]번째 상자를 i+1번째로 트럭에 실어야 함을 의미합니다.
*/
struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()!
    }
    
}

func solution16(_ order:[Int]) -> Int {
    var result:Int = 0
    var mainBeltIndex = 1
    var secondBelt: Stack = Stack<Int>()
    var secondLastValue: Int = 0
    while true {
        if order[result] > mainBeltIndex {
            secondBelt.push(mainBeltIndex)
            mainBeltIndex += 1
        } else if order[result] == mainBeltIndex {
            result += 1
            mainBeltIndex += 1
        } else if secondBelt.count > 0 {
            secondLastValue = secondBelt.pop()!
            if secondLastValue == order[result] {
                result += 1
            } else {
                break
            }
        } else {
            break
        }
        if result == order.count {
            break
        }
    }
    return result
}

solution16([4, 3, 1, 2, 5])
solution16([5, 4, 3, 2, 1])

/* 연속 부분 수열 합의 개수

 - 철호는 수열을 가지고 놀기 좋아합니다. 어느 날 철호는 어떤 자연수로 이루어진 원형 수열의 연속하는 부분 수열의 합으로 만들 수 있는 수가 모두 몇 가지인지 알아보고 싶어졌습니다. 원형 수열이란 일반적인 수열에서 처음과 끝이 연결된 형태의 수열을 말합니다. 예를 들어 수열 [7, 9, 1, 1, 4] 로 원형 수열을 만들면 다음과 같습니다.
 
 원형 수열은 처음과 끝이 연결되어 끊기는 부분이 없기 때문에 연속하는 부분 수열도 일반적인 수열보다 많아집니다.
 원형 수열의 모든 원소 elements가 순서대로 주어질 때, 원형 수열의 연속 부분 수열 합으로 만들 수 있는 수의 개수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 3 ≤ elements의 길이 ≤ 1,000
 1 ≤ elements의 원소 ≤ 1,000
*/
func solution15(_ elements:[Int]) -> Int {
    var sumList:[Int] = elements
    var list:[Int] = elements+elements
    for i in 2...elements.count-1 {
        var value = list[0...i-1].reduce(0,+)
        sumList.append(value)
        for j in 1...elements.count-1 {
            value = value-list[j-1]+list[j+i-1]
            sumList.append(value)
        }
    }
    var result = Set<Int>()
    result.formUnion(sumList)
    return result.count+1
}

solution15([7,9,1,1,4])

func solution153(_ elements:[Int]) -> Int {
    var sumList:[Int] = elements
    var list:[Int] = elements+elements
    for i in 2...elements.count-1 {
        for j in 0...elements.count-1 {
            let value = list[j...j+i-1].reduce(0,+)
            sumList.append(value)
        }
    }
//    sumList.append(elements.reduce(0, +))
    var result = Set<Int>()
    result.formUnion(sumList)
    return result.count+1
}

solution153([7,9,1,1,4])

func solution152(_ elements:[Int]) -> Int {
    var result = Set<Int>()
    result.formUnion(elements)
    var list:[Int] = elements+elements
    for i in 2...elements.count-1 {
        for j in 0...elements.count-1 {
            let value = list[j...j+i-1].reduce(0,+)
            result.insert(value)
        }
    }
    result.insert(elements.reduce(0,+))
    return result.count
}

solution152([7,9,1,1,4])

func solution151(_ elements:[Int]) -> Int {
    var sumList:[Int] = elements
    for i in 2...elements.count {
        var list:[Int] = elements
        if i != 1 && i != elements.count {
            list += elements[0...i-1]
        }
        for j in 0...list.count-i {
            let value = list[j...j+i-1].reduce(0,+)
            sumList.append(value)
        }
    }
    var result = Set<Int>()
    result.formUnion(sumList)
    return result.count
}

solution151([7,9,1,1,4])

func solution150(_ elements:[Int]) -> Int {
    var result = Set<Int>()
    result.formUnion(elements)
    for i in 2...elements.count {
        var list:[Int] = elements
        if i != 1 && i != elements.count {
            list += elements[0...i-1]
        }
        for j in 0...list.count-i {
            let value = list[j...j+i-1].reduce(0,+)
            result.insert(value)
        }
    }
    return result.count
}

solution150([7,9,1,1,4])

/* 혼자 놀기의 달인

 - 혼자서도 잘 노는 범희는 어느 날 방구석에 있는 숫자 카드 더미를 보더니 혼자 할 수 있는 재미있는 게임을 생각해냈습니다.
 
 숫자 카드 더미에는 카드가 총 100장 있으며, 각 카드에는 1부터 100까지 숫자가 하나씩 적혀있습니다. 2 이상 100 이하의 자연수를 하나 정해 그 수보다 작거나 같은 숫자 카드들을 준비하고, 준비한 카드의 수만큼 작은 상자를 준비하면 게임을 시작할 수 있으며 게임 방법은 다음과 같습니다.

 준비된 상자에 카드를 한 장씩 넣고, 상자를 무작위로 섞어 일렬로 나열합니다. 상자가 일렬로 나열되면 상자가 나열된 순서에 따라 1번부터 순차적으로 증가하는 번호를 붙입니다.

 그 다음 임의의 상자를 하나 선택하여 선택한 상자 안의 숫자 카드를 확인합니다. 다음으로 확인한 카드에 적힌 번호에 해당하는 상자를 열어 안에 담긴 카드에 적힌 숫자를 확인합니다. 마찬가지로 숫자에 해당하는 번호를 가진 상자를 계속해서 열어가며, 열어야 하는 상자가 이미 열려있을 때까지 반복합니다.

 이렇게 연 상자들은 1번 상자 그룹입니다. 이제 1번 상자 그룹을 다른 상자들과 섞이지 않도록 따로 둡니다. 만약 1번 상자 그룹을 제외하고 남는 상자가 없으면 그대로 게임이 종료되며, 이때 획득하는 점수는 0점입니다.

 그렇지 않다면 남은 상자 중 다시 임의의 상자 하나를 골라 같은 방식으로 이미 열려있는 상자를 만날 때까지 상자를 엽니다. 이렇게 연 상자들은 2번 상자 그룹입니다.

 1번 상자 그룹에 속한 상자의 수와 2번 상자 그룹에 속한 상자의 수를 곱한 값이 게임의 점수입니다.

 상자 안에 들어있는 카드 번호가 순서대로 담긴 배열 cards가 매개변수로 주어질 때, 범희가 이 게임에서 얻을 수 있는 최고 점수를 구해서 return 하도록 solution 함수를 완성해주세요.

 제한사항
 2 ≤ cards의 길이 ≤ 100
 cards의 원소는 cards의 길이 이하인 임의의 자연수입니다.
 cards에는 중복되는 원소가 존재하지 않습니다.
 cards[i]는 i + 1번 상자에 담긴 카드에 적힌 숫자를 의미합니다.
*/
func solution14(_ cards:[Int]) -> Int {
    return 0
}

/* 할인 행사

 - XYZ 마트는 일정한 금액을 지불하면 10일 동안 회원 자격을 부여합니다. XYZ 마트에서는 회원을 대상으로 매일 한 가지 제품을 할인하는 행사를 합니다. 할인하는 제품은 하루에 하나씩만 구매할 수 있습니다. 알뜰한 정현이는 자신이 원하는 제품과 수량이 할인하는 날짜와 10일 연속으로 일치할 경우에 맞춰서 회원가입을 하려 합니다.
 
 예를 들어, 정현이가 원하는 제품이 바나나 3개, 사과 2개, 쌀 2개, 돼지고기 2개, 냄비 1개이며, XYZ 마트에서 15일간 회원을 대상으로 할인하는 제품이 날짜 순서대로 치킨, 사과, 사과, 바나나, 쌀, 사과, 돼지고기, 바나나, 돼지고기, 쌀, 냄비, 바나나, 사과, 바나나인 경우에 대해 알아봅시다. 첫째 날부터 열흘 간에는 냄비가 할인하지 않기 때문에 첫째 날에는 회원가입을 하지 않습니다. 둘째 날부터 열흘 간에는 바나나를 원하는 만큼 할인구매할 수 없기 때문에 둘째 날에도 회원가입을 하지 않습니다. 셋째 날, 넷째 날, 다섯째 날부터 각각 열흘은 원하는 제품과 수량이 일치하기 때문에 셋 중 하루에 회원가입을 하려 합니다.

 정현이가 원하는 제품을 나타내는 문자열 배열 want와 정현이가 원하는 제품의 수량을 나타내는 정수 배열 number, XYZ 마트에서 할인하는 제품을 나타내는 문자열 배열 discount가 주어졌을 때, 회원등록시 정현이가 원하는 제품을 모두 할인 받을 수 있는 회원등록 날짜의 총 일수를 return 하는 solution 함수를 완성하시오. 가능한 날이 없으면 0을 return 합니다.

 제한사항
 1 ≤ want의 길이 = number의 길이 ≤ 10
 1 ≤ number의 원소 ≤ 10
 number[i]는 want[i]의 수량을 의미하며, number의 원소의 합은 10입니다.
 10 ≤ discount의 길이 ≤ 100,000
 want와 discount의 원소들은 알파벳 소문자로 이루어진 문자열입니다.
 1 ≤ want의 원소의 길이, discount의 원소의 길이 ≤ 12
*/
func solution13(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result:Int = 0
    for i in 0...discount.count-number.reduce(0,+) {
        var countList = number
        for j in 0...9 {
            if want.contains(discount[i+j]) {
                let index:Int = want.firstIndex(of: discount[i+j]) ?? 0
                if countList[index] > 0 {
                    countList[index] = countList[index]-1
                }
            }
        }
        if countList.reduce(0, +) == 0 {
            result += 1
        }
    }
    return result
}

solution13(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"])

/* 두 큐 합 같게 만들기

 -
*/

/* 양궁대회

 -
*/

/* 주차 요금 계산

 - 주차장의 요금표와 차량이 들어오고(입차) 나간(출차) 기록이 주어졌을 때, 차량별로 주차 요금을 계산하려고 합니다. 아래는 하나의 예시를 나타냅니다.
 
 요금표
 기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
 180    5000    10    600
  

 입/출차 기록
 시각(시:분)    차량 번호    내역
 05:34    5961    입차
 06:00    0000    입차
 06:34    0000    출차
 07:59    5961    출차
 07:59    0148    입차
 18:59    0000    입차
 19:09    0148    출차
 22:59    5961    입차
 23:00    5961    출차
  

 자동차별 주차 요금
 차량 번호    누적 주차 시간(분)    주차 요금(원)
 0000    34 + 300 = 334    5000 + ⌈(334 - 180) / 10⌉ x 600 = 14600
 0148    670    5000 +⌈(670 - 180) / 10⌉x 600 = 34400
 5961    145 + 1 = 146    5000
 어떤 차량이 입차된 후에 출차된 내역이 없다면, 23:59에 출차된 것으로 간주합니다.
 0000번 차량은 18:59에 입차된 이후, 출차된 내역이 없습니다. 따라서, 23:59에 출차된 것으로 간주합니다.
 00:00부터 23:59까지의 입/출차 내역을 바탕으로 차량별 누적 주차 시간을 계산하여 요금을 일괄로 정산합니다.
 누적 주차 시간이 기본 시간이하라면, 기본 요금을 청구합니다.
 누적 주차 시간이 기본 시간을 초과하면, 기본 요금에 더해서, 초과한 시간에 대해서 단위 시간 마다 단위 요금을 청구합니다.
 초과한 시간이 단위 시간으로 나누어 떨어지지 않으면, 올림합니다.
 ⌈a⌉ : a보다 작지 않은 최소의 정수를 의미합니다. 즉, 올림을 의미합니다.
 주차 요금을 나타내는 정수 배열 fees, 자동차의 입/출차 내역을 나타내는 문자열 배열 records가 매개변수로 주어집니다. 차량 번호가 작은 자동차부터 청구할 주차 요금을 차례대로 정수 배열에 담아서 return 하도록 solution 함수를 완성해주세요.

 제한사항
 fees의 길이 = 4

 fees[0] = 기본 시간(분)
 1 ≤ fees[0] ≤ 1,439
 fees[1] = 기본 요금(원)
 0 ≤ fees[1] ≤ 100,000
 fees[2] = 단위 시간(분)
 1 ≤ fees[2] ≤ 1,439
 fees[3] = 단위 요금(원)
 1 ≤ fees[3] ≤ 10,000
 1 ≤ records의 길이 ≤ 1,000

 records의 각 원소는 "시각 차량번호 내역" 형식의 문자열입니다.
 시각, 차량번호, 내역은 하나의 공백으로 구분되어 있습니다.
 시각은 차량이 입차되거나 출차된 시각을 나타내며, HH:MM 형식의 길이 5인 문자열입니다.
 HH:MM은 00:00부터 23:59까지 주어집니다.
 잘못된 시각("25:22", "09:65" 등)은 입력으로 주어지지 않습니다.
 차량번호는 자동차를 구분하기 위한, `0'~'9'로 구성된 길이 4인 문자열입니다.
 내역은 길이 2 또는 3인 문자열로, IN 또는 OUT입니다. IN은 입차를, OUT은 출차를 의미합니다.
 records의 원소들은 시각을 기준으로 오름차순으로 정렬되어 주어집니다.
 records는 하루 동안의 입/출차된 기록만 담고 있으며, 입차된 차량이 다음날 출차되는 경우는 입력으로 주어지지 않습니다.
 같은 시각에, 같은 차량번호의 내역이 2번 이상 나타내지 않습니다.
 마지막 시각(23:59)에 입차되는 경우는 입력으로 주어지지 않습니다.
 아래의 예를 포함하여, 잘못된 입력은 주어지지 않습니다.
 주차장에 없는 차량이 출차되는 경우
 주차장에 이미 있는 차량(차량번호가 같은 차량)이 다시 입차되는 경우
*/
func solution10(_ fees:[Int], _ records:[String]) -> [Int] {
    var list:[[String]] = records.map {
        $0.components(separatedBy: " ")
    }
    let dic = Dictionary(grouping: list) { $0[1] }.sorted {
        $0.key < $1.key
    }
    var result:[Int] = []
    for data in dic {
        var time:Int = 0
        for i in 0...data.value.count-1 {
            if i % 2 == 0 {
                time -= (Int(data.value[i][0].prefix(2)) ?? 0) * 60 + (Int(data.value[i][0].suffix(2)) ?? 0)
            } else {
                time += (Int(data.value[i][0].prefix(2)) ?? 0) * 60 + (Int(data.value[i][0].suffix(2)) ?? 0)
            }
        }
        if time <= 0 {
            time += 23 * 60 + 59
        }
        var price:Int = time <= fees[0] ? fees[1] : fees[1] + Int(ceil(Double(time-fees[0])/Double(fees[2])))*fees[3]
        result.append(price)
    }
    return result
}

solution10([1, 461, 1, 10], ["00:00 1234 IN"]) // 14841
solution10([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"])

/* k진수에서 소수 개수 구하기

 - 문제 설명
 양의 정수 n이 주어집니다. 이 숫자를 k진수로 바꿨을 때, 변환된 수 안에 아래 조건에 맞는 소수(Prime number)가 몇 개인지 알아보려 합니다.

 0P0처럼 소수 양쪽에 0이 있는 경우
 P0처럼 소수 오른쪽에만 0이 있고 왼쪽에는 아무것도 없는 경우
 0P처럼 소수 왼쪽에만 0이 있고 오른쪽에는 아무것도 없는 경우
 P처럼 소수 양쪽에 아무것도 없는 경우
 단, P는 각 자릿수에 0을 포함하지 않는 소수입니다.
 예를 들어, 101은 P가 될 수 없습니다.
 예를 들어, 437674을 3진수로 바꾸면 211020101011입니다. 여기서 찾을 수 있는 조건에 맞는 소수는 왼쪽부터 순서대로 211, 2, 11이 있으며, 총 3개입니다. (211, 2, 11을 k진법으로 보았을 때가 아닌, 10진법으로 보았을 때 소수여야 한다는 점에 주의합니다.) 211은 P0 형태에서 찾을 수 있으며, 2는 0P0에서, 11은 0P에서 찾을 수 있습니다.

 정수 n과 k가 매개변수로 주어집니다. n을 k진수로 바꿨을 때, 변환된 수 안에서 찾을 수 있는 위 조건에 맞는 소수의 개수를 return 하도록 solution 함수를 완성해 주세요.

 제한사항
 1 ≤ n ≤ 1,000,000
 3 ≤ k ≤ 10
*/
func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

func solution9(_ n:Int, _ k:Int) -> Int {
    if k == 10 {
        return String(n).components(separatedBy: "0").filter {
            isPrime(num: Int($0) ?? 1)
        }.count
    } else {
        return String(n, radix: k).components(separatedBy: "0").filter {
            isPrime(num: Int($0) ?? 1)
        }.count
    }
}

solution9(110011, 10) // 2
solution9(437674, 3) // 3

/* 피로도

 - XX게임에는 피로도 시스템(0 이상의 정수로 표현합니다)이 있으며, 일정 피로도를 사용해서 던전을 탐험할 수 있습니다. 이때, 각 던전마다 탐험을 시작하기 위해 필요한 "최소 필요 피로도"와 던전 탐험을 마쳤을 때 소모되는 "소모 피로도"가 있습니다. "최소 필요 피로도"는 해당 던전을 탐험하기 위해 가지고 있어야 하는 최소한의 피로도를 나타내며, "소모 피로도"는 던전을 탐험한 후 소모되는 피로도를 나타냅니다. 예를 들어 "최소 필요 피로도"가 80, "소모 피로도"가 20인 던전을 탐험하기 위해서는 유저의 현재 남은 피로도는 80 이상 이어야 하며, 던전을 탐험한 후에는 피로도 20이 소모됩니다.
 
 이 게임에는 하루에 한 번씩 탐험할 수 있는 던전이 여러개 있는데, 한 유저가 오늘 이 던전들을 최대한 많이 탐험하려 합니다. 유저의 현재 피로도 k와 각 던전별 "최소 필요 피로도", "소모 피로도"가 담긴 2차원 배열 dungeons 가 매개변수로 주어질 때, 유저가 탐험할수 있는 최대 던전 수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 k는 1 이상 5,000 이하인 자연수입니다.
 dungeons의 세로(행) 길이(즉, 던전의 개수)는 1 이상 8 이하입니다.
 dungeons의 가로(열) 길이는 2 입니다.
 dungeons의 각 행은 각 던전의 ["최소 필요 피로도", "소모 피로도"] 입니다.
 "최소 필요 피로도"는 항상 "소모 피로도"보다 크거나 같습니다.
 "최소 필요 피로도"와 "소모 피로도"는 1 이상 1,000 이하인 자연수입니다.
 서로 다른 던전의 ["최소 필요 피로도", "소모 피로도"]가 서로 같을 수 있습니다.
*/

func permute<C: Collection>(items: C) -> [[C.Iterator.Element]] {
    var scratch = Array(items)
    var result: [[C.Iterator.Element]] = []
    func heap(_ n: Int) {
        if n == 1 {
            result.append(scratch)
            return
        }

        for i in 0..<n-1 {
            heap(n-1)
            let j = (n%2 == 1) ? 0 : i
            scratch.swapAt(j, n-1)
        }
        heap(n-1)
    }
    heap(scratch.count)
    return result
}

func solution8(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result:Int = 0
    permute(items: dungeons).map {
        var kValue = k
        var count = 0
        for dungeon in $0 {
            if dungeon[0] <= kValue{
                kValue -= dungeon[1]
                count += 1
            }
        }
        result = max(result, count)
    }
    return result
}

solution8(80, [[80, 20], [50, 40], [30, 10]])

/* n^2 배열 자르기

 - 정수 n, left, right가 주어집니다. 다음 과정을 거쳐서 1차원 배열을 만들고자 합니다.
 
 n행 n열 크기의 비어있는 2차원 배열을 만듭니다.
 i = 1, 2, 3, ..., n에 대해서, 다음 과정을 반복합니다.
 1행 1열부터 i행 i열까지의 영역 내의 모든 빈 칸을 숫자 i로 채웁니다.
 1행, 2행, ..., n행을 잘라내어 모두 이어붙인 새로운 1차원 배열을 만듭니다.
 새로운 1차원 배열을 arr이라 할 때, arr[left], arr[left+1], ..., arr[right]만 남기고 나머지는 지웁니다.
 정수 n, left, right가 매개변수로 주어집니다. 주어진 과정대로 만들어진 1차원 배열을 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ n ≤ 107
 0 ≤ left ≤ right < n2
 right - left < 105
*/
func solution7(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var list:[Int] = []
    var count:Int = Int(left)/n*n
    var isDone:Bool = false
    for i in (Int(left)/n)+1...n {
        for j in 1...n {
            count += 1
            if count > left {
                list.append(j < i ? i : j)
                if count > right {
                    isDone = true
                    break
                }
            }
        }
        if isDone {
            break
        }
    }
    return list
}

solution7(4, 7, 14)
solution7(3,2,5)

/* 교점에 별 만들기
 
 - Ax + By + C = 0으로 표현할 수 있는 n개의 직선이 주어질 때, 이 직선의 교점 중 정수 좌표에 별을 그리려 합니다.
 
 예를 들어, 다음과 같은 직선 5개를

 2x - y + 4 = 0
 -2x - y + 4 = 0
 -y + 1 = 0
 5x - 8y - 12 = 0
 5x + 8y + 12 = 0
 좌표 평면 위에 그리면 아래 그림과 같습니다.
 이때, 모든 교점의 좌표는 (4, 1), (4, -4), (-4, -4), (-4, 1), (0, 4), (1.5, 1.0), (2.1, -0.19), (0, -1.5), (-2.1, -0.19), (-1.5, 1.0)입니다. 이 중 정수로만 표현되는 좌표는 (4, 1), (4, -4), (-4, -4), (-4, 1), (0, 4)입니다.

 만약 정수로 표현되는 교점에 별을 그리면 다음과 같습니다.
 위의 그림을 문자열로 나타낼 때, 별이 그려진 부분은 *, 빈 공간(격자선이 교차하는 지점)은 .으로 표현하면 다음과 같습니다.
 "..........."
 ".....*....."
 "..........."
 "..........."
 ".*.......*."
 "..........."
 "..........."
 "..........."
 "..........."
 ".*.......*."
 "..........."
 이때 격자판은 무한히 넓으니 모든 별을 포함하는 최소한의 크기만 나타내면 됩니다.

 따라서 정답은

 "....*...."
 "........."
 "........."
 "*.......*"
 "........."
 "........."
 "........."
 "........."
 "*.......*"
 입니다.

 직선 A, B, C에 대한 정보가 담긴 배열 line이 매개변수로 주어집니다. 이때 모든 별을 포함하는 최소 사각형을 return 하도록 solution 함수를 완성해주세요.

 제한사항
 line의 세로(행) 길이는 2 이상 1,000 이하인 자연수입니다.
 line의 가로(열) 길이는 3입니다.
 line의 각 원소는 [A, B, C] 형태입니다.
 A, B, C는 -100,000 이상 100,000 이하인 정수입니다.
 무수히 많은 교점이 생기는 직선 쌍은 주어지지 않습니다.
 A = 0이면서 B = 0인 경우는 주어지지 않습니다.
 정답은 1,000 * 1,000 크기 이내에서 표현됩니다.
 별이 한 개 이상 그려지는 입력만 주어집니다.
*/
func getSpot(a:Int, b:Int, c:Int, d:Int, e:Int, f:Int) -> [Int] {
    if (b*f-e*d)%(a*d-b*c) == 0 && (e*c-a*f)%(a*d-b*c) == 0 {
        return [(b*f-e*d)/(a*d-b*c), (e*c-a*f)/(a*d-b*c)]
    } else {
        return []
    }
}

func solution6(_ line:[[Int]]) -> [String] {
    var spots = Set<[Int]>()
    for i in 0...line.count-2 {
        for j in 1...line.count-1-i {
            if line[i][0]*line[i+j][1] - line[i][1]*line[i+j][0] != 0 {
                var spot = getSpot(a: line[i][0], b: line[i][1], c: line[i+j][0], d: line[i+j][1], e: line[i][2], f: line[i+j][2])
                if spot.count > 0 {
                    spots.insert(spot)
                }
            }
        }
    }
    var maxX:Int = spots.first![0]
    var minX:Int = spots.first![0]
    var maxY:Int = spots.first![1]
    var minY:Int = spots.first![1]
    spots.map {
        maxX = max($0[0], maxX)
        minX = min($0[0], minX)
        maxY = max($0[1], maxY)
        minY = min($0[1], minY)
    }
    var result:[String] = []
    for i in minY...maxY {
        var list = spots.filter { $0[1] == i }.map { $0[0] }
        if list.count > 0 {
            var str = ""
            for j in minX...maxX {
                if list.contains(j) {
                    str += "*"
                } else {
                    str += "."
                }
            }
            result.insert(str, at: 0)
        } else {
            result.insert(String(repeating: ".", count: maxX-minX+1), at: 0)
        }
    }
    return result
}

//solution6([[0, 1, -1], [1, 0, -1], [1, 0, 1]])
//solution6([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]])
// ["....*....", ".........", ".........", "*.......*", ".........", ".........", ".........", ".........", "*.......*"]

/* 전력망을 둘로 나누기

 - n개의 송전탑이 전선을 통해 하나의 트리 형태로 연결되어 있습니다. 당신은 이 전선들 중 하나를 끊어서 현재의 전력망 네트워크를 2개로 분할하려고 합니다. 이때, 두 전력망이 갖게 되는 송전탑의 개수를 최대한 비슷하게 맞추고자 합니다.
 
 송전탑의 개수 n, 그리고 전선 정보 wires가 매개변수로 주어집니다. 전선들 중 하나를 끊어서 송전탑 개수가 가능한 비슷하도록 두 전력망으로 나누었을 때, 두 전력망이 가지고 있는 송전탑 개수의 차이(절대값)를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 n은 2 이상 100 이하인 자연수입니다.
 wires는 길이가 n-1인 정수형 2차원 배열입니다.
 wires의 각 원소는 [v1, v2] 2개의 자연수로 이루어져 있으며, 이는 전력망의 v1번 송전탑과 v2번 송전탑이 전선으로 연결되어 있다는 것을 의미합니다.
 1 ≤ v1 < v2 ≤ n 입니다.
 전력망 네트워크가 하나의 트리 형태가 아닌 경우는 입력으로 주어지지 않습니다.
*/
func solution5(_ n:Int, _ wires:[[Int]]) -> Int {
    var result:Int = n
    for wire in wires {
        var left:[Int] = [wire[0]]
        var right:[Int] = [wire[1]]
        while left.count + right.count != n {
            wires.map {
                if $0 != wire {
                    if left.contains($0[0]) && !left.contains($0[1]) {
                        left.append($0[1])
                    } else if left.contains($0[1]) && !left.contains($0[0]) {
                        left.append($0[0])
                    } else if right.contains($0[0]) && !right.contains($0[1]) {
                        right.append($0[1])
                    } else if right.contains($0[0]) && !right.contains($0[0]) {
                        right.append($0[0])
                    }
                }
            }
        }
        if result > abs(left.count - right.count) {
            result = abs(left.count - right.count)
        }
    }
    return result
}

//solution5(9, [[1, 3], [2, 3], [3, 4], [4, 5], [4, 6], [4, 7], [7, 8], [7, 9]])

/* 빛의 경로 사이클

 - 각 칸마다 S, L, 또는 R가 써져 있는 격자가 있습니다. 당신은 이 격자에서 빛을 쏘고자 합니다. 이 격자의 각 칸에는 다음과 같은 특이한 성질이 있습니다.
 
 빛이 "S"가 써진 칸에 도달한 경우, 직진합니다.
 빛이 "L"이 써진 칸에 도달한 경우, 좌회전을 합니다.
 빛이 "R"이 써진 칸에 도달한 경우, 우회전을 합니다.
 빛이 격자의 끝을 넘어갈 경우, 반대쪽 끝으로 다시 돌아옵니다. 예를 들어, 빛이 1행에서 행이 줄어드는 방향으로 이동할 경우, 같은 열의 반대쪽 끝 행으로 다시 돌아옵니다.
 당신은 이 격자 내에서 빛이 이동할 수 있는 경로 사이클이 몇 개 있고, 각 사이클의 길이가 얼마인지 알고 싶습니다. 경로 사이클이란, 빛이 이동하는 순환 경로를 의미합니다.

 예를 들어, 다음 그림은 격자 ["SL","LR"]에서 1행 1열에서 2행 1열 방향으로 빛을 쏠 경우, 해당 빛이 이동하는 경로 사이클을 표현한 것입니다.
 
 이 격자에는 길이가 16인 사이클 1개가 있으며, 다른 사이클은 존재하지 않습니다.

 격자의 정보를 나타내는 1차원 문자열 배열 grid가 매개변수로 주어집니다. 주어진 격자를 통해 만들어지는 빛의 경로 사이클의 모든 길이들을 배열에 담아 오름차순으로 정렬하여 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ grid의 길이 ≤ 500
 1 ≤ grid의 각 문자열의 길이 ≤ 500
 grid의 모든 문자열의 길이는 서로 같습니다.
 grid의 모든 문자열은 'L', 'R', 'S'로 이루어져 있습니다.
*/
func solution4(_ grid:[String]) -> [Int] {
    return []
}

/* 모음 사전

 - 사전에 알파벳 모음 'A', 'E', 'I', 'O', 'U'만을 사용하여 만들 수 있는, 길이 5 이하의 모든 단어가 수록되어 있습니다. 사전에서 첫 번째 단어는 "A"이고, 그다음은 "AA"이며, 마지막 단어는 "UUUUU"입니다.
 
 단어 하나 word가 매개변수로 주어질 때, 이 단어가 사전에서 몇 번째 단어인지 return 하도록 solution 함수를 완성해주세요.

 제한사항
 word의 길이는 1 이상 5 이하입니다.
 word는 알파벳 대문자 'A', 'E', 'I', 'O', 'U'로만 이루어져 있습니다.
*/
func getNum(num:Int) -> Int {
    print(num)
    return num*5+1
}
func solution3(_ word:String) -> Int {
    let list:[Character] = ["A","E","I","O","U"]
    var result:Int = 0
    for i in 0...word.count-1 {
        let char:Character = Array(word)[i]
        let index = list.firstIndex(of: char)!
        result += 1
        if i < 4 {
            var num:Int = 1
            for _ in 1...4-i {
                num = getNum(num: num)
            }
            result += num*index
        } else {
            result += index
        }
    }
    return result
}

//solution3("I")
//solution3("EIO")
//solution3("AAAAE")

/* 거리두기 확인하기

 - 개발자를 희망하는 죠르디가 카카오에 면접을 보러 왔습니다.
 
 코로나 바이러스 감염 예방을 위해 응시자들은 거리를 둬서 대기를 해야하는데 개발 직군 면접인 만큼
 아래와 같은 규칙으로 대기실에 거리를 두고 앉도록 안내하고 있습니다.

 대기실은 5개이며, 각 대기실은 5x5 크기입니다.
 거리두기를 위하여 응시자들 끼리는 맨해튼 거리1가 2 이하로 앉지 말아 주세요.
 단 응시자가 앉아있는 자리 사이가 파티션으로 막혀 있을 경우에는 허용합니다.
 
 5개의 대기실을 본 죠르디는 각 대기실에서 응시자들이 거리두기를 잘 기키고 있는지 알고 싶어졌습니다. 자리에 앉아있는 응시자들의 정보와 대기실 구조를 대기실별로 담은 2차원 문자열 배열 places가 매개변수로 주어집니다. 각 대기실별로 거리두기를 지키고 있으면 1을, 한 명이라도 지키지 않고 있으면 0을 배열에 담아 return 하도록 solution 함수를 완성해 주세요.
 
 제한사항
 places의 행 길이(대기실 개수) = 5
 places의 각 행은 하나의 대기실 구조를 나타냅니다.
 places의 열 길이(대기실 세로 길이) = 5
 places의 원소는 P,O,X로 이루어진 문자열입니다.
 places 원소의 길이(대기실 가로 길이) = 5
 P는 응시자가 앉아있는 자리를 의미합니다.
 O는 빈 테이블을 의미합니다.
 X는 파티션을 의미합니다.
 입력으로 주어지는 5개 대기실의 크기는 모두 5x5 입니다.
 return 값 형식
 1차원 정수 배열에 5개의 원소를 담아서 return 합니다.
 places에 담겨 있는 5개 대기실의 순서대로, 거리두기 준수 여부를 차례대로 배열에 담습니다.
 각 대기실 별로 모든 응시자가 거리두기를 지키고 있으면 1을, 한 명이라도 지키지 않고 있으면 0을 담습니다.
*/
func solution2(_ places:[[String]]) -> [Int] {
    return []
}

/* 2개 이하로 다른 비트

 - 양의 정수 x에 대한 함수 f(x)를 다음과 같이 정의합니다.
 
 x보다 크고 x와 비트가 1~2개 다른 수들 중에서 제일 작은 수
 예를 들어,

 f(2) = 3 입니다. 다음 표와 같이 2보다 큰 수들 중에서 비트가 다른 지점이 2개 이하이면서 제일 작은 수가 3이기 때문입니다.
 수    비트    다른 비트의 개수
 2    000...0010
 3    000...0011    1
 f(7) = 11 입니다. 다음 표와 같이 7보다 큰 수들 중에서 비트가 다른 지점이 2개 이하이면서 제일 작은 수가 11이기 때문입니다.
 수    비트    다른 비트의 개수
 7    000...0111
 8    000...1000    4
 9    000...1001    3
 10    000...1010    3
 11    000...1011    2
 정수들이 담긴 배열 numbers가 매개변수로 주어집니다. numbers의 모든 수들에 대하여 각 수의 f 값을 배열에 차례대로 담아 return 하도록 solution 함수를 완성해주세요.
 제한사항
 1 ≤ numbers의 길이 ≤ 100,000
 0 ≤ numbers의 모든 수 ≤ 1015
*/
func solution1(_ numbers:[Int64]) -> [Int64] {
    var result:[Int64] = []
    var saveData:[Int64:Int64] = [:]
    for number in numbers {
        if saveData[number] != nil {
            result.append(saveData[number]!)
        } else {
            var i:Int64 = 1
            while true {
                let outputBits = String(number^(number+i), radix: 2).filter{ $0 == Character("1") }
                if outputBits.count < 3 {
                    result.append(number+i)
                    saveData[number] = number+i
                    break
                }
                i += Int64(pow(2.0, Double(outputBits.count-2)))-1
            }
        }
    }
    return result
}

solution1([2,7]) // [3, 11]

func solution0(_ numbers:[Int64]) -> [Int64] {
    var result:[Int64] = []
    for number in numbers {
        var i:Int64 = 1
        while true {
            let outputBits = String(number^(number+i), radix: 2).filter{ $0 == Character("1") }
            if outputBits.count < 3 {
                result.append(number+i)
                break
            }
            i += 1
        }
    }
    return result
}

solution0([2,7]) // [3, 11]
