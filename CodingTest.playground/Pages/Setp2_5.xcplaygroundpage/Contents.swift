import Foundation

/* 테이블 해시 함수

 - 완호가 관리하는 어떤 데이터베이스의 한 테이블은 모두 정수 타입인 컬럼들로 이루어져 있습니다. 테이블은 2차원 행렬로 표현할 수 있으며 열은 컬럼을 나타내고, 행은 튜플을 나타냅니다.
 첫 번째 컬럼은 기본키로서 모든 튜플에 대해 그 값이 중복되지 않도록 보장됩니다. 완호는 이 테이블에 대한 해시 함수를 다음과 같이 정의하였습니다.

 해시 함수는 col, row_begin, row_end을 입력으로 받습니다.
 테이블의 튜플을 col번째 컬럼의 값을 기준으로 오름차순 정렬을 하되, 만약 그 값이 동일하면 기본키인 첫 번째 컬럼의 값을 기준으로 내림차순 정렬합니다.
 정렬된 데이터에서 S_i를 i 번째 행의 튜플에 대해 각 컬럼의 값을 i 로 나눈 나머지들의 합으로 정의합니다.
 row_begin ≤ i ≤ row_end 인 모든 S_i를 누적하여 bitwise XOR 한 값을 해시 값으로서 반환합니다.
 테이블의 데이터 data와 해시 함수에 대한 입력 col, row_begin, row_end이 주어졌을 때 테이블의 해시 값을 return 하도록 solution 함수를 완성해주세요.

 제한 사항
 1 ≤ data의 길이 ≤ 2,500
 1 ≤ data의 원소의 길이 ≤ 500
 1 ≤ data[i][j] ≤ 1,000,000
 data[i][j]는 i + 1 번째 튜플의 j + 1 번째 컬럼의 값을 의미합니다.
 1 ≤ col ≤ data의 원소의 길이
 1 ≤ row_begin ≤ row_end ≤ data의 길이
*/
func solution2(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var sorted = data.sorted{
        if $0[col-1] < $1[col-1] {
            return true
        } else if  $0[col-1] == $1[col-1] {
            if $0[0] > $1[0] {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    var result:Int = 0
    for i in row_begin-1...row_end-1 {
        var sum:Int = 0
        for j in sorted[i] {
            sum += j%(i+1)
        }
        result = result^sum
    }
    return result
}

solution2([[2,2,6],[1,5,10],[4,2,9],[3,8,3]],2,2,3)

/* 디펜스 게임

 - 준호는 요즘 디펜스 게임에 푹 빠져 있습니다. 디펜스 게임은 준호가 보유한 병사 n명으로 연속되는 적의 공격을 순서대로 막는 게임입니다. 디펜스 게임은 다음과 같은 규칙으로 진행됩니다.
 
 준호는 처음에 병사 n명을 가지고 있습니다.
 매 라운드마다 enemy[i]마리의 적이 등장합니다.
 남은 병사 중 enemy[i]명 만큼 소모하여 enemy[i]마리의 적을 막을 수 있습니다.
 예를 들어 남은 병사가 7명이고, 적의 수가 2마리인 경우, 현재 라운드를 막으면 7 - 2 = 5명의 병사가 남습니다.
 남은 병사의 수보다 현재 라운드의 적의 수가 더 많으면 게임이 종료됩니다.
 게임에는 무적권이라는 스킬이 있으며, 무적권을 사용하면 병사의 소모없이 한 라운드의 공격을 막을 수 있습니다.
 무적권은 최대 k번 사용할 수 있습니다.
 준호는 무적권을 적절한 시기에 사용하여 최대한 많은 라운드를 진행하고 싶습니다.

 준호가 처음 가지고 있는 병사의 수 n, 사용 가능한 무적권의 횟수 k, 매 라운드마다 공격해오는 적의 수가 순서대로 담긴 정수 배열 enemy가 매개변수로 주어집니다. 준호가 몇 라운드까지 막을 수 있는지 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ n ≤ 1,000,000,000
 1 ≤ k ≤ 500,000
 1 ≤ enemy의 길이 ≤ 1,000,000
 1 ≤ enemy[i] ≤ 1,000,000
 enemy[i]에는 i + 1 라운드에서 공격해오는 적의 수가 담겨있습니다.
 모든 라운드를 막을 수 있는 경우에는 enemy[i]의 길이를 return 해주세요.
*/
struct MinHeap<T: Comparable> {
    var heap: [T] = []
    
    var isEmpty: Bool {
        return heap.count <= 1 ? true : false
    }
    
    init() {}
    init(_ element: T) {
        heap.append(element) // 0번 index채우기 용
        heap.append(element) // 실제 Root Node 채움.
    }
    
    mutating func insert(_ element: T) {
        if heap.isEmpty {
            heap.append(element)
            heap.append(element)
            return
        }
        heap.append(element)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 { // Root Node일 때,
                return false
            }
            let parentIndex = insertIndex / 2
            return heap[insertIndex] < heap[parentIndex] ? true : false
        }
        
        var insertIndex = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus { case left, right, none }
    
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
            
            // case1. 모든(왼쪽) 자식 노드가 없는 경우(완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= heap.count {
                return .none
            }
            
            // case2. 왼쪽 자식 노드만 있는 경우
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] < heap[poppedIndex] ? .left : .none
            }
            
            // case3. 왼쪽&오른쪽 자식 노드 모두 있는 경우
            // case3-1. 자식들이 자신보다 모두 큰 경우(자신이 제일 작은 경우)
            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightChildIndex] > heap[poppedIndex]) {
                return .none
            }
            
            // case3-2. 자식들이 자신보다 모두 작은 경우(왼쪽과 오른쪽 자식 중, 더 작은 자식을 선별)
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightChildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            // case3-3. 왼쪽과 오른쪽 자식 중, 한 자식만 자신보다 작은 경우
            if (heap[leftChildIndex] < heap[poppedIndex]) || (heap[rightChildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
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
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
}

func solution11111111111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var myMinHeap: MinHeap<Int> = MinHeap()
    for i in 0...k-1 {
        myMinHeap.insert(enemy[i])
    }
    var min:Int = myMinHeap.pop()!
    while true {
        if sum >= n {
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            var value = enemy[result]
            if value > min {
                sum += min
                myMinHeap.insert(value)
                min = myMinHeap.pop()!
            } else {
                sum += value
            }
            result += 1
        }
    }
}

solution11111111111111111111111(7, 3, [4, 2, 4, 5, 3, 3, 1])

func check(_ n:Int, _ k:Int, _ enemy:[Int]) -> Bool? {
    var energy = n
    var sorted = enemy.sorted(by: >)
    for i in k...enemy.count-1 {
        energy -= sorted[i]
        if energy < 0 {
            break
        }
    }
    return energy >= 0
}

func solution1111111111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var minIndex = k-1
    var maxIndex = enemy.count
    while true {
        if maxIndex - minIndex < 2 {
            return minIndex+1
        }
        var midiumIndex = minIndex+(maxIndex-minIndex)/2
        var isS = check(n, k, Array(enemy[0...midiumIndex]))
        if isS == nil {
            return minIndex+1
        } else if isS! {
            minIndex = midiumIndex
        } else {
            maxIndex = midiumIndex
        }
    }
}

solution1111111111111111111111(7, 3, [4, 2, 4, 5, 3, 3, 1])

func solution111111111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var minIndex = k-1
    var maxIndex = enemy.count
    while true {
        if maxIndex - minIndex < 2 {
            return minIndex+1
        }
        var midiumIndex = minIndex+(maxIndex-minIndex)/2
        var isS = check(Array(enemy[0...midiumIndex]))
        if isS {
            minIndex = midiumIndex
        } else {
            maxIndex = midiumIndex
        }
    }
    
    func check(_ enemy:[Int]) -> Bool {
        var dList:[Int] = Array(enemy.sorted(by: >)[0...k-1])
        var energy = n
        for e in enemy {
            if dList.contains(e) {
                dList.remove(at: dList.firstIndex(of: e)!)
            } else {
                energy -= e
            }
        }
        return energy >= 0
    }
}

solution111111111111111111111(7, 3, [4, 2, 4, 5, 3, 3, 1])

func solution11111111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = 0
    var sum:Int = 0
    var list:[Int] = []
    var min:Int = 0
    while true {
        if sum >= n {
            if min == 0 {
                var sorted:[Int] = enemy[0...result+k-1].sorted(by: >)
                list = Array(sorted[0...k-1])
                min = list[k-1]
                sum += enemy[result...result+k-1].reduce(0,+) - list.reduce(0,+)
                result += k
                if result > enemy.count {
                    return result
                }
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            var value = enemy[result]
            if min > 0 && value > min {
                sum += min
                list[list.firstIndex(of: list.min()!)!] = value
                min = list.min()!
            } else {
                sum += value
            }
            result += 1
        }
    }
}

func solution1111111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var minIndex = k-1
    var maxIndex = enemy.count
    var minSum = 0
    var expectedSum = 0
    var newExpectedSum = 0
    while true {
        if maxIndex - minIndex < 2 {
            return minIndex+1
        }
        var midiumIndex = minIndex+(maxIndex-minIndex)/2
        var sum:Int = 0
        var sorted:[Int] = enemy[0...midiumIndex].sorted(by: >)
        newExpectedSum = sorted[0...k-1].reduce(0,+)
        var isS = true
        if minSum > 0 {
            sum = minSum - newExpectedSum + expectedSum
            for i in minIndex+1...midiumIndex {
                sum += enemy[i]
                if sum > n {
                    isS = false
                    break
                }
            }
        } else {
            for i in k...midiumIndex {
                sum += sorted[i]
                if sum > n {
                    isS = false
                    break
                }
            }
        }
        if !isS {
            maxIndex = midiumIndex
        } else if sum == n {
            return midiumIndex+1
        } else {
            minIndex = midiumIndex
            minSum = sum
            expectedSum = newExpectedSum
        }
    }
}

func solution111111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var minIndex = k-1
    var maxIndex = enemy.count
    while true {
        if maxIndex - minIndex < 2 {
            return minIndex+1
        }
        var midiumIndex = minIndex+(maxIndex-minIndex)/2
        var isS = true
        var sum:Int = 0
        for i in enemy[0...midiumIndex].sorted(by: >)[k...midiumIndex] {
            sum += i
            if sum > n {
                isS = false
                break
            }
        }
        if !isS {
            maxIndex = midiumIndex
        } else if sum == n {
            return midiumIndex+1
        } else {
            minIndex = midiumIndex
        }
    }
}

func solution11111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = 0
    var sum:Int = 0
    var list:[Int] = []
    var exceptSum = 0
    var min:Int = 0
    var isPlus = false
    var addList:[Int] = []
    while true {
        if sum >= n {
            if min > 0 {
                if addList.count > 0 {
                    list = Array((list+addList).sorted(by: >)[0...k-1])
                    min = list[k-1]
                    isPlus = true
                    var newExceptSum:Int = list.reduce(0,+)
                    sum += exceptSum-newExceptSum
                    exceptSum = newExceptSum
                    addList = []
                }
            } else {
                var sorted:[Int] = enemy[0...result+k-1].sorted(by: >)
                list = Array(sorted[0...k-1])
                min = list[k-1]
                isPlus = true
                exceptSum = list.reduce(0,+)
                sum = sorted[k...result+k-1].reduce(0,+)
                result += k
                if result > enemy.count {
                    return result
                }
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            if isPlus && enemy[result] > min {
                addList.append(enemy[result])
            }
            sum += enemy[result]
            result += 1
        }
    }
}

func solution1111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var minIndex = k-1
    var maxIndex = enemy.count
    var minSum = 0
    var expectedSum = 0
    var newExpectedSum = 0
    while true {
        if maxIndex - minIndex < 2 {
            return minIndex+1
        }
        var midiumIndex = minIndex+(maxIndex-minIndex)/2
        var sum:Int = 0
        var sorted:[Int] = enemy[0...midiumIndex].sorted(by: >)
        newExpectedSum = sorted[0...k-1].reduce(0,+)
        if minSum > 0 {
            sum = minSum + enemy[minIndex+1...midiumIndex].reduce(0,+) - newExpectedSum + expectedSum
        } else {
            sum = sorted[k...midiumIndex].reduce(0,+)
        }
        if sum < n {
            minIndex = midiumIndex
            minSum = sum
            expectedSum = newExpectedSum
        } else if sum == n {
            return midiumIndex+1
        } else {
            maxIndex = midiumIndex
        }
    }
}

// 6번 시간초과
func solution111111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = 0
    var sum:Int = 0
    var list:[Int] = []
    var exceptSum = 0
    var listIndex = -1
    var min:Int = 0
    var isPlus = false
    while true {
        if sum >= n {
            if result-1 > listIndex {
                var addList:[Int] = []
                if min > 0 {
                    addList = enemy[listIndex+1...result-1].filter {
                        $0 > min
                    }
                } else {
                    exceptSum = enemy[result...result+k-1].reduce(0,+)
                    addList = Array(enemy[0...result+k-1])
                    result += k
                    if result > enemy.count {
                        return result
                    }
                }
                if addList.count > 0 {
                    list = Array((list+addList).sorted(by: >)[0...k-1])
                    min = list[k-1]
                    isPlus = true
                    var newExceptSum:Int = list.reduce(0,+)
                    sum += exceptSum-newExceptSum
                    exceptSum = newExceptSum
                    listIndex = result-1
                }
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            if isPlus {
                if enemy[result] <= min {
                    listIndex += 1
                } else {
                    isPlus = false
                }
            }
            sum += enemy[result]
            result += 1
        }
    }
}

// 6번 시간초과
func solution11111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = 0
    var sum:Int = 0
    var list:[Int] = []
    var listIndex = -1
    var min:Int = 0
    var isPlus = false
    while true {
        if sum >= n {
            if result-1 > listIndex {
                var addList:[Int] = []
                if min > 0 {
                    addList = enemy[listIndex+1...result-1].filter {
                        $0 > min
                    }
                } else {
                    list = Array(enemy[result...result+k-1])
                    addList = Array(enemy[0...result-1])
                    result += k
                    if result > enemy.count {
                        return result
                    }
                }
                if addList.count > 0 {
                    var newList = Array((list+addList).sorted(by: >)[0...k-1])
                    min = newList[k-1]
                    var minCount:Int = newList.filter{ $0 == min }.count
                    isPlus = true
                    sum += list.filter{ $0 <= min }.reduce(0,+) - minCount*min - addList.filter{ $0 > min }.reduce(0,+)
                    list = newList
                    listIndex = result-1
                }
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            if isPlus {
                if enemy[result] <= min {
                    listIndex += 1
                } else {
                    isPlus = false
                }
            }
            sum += enemy[result]
            result += 1
        }
    }
}

solution11111111111111(7, 3, [4, 2, 4, 5, 3, 3, 1])

// 6번 시간초과
func solution1111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var listIndex = k-1
    var min:Int = 0
    while true {
        if sum >= n {
            if result-1 > listIndex {
                var addList:[Int] = []
                if min > 0 {
                    addList = enemy[listIndex+1...result-1].filter {
                        $0 > min
                    }
                } else {
                    addList = Array(enemy[listIndex+1...result-1])
                }
                if addList.count > 0 {
                    list += addList
                    list = Array(list.sorted(by: >)[0...k-1])
                    min = list[k-1]
                    var newExceptSum:Int = list.reduce(0,+)
                    sum = sum+exceptSum-newExceptSum
                    exceptSum = newExceptSum
                    listIndex = result-1
                }
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            result += 1
        }
    }
}

// 6번 시간초과
func solution111111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var listIndex = k-1
    var min:Int = 0
    while true {
        if sum >= n {
            if result-1 > listIndex {
                var addList:[Int] = []
                if min > 0 {
                    addList = enemy[listIndex+1...result-1].filter {
                        $0 > min
                    }
                } else {
                    addList = Array(enemy[listIndex+1...result-1])
                }
                list += addList
                list = Array(list.sorted(by: >)[0...k-1])
                min = list[k-1]
                var newExceptSum:Int = list.reduce(0,+)
                sum = sum+exceptSum-newExceptSum
                exceptSum = newExceptSum
                listIndex = result-1
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            result += 1
        }
    }
}

// 6번 시간초과
func solution11111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var listIndex = k-1
    while true {
        if sum >= n {
            if result-1 > listIndex {
                list += enemy[listIndex+1...result-1]
                list = Array(list.sorted(by: >)[0...k-1])
                var newExceptSum:Int = list.reduce(0,+)
                sum = sum+exceptSum-newExceptSum
                exceptSum = newExceptSum
                listIndex = result-1
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            result += 1
        }
    }
}

func solution1111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var minIndex = k-1
    var maxIndex = enemy.count
    var minSum = 0
    var expectedSum = 0
    var newExpectedSum = 0
    while true {
        if maxIndex - minIndex < 2 {
            return minIndex+1
        }
        var midiumIndex = minIndex+(maxIndex-minIndex)/2
        var sum:Int = 0
        newExpectedSum = enemy[0...midiumIndex].sorted(by: >)[0...k-1].reduce(0,+)
        if minSum > 0 {
            sum = minSum + enemy[minIndex+1...midiumIndex].reduce(0,+) - newExpectedSum + expectedSum
        } else {
            sum = enemy[0...midiumIndex].reduce(0,+) - newExpectedSum
        }
        if sum < n {
            minIndex = midiumIndex
            minSum = sum
            expectedSum = newExpectedSum
        } else if sum == n {
            return midiumIndex+1
        } else {
            maxIndex = midiumIndex
        }
    }
}

solution1111111111(7, 3, [4, 2, 4, 5, 3, 3, 1])

// 6번 시간초과
func solution111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var min:Int = 0
    while true {
        if sum >= n {
            if list.count > k {
                list = Array(list.sorted(by: >)[0...k-1])
                min = list[k-1]
                var newExceptSum:Int = list.reduce(0,+)
                sum = sum+exceptSum-newExceptSum
                exceptSum = newExceptSum
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            if enemy[result] > min {
                list.append(enemy[result])
            } else {
                min = enemy[result]
            }
            result += 1
        }
    }
}

func solution11111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var min:Int = 0
    while true {
        if sum >= n {
            if list.count > k {
                list = Array(list.sorted(by: >)[0...k-1])
                min = list[k-1]
                var newExceptSum:Int = list.reduce(0,+)
                sum = sum+exceptSum-newExceptSum
                exceptSum = newExceptSum
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            if enemy[result] > min {
                list.append(enemy[result])
            }
            result += 1
        }
    }
}

func solution1111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1]).sorted(by: <)
    var min:Int = list[0]
    while true {
        if sum > n {
            return result-1
        } else if sum == n {
            return result
        } else if result == enemy.count {
            return result
        } else {
            if enemy[result] <= min {
                sum += enemy[result]
            } else {
                sum += min
                list.append(enemy[result])
                list.remove(at: 0)
                list.sort()
                min = list[0]
            }
            result += 1
        }
    }
}

solution1111111(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5

func solution111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var min:Int = list.min() ?? 0
    while true {
        if sum >= n {
            if list.count > k {
                list = Array(list.sorted(by: >)[0...k-1])
                min = list[k-1]
                var newExceptSum:Int = list.reduce(0,+)
                sum = sum+exceptSum-newExceptSum
                exceptSum = newExceptSum
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            if enemy[result] > min {
                list.append(enemy[result])
            }
            result += 1
        }
    }
}

func solution11111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    while true {
        if sum >= n {
            if list.count > k {
                list = Array(list.sorted(by: >)[0...k-1])
            }
            var newExceptSum:Int = list.reduce(0,+)
            sum = sum+exceptSum-newExceptSum
            exceptSum = newExceptSum
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            list.append(enemy[result])
            result += 1
        }
    }
}

func solution1111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    while true {
        if sum >= n {
            var newList:[Int] = enemy[0...result-1].sorted(by: >)
            sum = newList[k...result-1].reduce(0,+)
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            result += 1
        }
    }
}

func solution111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    while true {
        if sum >= n {
            var newExceptSum:Int = enemy[0...result-1].sorted(by: >)[0...k-1].reduce(0,+)
            sum = sum+exceptSum-newExceptSum
            exceptSum = newExceptSum
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            } else {
                sum += enemy[result]
                result += 1
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            result += 1
        }
    }
}

solution111(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5

func solution11(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var list:[Int] = Array(enemy[0...k-1])
    var sum:Int = 0
    while true {
        if sum > n {
            return result-1
        } else if sum == n {
            return result
        } else if result == enemy.count {
            return result
        } else {
            var min:Int = list.min() ?? 0
            if enemy[result] <= min {
                sum += enemy[result]
            } else {
                sum += min
                list[list.firstIndex(of: min)!] = enemy[result]
            }
            result += 1
        }
    }
}

solution11(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5

func solution1(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    
    var list:[Int] = Array(enemy[0...k]).sorted(by: <)
    while true {
        if list[0...list.count-k-1].reduce(0, +) > n {
            return list.count-1
        } else if list[0...list.count-k-1].reduce(0, +) == n {
            return list.count
        } else if list.count == enemy.count {
            return list.count
        } else {
            list.append(enemy[list.count])
            list.sort()
        }
    }
}

solution1(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5
