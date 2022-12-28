import Foundation

/* 스티커 모으기(2)

 - N개의 스티커가 원형으로 연결되어 있습니다. 다음 그림은 N = 8인 경우의 예시입니다.
 스티커_hb1jty.jpg
 원형으로 연결된 스티커에서 몇 장의 스티커를 뜯어내어 뜯어낸 스티커에 적힌 숫자의 합이 최대가 되도록 하고 싶습니다. 단 스티커 한 장을 뜯어내면 양쪽으로 인접해있는 스티커는 찢어져서 사용할 수 없게 됩니다.

 예를 들어 위 그림에서 14가 적힌 스티커를 뜯으면 인접해있는 10, 6이 적힌 스티커는 사용할 수 없습니다. 스티커에 적힌 숫자가 배열 형태로 주어질 때, 스티커를 뜯어내어 얻을 수 있는 숫자의 합의 최댓값을 return 하는 solution 함수를 완성해 주세요. 원형의 스티커 모양을 위해 배열의 첫 번째 원소와 마지막 원소가 서로 연결되어 있다고 간주합니다.

 제한 사항
 sticker는 원형으로 연결된 스티커의 각 칸에 적힌 숫자가 순서대로 들어있는 배열로, 길이(N)는 1 이상 100,000 이하입니다.
 sticker의 각 원소는 스티커의 각 칸에 적힌 숫자이며, 각 칸에 적힌 숫자는 1 이상 100 이하의 자연수입니다.
 원형의 스티커 모양을 위해 sticker 배열의 첫 번째 원소와 마지막 원소가 서로 연결되어있다고 간주합니다.
*/
func solution10(_ sticker:[Int]) -> Int {
    if sticker.count%2 == 0 {
        var evenSum:Int = 0
        var oddSum:Int = 0
        var isEven = true
        for v in sticker {
            if isEven {
                evenSum += v
                isEven = false
            } else {
                isEven = true
                oddSum += v
            }
        }
        return max(evenSum, oddSum)
    } else {
        var result:[Int] = []
        for v in sticker {
            
        }
        return result.max() ?? 0
    }
}

solution10([14, 6, 5, 11, 3, 9, 2, 10]) // 36

/* 징검다리 건너기

 - [본 문제는 정확성과 효율성 테스트 각각 점수가 있는 문제입니다.]
 
 카카오 초등학교의 "니니즈 친구들"이 "라이언" 선생님과 함께 가을 소풍을 가는 중에 징검다리가 있는 개울을 만나서 건너편으로 건너려고 합니다. "라이언" 선생님은 "니니즈 친구들"이 무사히 징검다리를 건널 수 있도록 다음과 같이 규칙을 만들었습니다.

 징검다리는 일렬로 놓여 있고 각 징검다리의 디딤돌에는 모두 숫자가 적혀 있으며 디딤돌의 숫자는 한 번 밟을 때마다 1씩 줄어듭니다.
 디딤돌의 숫자가 0이 되면 더 이상 밟을 수 없으며 이때는 그 다음 디딤돌로 한번에 여러 칸을 건너 뛸 수 있습니다.
 단, 다음으로 밟을 수 있는 디딤돌이 여러 개인 경우 무조건 가장 가까운 디딤돌로만 건너뛸 수 있습니다.
 "니니즈 친구들"은 개울의 왼쪽에 있으며, 개울의 오른쪽 건너편에 도착해야 징검다리를 건넌 것으로 인정합니다.
 "니니즈 친구들"은 한 번에 한 명씩 징검다리를 건너야 하며, 한 친구가 징검다리를 모두 건넌 후에 그 다음 친구가 건너기 시작합니다.

 디딤돌에 적힌 숫자가 순서대로 담긴 배열 stones와 한 번에 건너뛸 수 있는 디딤돌의 최대 칸수 k가 매개변수로 주어질 때, 최대 몇 명까지 징검다리를 건널 수 있는지 return 하도록 solution 함수를 완성해주세요.

 [제한사항]
 징검다리를 건너야 하는 니니즈 친구들의 수는 무제한 이라고 간주합니다.
 stones 배열의 크기는 1 이상 200,000 이하입니다.
 stones 배열 각 원소들의 값은 1 이상 200,000,000 이하인 자연수입니다.
 k는 1 이상 stones의 길이 이하인 자연수입니다.
*/
func solution9(_ stones:[Int], _ k:Int) -> Int {
    if k == 1 || stones.count == k {
        return stones.sorted(by: <)[0]
    }
    var minValue = stones.min()!
    var maxValue = stones.max()!
    var median:Int = 0
    while true {
        median = (minValue+maxValue)/2
        var count:Int = 0
        var isDone = false
        for stone in stones {
            if stone <= median {
                count += 1
                if count >= k {
                    isDone = true
                    break
                }
            } else {
                count = 0
            }
        }
        if isDone {
            maxValue = median
        } else {
            minValue = median
        }
        if maxValue-minValue <= 1 {
            break
        }
    }
    return maxValue
}

solution9([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3) // 3

func solution97(_ stones:[Int], _ k:Int) -> Int {
    if k == 1 || stones.count == k {
        return stones.sorted(by: <)[0]
    }
    var minValue = stones.min()!
    var maxValue = stones.max()!
    var median:Int = 0
    while true {
        median = (minValue+maxValue)/2
        var count:Int = 0
        var isDone = false
        for stone in stones {
            if stone <= median {
                count += 1
                if count >= k {
                    isDone = true
                    break
                }
            } else {
                count = 0
            }
        }
        if isDone {
            maxValue = median
        } else {
            minValue = median
        }
        if maxValue-minValue <= 1 {
            break
        }
    }
    return maxValue
}

class Deque<T: Equatable> {
    var enqueue: [T]
    var dequeue: [T] = []
    var count: Int {
        return enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var first: T? {
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
    }
    init(_ queue: [T]) {
        enqueue = queue
    }
    func pushFirst(_ n: T) {
        dequeue.append(n)
    }
    func pushLast(_ n: T) {
        enqueue.append(n)
    }
    func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
        
    }
    func popLast() -> T? {
        var returnValue: T?
        if enqueue.isEmpty {
            dequeue.reverse()
            returnValue = dequeue.popLast()
            dequeue.reverse()
        } else {
            returnValue = enqueue.popLast()
        }
        return returnValue
    }
    func contains(_ n: T) -> Bool {
        return enqueue.contains(n) || dequeue.contains(n)
    }
    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
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

func solution96(_ stones:[Int], _ k:Int) -> Int {
    if k == 1 || stones.count == k {
        return stones.sorted(by: <)[0]
    }
    var myMaxHeap: MaxHeap<Int> = MaxHeap()
    for i in 0...k-1 {
        myMaxHeap.insert(stones[i])
    }
    var result:Int = myMaxHeap.pop()!
    var index = k
    while true {
        if stones[index] >= result {
            index += k-1
        } else {
            myMaxHeap.heap = []
            for i in index-k+1...index {
                myMaxHeap.insert(stones[i])
            }
            let maxValue:Int = myMaxHeap.pop()!
            if maxValue < result {
                result = maxValue
            }
            index += 1
        }
        if index >= stones.count {
            break;
        }
    }
    return result
}

func solution95(_ stones:[Int], _ k:Int) -> Int {
    if k == 1 || stones.count == k {
        return stones.sorted(by: <)[0]
    }
    var deque: Deque<Int> = Deque(Array(stones[0...k-1]))
    var result:Int = deque.enqueue.max() ?? 0
    var passValue:Int = 0
    for i in k...stones.count-1 {
        deque.popFirst()
        deque.pushLast(stones[i])
        if stones[i] >= result {
            passValue = i+k-1
        } else if passValue < i {
            let maxValue:Int = max(deque.enqueue.max() ?? 0, deque.dequeue.max() ?? 0)
            if maxValue < result {
                result = maxValue
            }
        }
    }
    return result
}

func solution94(_ stones:[Int], _ k:Int) -> Int {
    if k == 1 || stones.count == k {
        return stones.sorted(by: <)[0]
    }
    var myMaxHeap: MaxHeap<Int> = MaxHeap()
    for i in 0...k-1 {
        myMaxHeap.insert(stones[i])
    }
    var result:Int = myMaxHeap.pop()!
    for i in k...stones.count-k {
        if stones[i] < result {
            myMaxHeap.heap = []
            for j in 0...k-1 {
                myMaxHeap.insert(stones[i+j])
            }
            let maxValue = myMaxHeap.pop()!
            if maxValue < result {
                result = maxValue
            }
        }
    }
    return result
}

// 효율성 실패
func solution93(_ stones:[Int], _ k:Int) -> Int {
    var list:Set<Int> = Set<Int>()
    list.formUnion(stones)
    for i in list.sorted(by: <) {
        var count:Int = 0
        for stone in stones {
            if stone <= i {
                count += 1
                if count == k {
                    return i
                }
            } else {
                count = 0
            }
        }
    }
    return 0
}

// 효율성 실패
func solution92(_ stones:[Int], _ k:Int) -> Int {
    var result: Int = 200000000
    for i in 0...stones.count-k {
        if stones[i] < result {
            let maxValue = stones[i..<i+k].max()!
            if maxValue < result {
                result = maxValue
            }
        }
    }
    return result
}

// 효율성 실패
func solution91(_ stones:[Int], _ k:Int) -> Int {
    var result:Int = 0
    var list = stones
    while true {
        var count:Int = 0
        for i in 0...stones.count-1 {
            if list[i] > 0 {
                list[i] = list[i]-1
                count = 0
            } else {
                count += 1
                if count == k {
                    return result
                }
            }
        }
        result += 1
    }
    
    return result
}

/* [카카오 인턴] 보석 쇼핑

 - [본 문제는 정확성과 효율성 테스트 각각 점수가 있는 문제입니다.]
 
 개발자 출신으로 세계 최고의 갑부가 된 어피치는 스트레스를 받을 때면 이를 풀기 위해 오프라인 매장에 쇼핑을 하러 가곤 합니다.
 어피치는 쇼핑을 할 때면 매장 진열대의 특정 범위의 물건들을 모두 싹쓸이 구매하는 습관이 있습니다.
 어느 날 스트레스를 풀기 위해 보석 매장에 쇼핑을 하러 간 어피치는 이전처럼 진열대의 특정 범위의 보석을 모두 구매하되 특별히 아래 목적을 달성하고 싶었습니다.
 진열된 모든 종류의 보석을 적어도 1개 이상 포함하는 가장 짧은 구간을 찾아서 구매

 예를 들어 아래 진열대는 4종류의 보석(RUBY, DIA, EMERALD, SAPPHIRE) 8개가 진열된 예시입니다.

 진열대 번호    1    2    3    4    5    6    7    8
 보석 이름    DIA    RUBY    RUBY    DIA    DIA    EMERALD    SAPPHIRE    DIA
 진열대의 3번부터 7번까지 5개의 보석을 구매하면 모든 종류의 보석을 적어도 하나 이상씩 포함하게 됩니다.

 진열대의 3, 4, 6, 7번의 보석만 구매하는 것은 중간에 특정 구간(5번)이 빠지게 되므로 어피치의 쇼핑 습관에 맞지 않습니다.

 진열대 번호 순서대로 보석들의 이름이 저장된 배열 gems가 매개변수로 주어집니다. 이때 모든 보석을 하나 이상 포함하는 가장 짧은 구간을 찾아서 return 하도록 solution 함수를 완성해주세요.
 가장 짧은 구간의 시작 진열대 번호와 끝 진열대 번호를 차례대로 배열에 담아서 return 하도록 하며, 만약 가장 짧은 구간이 여러 개라면 시작 진열대 번호가 가장 작은 구간을 return 합니다.

 [제한사항]
 gems 배열의 크기는 1 이상 100,000 이하입니다.
 gems 배열의 각 원소는 진열대에 나열된 보석을 나타냅니다.
 gems 배열에는 1번 진열대부터 진열대 번호 순서대로 보석이름이 차례대로 저장되어 있습니다.
 gems 배열의 각 원소는 길이가 1 이상 10 이하인 알파벳 대문자로만 구성된 문자열입니다.
*/
func solution8(_ gems:[String]) -> [Int] {
    let kinds = Dictionary(grouping: gems) { $0 }.keys.count
    if kinds == gems.count {
        return [1, gems.count]
    }
    var result:[Int] = []
    
    var savedList:[String:Int] = [:]
    var minCount = gems.count-1
    var firstIndex = 0
    var firstJ: String = ""
    for i in 0...gems.count-1 {
        savedList[gems[i]] = i
        if savedList.count == kinds {
            if firstJ == "" {
                firstJ = savedList.sorted{ $0.value < $1.value }[0].key
                firstIndex = savedList[firstJ]!
                result = [firstIndex+1, i+1]
                minCount =  i - firstIndex
            } else {
                let first = savedList[firstJ]!
                if firstIndex < first {
                    firstJ = savedList.sorted{ $0.value < $1.value }[0].key
                    firstIndex = savedList[firstJ]!
                    if i - firstIndex < minCount {
                        result = [firstIndex+1, i+1]
                        minCount =  i - firstIndex
                    }
                }
            }
        }
    }
    if result == [] {
        return [1, gems.count]
    }
    return result
}

solution8(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]) // [3,7]

// 효율성 시간초과 - 2개
func solution84(_ gems:[String]) -> [Int] {
    let kinds = Dictionary(grouping: gems) { $0 }.keys.count
    if kinds == gems.count {
        return [1, gems.count]
    }
    var result:[Int] = []
    
    var savedList:[String:Int] = [:]
    var minCount = gems.count-1
    
    for i in 0...gems.count-1 {
        savedList[gems[i]] = i
        if savedList.count == kinds {
            let firstIndex = savedList.values.min()!
            if i - firstIndex < minCount {
                result = [firstIndex+1, i+1]
                minCount =  i - firstIndex
            }
           
        }
    }
    if result == [] {
        return [1, gems.count]
    }
    return result
}

// 효율성 시간초과
func solution83(_ gems:[String]) -> [Int] {
    var dic:[String:Int] = [:]
    for i in 0...gems.count-1 {
        dic[gems[i]] = i
    }
    let kinds = dic.count
    if kinds == gems.count {
        return [1, gems.count]
    }
    let index:Int = dic.values.sorted(by: <)[0]
    var result:[Int] = []
    
    var list:[String] = []
    var savedList:[String:Int] = [:]
    var minCount = gems.count
    var startIndex = 0
    
    for i in 0...gems.count-1 {
        if list.contains(gems[i]) {
            if gems[startIndex] == gems[i] {
                startIndex += 1
                while true {
                    if (savedList[gems[startIndex]] ?? 0) > startIndex {
                        startIndex += 1
                    } else {
                        break
                    }
                }
            } else {
                savedList[gems[i]] = i
            }
        } else {
            list.append(gems[i])
        }
        if index < startIndex {
            break
        }
        if list.count == kinds && i - startIndex < minCount {
            result = [startIndex+1, i+1]
            minCount = i - startIndex
        }
    }
    if result == [] {
        return [1, gems.count]
    }
    return result
}

// 효율성 시간초과
func solution82(_ gems:[String]) -> [Int] {
    let kinds = Dictionary(grouping: gems) { $0 }.keys.count
    if kinds == gems.count {
        return [1, gems.count]
    }
    var result:[Int] = []
    
    var list:[String] = []
    var savedList:[String:Int] = [:]
    var minCount = gems.count-1
    var startIndex = 0
    
    for i in 0...gems.count-1 {
        if list.contains(gems[i]) {
            if gems[startIndex] == gems[i] {
                startIndex += 1
                while true {
                    if (savedList[gems[startIndex]] ?? 0) > startIndex {
                        startIndex += 1
                    } else {
                        break
                    }
                }
            } else {
                savedList[gems[i]] = i
            }
        } else {
            list.append(gems[i])
        }
        if list.count == kinds && i - startIndex < minCount {
            result = [startIndex+1, i+1]
            minCount = i - startIndex
        }
    }
    if result == [] {
        return [1, gems.count]
    }
    return result
}

// 효율성 시간초과
func solution81(_ gems:[String]) -> [Int] {
    let kinds = Dictionary(grouping: gems) { $0 }.keys.count
    if kinds == gems.count {
        return [1, gems.count]
    }
    var result:[Int] = []
    
    var list:[String] = []
    var savedList:[String] = []
    var minCount = gems.count-1
    var startIndex = 0
    
    for i in 0...gems.count-1 {
        if list.contains(gems[i]) {
            if gems[startIndex] == gems[i] {
                startIndex += 1
                while true {
                    if savedList.contains(gems[startIndex]) {
                        savedList.remove(at: savedList.firstIndex(of: gems[startIndex]) ?? 0)
                        startIndex += 1
                    } else {
                        break
                    }
                }
            } else {
                savedList.append(gems[i])
            }
        } else {
            list.append(gems[i])
        }
        if list.count == kinds && i - startIndex < minCount {
            result = [startIndex+1, i+1]
            minCount = i - startIndex
        }
    }
    if result == [] {
        return [1, gems.count]
    }
    return result
}

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
