import Foundation

/* 소수 찾기

 - 한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.
 
 각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.

 제한사항
 numbers는 길이 1 이상 7 이하인 문자열입니다.
 numbers는 0~9까지 숫자만으로 이루어져 있습니다.
 "013"은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.
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

func permute<C: Collection>(items: C) -> [[C.Iterator.Element]] {
    var scratch = Array(items) // This is a scratch space for Heap's algorithm
    var result: [[C.Iterator.Element]] = [] // This will accumulate our result
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


func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

func solution20(_ numbers:String) -> Int {
    var set = Set<Int>()
    for data in allCombos(elements: Array(numbers)) {
        if data.count == 1 {
            set.insert(Int(String(data[0])) ?? 0)
        } else {
            var list = permute(items: data)
            for p in list {
                set.insert(Int(String(p)) ?? 0)
            }
        }
    }
    var result:Int = 0
    for s in set {
        if s > 1 && isPrime(num: s) {
            result += 1
        }
    }
    return result
}

solution20("011") // 2
solution20("17")

/* H-Index

 - H-Index는 과학자의 생산성과 영향력을 나타내는 지표입니다. 어느 과학자의 H-Index를 나타내는 값인 h를 구하려고 합니다. 위키백과1에 따르면, H-Index는 다음과 같이 구합니다.
 
 어떤 과학자가 발표한 논문 n편 중, h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 h의 최댓값이 이 과학자의 H-Index입니다.

 어떤 과학자가 발표한 논문의 인용 횟수를 담은 배열 citations가 매개변수로 주어질 때, 이 과학자의 H-Index를 return 하도록 solution 함수를 작성해주세요.

 제한사항
 과학자가 발표한 논문의 수는 1편 이상 1,000편 이하입니다.
 논문별 인용 횟수는 0회 이상 10,000회 이하입니다.
*/
func solution19(_ citations:[Int]) -> Int {
    var result: Int = 0
    var sorted = citations.sorted(by: >)
    for i in 0...sorted.count-1 {
        result += 1
        if sorted[i] < result {
            result -= 1
            break
        } else if sorted[i] == result {
            break
        }
    }
    return result
}

/* 가장 큰 수

 - 0 또는 양의 정수가 주어졌을 때, 정수를 이어 붙여 만들 수 있는 가장 큰 수를 알아내 주세요.
 
 예를 들어, 주어진 정수가 [6, 10, 2]라면 [6102, 6210, 1062, 1026, 2610, 2106]를 만들 수 있고, 이중 가장 큰 수는 6210입니다.

 0 또는 양의 정수가 담긴 배열 numbers가 매개변수로 주어질 때, 순서를 재배치하여 만들 수 있는 가장 큰 수를 문자열로 바꾸어 return 하도록 solution 함수를 작성해주세요.

 제한 사항
 numbers의 길이는 1 이상 100,000 이하입니다.
 numbers의 원소는 0 이상 1,000 이하입니다.
 정답이 너무 클 수 있으니 문자열로 바꾸어 return 합니다.
*/
func solution18(_ numbers:[Int]) -> String {
    var result:String = numbers.map { String($0) }.sorted {
        if $0+$1 > $1+$0 {
            return true
        } else {
            return false
        }

    }.joined()
    if Array(result)[0] == "0" {
        result = "0"
    }
    return result
}

solution18([1, 11, 110, 1110]) // 1111101110
solution18([34, 3444, 32, 3222]) // 344434323222
solution18([911,98,990,99,0,99,1,2,333,33,4,11,1000,123,111,0])
solution18([48, 484, 533]) // 53348484

/* 프린터

 - 일반적인 프린터는 인쇄 요청이 들어온 순서대로 인쇄합니다. 그렇기 때문에 중요한 문서가 나중에 인쇄될 수 있습니다. 이런 문제를 보완하기 위해 중요도가 높은 문서를 먼저 인쇄하는 프린터를 개발했습니다. 이 새롭게 개발한 프린터는 아래와 같은 방식으로 인쇄 작업을 수행합니다.
 
 1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
 2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
 3. 그렇지 않으면 J를 인쇄합니다.
 예를 들어, 4개의 문서(A, B, C, D)가 순서대로 인쇄 대기목록에 있고 중요도가 2 1 3 2 라면 C D A B 순으로 인쇄하게 됩니다.

 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 알고 싶습니다. 위의 예에서 C는 1번째로, A는 3번째로 인쇄됩니다.

 현재 대기목록에 있는 문서의 중요도가 순서대로 담긴 배열 priorities와 내가 인쇄를 요청한 문서가 현재 대기목록의 어떤 위치에 있는지를 알려주는 location이 매개변수로 주어질 때, 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 return 하도록 solution 함수를 작성해주세요.

 제한사항
 현재 대기목록에는 1개 이상 100개 이하의 문서가 있습니다.
 인쇄 작업의 중요도는 1~9로 표현하며 숫자가 클수록 중요하다는 뜻입니다.
 location은 0 이상 (현재 대기목록에 있는 작업 수 - 1) 이하의 값을 가지며 대기목록의 가장 앞에 있으면 0, 두 번째에 있으면 1로 표현합니다.
*/
func solution17(_ priorities:[Int], _ location:Int) -> Int {
    var currentLocation:Int = location
    var currentList = priorities
    var sorted = priorities.sorted(by: >)
    var result:Int = 0
    while true {
        if currentList[0] == sorted[0] {
            result += 1
            sorted.removeFirst()
            currentList.removeFirst()
            if currentLocation == 0 {
                break
            } else {
                currentLocation -= 1
            }
        } else {
            var value = currentList.removeFirst()
            currentList.append(value)
            if currentLocation == 0 {
                currentLocation = currentList.count-1
            } else {
                currentLocation -= 1
            }
        }
    }
    return result
}

/* 기능개발

 - 프로그래머스 팀에서는 기능 개선 작업을 수행 중입니다. 각 기능은 진도가 100%일 때 서비스에 반영할 수 있습니다.
 
 또, 각 기능의 개발속도는 모두 다르기 때문에 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고, 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포됩니다.

 먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와 각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때 각 배포마다 몇 개의 기능이 배포되는지를 return 하도록 solution 함수를 완성하세요.

 제한 사항
 작업의 개수(progresses, speeds배열의 길이)는 100개 이하입니다.
 작업 진도는 100 미만의 자연수입니다.
 작업 속도는 100 이하의 자연수입니다.
 배포는 하루에 한 번만 할 수 있으며, 하루의 끝에 이루어진다고 가정합니다. 예를 들어 진도율이 95%인 작업의 개발 속도가 하루에 4%라면 배포는 2일 뒤에 이루어집니다.
*/
func solution16(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var list:[Int] = []
    for i in 0...progresses.count-1 {
        list.append((100-progresses[i])/speeds[i] + ((100-progresses[i])%speeds[i] == 0 ? 0 : 1))
    }
    var result:[Int] = []
    var count:Int = 0
    var days:Int = list[0]
    for i in 0...list.count-1 {
        if list[i] <= days {
            count += 1
        } else {
            result.append(count)
            days = list[i]
            count = 1
        }
    }
    result.append(count)
    return result
}

/* 다리를 지나는 트럭

 - 트럭 여러 대가 강을 가로지르는 일차선 다리를 정해진 순으로 건너려 합니다. 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내야 합니다. 다리에는 트럭이 최대 bridge_length대 올라갈 수 있으며, 다리는 weight 이하까지의 무게를 견딜 수 있습니다. 단, 다리에 완전히 오르지 않은 트럭의 무게는 무시합니다.
 
 예를 들어, 트럭 2대가 올라갈 수 있고 무게를 10kg까지 견디는 다리가 있습니다. 무게가 [7, 4, 5, 6]kg인 트럭이 순서대로 최단 시간 안에 다리를 건너려면 다음과 같이 건너야 합니다.

 경과 시간    다리를 지난 트럭    다리를 건너는 트럭    대기 트럭
 0    []    []    [7,4,5,6]
 1~2    []    [7]    [4,5,6]
 3    [7]    [4]    [5,6]
 4    [7]    [4,5]    [6]
 5    [7,4]    [5]    [6]
 6~7    [7,4,5]    [6]    []
 8    [7,4,5,6]    []    []
 따라서, 모든 트럭이 다리를 지나려면 최소 8초가 걸립니다.

 solution 함수의 매개변수로 다리에 올라갈 수 있는 트럭 수 bridge_length, 다리가 견딜 수 있는 무게 weight, 트럭 별 무게 truck_weights가 주어집니다. 이때 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 return 하도록 solution 함수를 완성하세요.

 제한 조건
 bridge_length는 1 이상 10,000 이하입니다.
 weight는 1 이상 10,000 이하입니다.
 truck_weights의 길이는 1 이상 10,000 이하입니다.
 모든 트럭의 무게는 1 이상 weight 이하입니다.
*/
func solution15(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucksOnBridge:[Int] = []
    for _ in 1...bridge_length {
        trucksOnBridge.append(0)
    }
    var result:Int = 0
    var index:Int = 0
    var sum:Int = 0
    while true {
        sum -= trucksOnBridge[0]
        trucksOnBridge.remove(at: 0)
        if sum+truck_weights[index] <= weight {
            sum += truck_weights[index]
            trucksOnBridge.append(truck_weights[index])
            index += 1
            if index == truck_weights.count {
                result += bridge_length+1
                break
            }
        } else {
            trucksOnBridge.append(0)
        }
        result += 1
    }
    return result
}

solution15(2, 10, [7,4,5,6]) // 8

/* 위장

 - 스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다.
 
 예를 들어 스파이가 가진 옷이 아래와 같고 오늘 스파이가 동그란 안경, 긴 코트, 파란색 티셔츠를 입었다면 다음날은 청바지를 추가로 입거나 동그란 안경 대신 검정 선글라스를 착용하거나 해야 합니다.

 종류    이름
 얼굴    동그란 안경, 검정 선글라스
 상의    파란색 티셔츠
 하의    청바지
 겉옷    긴 코트
 스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return 하도록 solution 함수를 작성해주세요.

 제한사항
 clothes의 각 행은 [의상의 이름, 의상의 종류]로 이루어져 있습니다.
 스파이가 가진 의상의 수는 1개 이상 30개 이하입니다.
 같은 이름을 가진 의상은 존재하지 않습니다.
 clothes의 모든 원소는 문자열로 이루어져 있습니다.
 모든 문자열의 길이는 1 이상 20 이하인 자연수이고 알파벳 소문자 또는 '_' 로만 이루어져 있습니다.
 스파이는 하루에 최소 한 개의 의상은 입습니다.
*/
func solution14(_ clothes:[[String]]) -> Int {
    var result:Int = 1
    var groupedClothes = Dictionary(grouping: clothes ) { $0.last! }.values.map {
        result *= ($0.count+1)
    }
    return result-1
}

solution14([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])

/* [3차] n진수 게임

 - N진수 게임
 튜브가 활동하는 코딩 동아리에서는 전통적으로 해오는 게임이 있다. 이 게임은 여러 사람이 둥글게 앉아서 숫자를 하나씩 차례대로 말하는 게임인데, 규칙은 다음과 같다.

 숫자를 0부터 시작해서 차례대로 말한다. 첫 번째 사람은 0, 두 번째 사람은 1, … 열 번째 사람은 9를 말한다.
 10 이상의 숫자부터는 한 자리씩 끊어서 말한다. 즉 열한 번째 사람은 10의 첫 자리인 1, 열두 번째 사람은 둘째 자리인 0을 말한다.
 이렇게 게임을 진행할 경우,
 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, …
 순으로 숫자를 말하면 된다.

 한편 코딩 동아리 일원들은 컴퓨터를 다루는 사람답게 이진수로 이 게임을 진행하기도 하는데, 이 경우에는
 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, …
 순으로 숫자를 말하면 된다.

 이진수로 진행하는 게임에 익숙해져 질려가던 사람들은 좀 더 난이도를 높이기 위해 이진법에서 십육진법까지 모든 진법으로 게임을 진행해보기로 했다. 숫자 게임이 익숙하지 않은 튜브는 게임에 져서 벌칙을 받는 굴욕을 피하기 위해, 자신이 말해야 하는 숫자를 스마트폰에 미리 출력해주는 프로그램을 만들려고 한다. 튜브의 프로그램을 구현하라.

 입력 형식
 진법 n, 미리 구할 숫자의 갯수 t, 게임에 참가하는 인원 m, 튜브의 순서 p 가 주어진다.

 2 ≦ n ≦ 16
 0 ＜ t ≦ 1000
 2 ≦ m ≦ 100
 1 ≦ p ≦ m
 출력 형식
 튜브가 말해야 하는 숫자 t개를 공백 없이 차례대로 나타낸 문자열. 단, 10~15는 각각 대문자 A~F로 출력한다.
*/
func solution13(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var list:[Character] = Array(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"][0...n-1])
    var str:String = String(list)
    var i:Int = 1
    var j:Int = 0
    var result:[Character] = []
    while j < t {
        str += list.map { "\(String(i, radix: n).uppercased())\($0)" }.joined()
        i += 1
        if p-1+j*m < str.count {
            result.append(Array(str)[p-1+j*m])
            j += 1
        }
    }
    return String(result)
}

solution13(2, 4, 2, 1) // "0111"
solution13(16, 16, 2, 1) // "02468ACE11111111"
solution13(16, 1000, 100, 100)

/* [3차] 파일명 정렬

 - 파일명 정렬
 세 차례의 코딩 테스트와 두 차례의 면접이라는 기나긴 블라인드 공채를 무사히 통과해 카카오에 입사한 무지는 파일 저장소 서버 관리를 맡게 되었다.

 저장소 서버에는 프로그램의 과거 버전을 모두 담고 있어, 이름 순으로 정렬된 파일 목록은 보기가 불편했다. 파일을 이름 순으로 정렬하면 나중에 만들어진 ver-10.zip이 ver-9.zip보다 먼저 표시되기 때문이다.

 버전 번호 외에도 숫자가 포함된 파일 목록은 여러 면에서 관리하기 불편했다. 예컨대 파일 목록이 ["img12.png", "img10.png", "img2.png", "img1.png"]일 경우, 일반적인 정렬은 ["img1.png", "img10.png", "img12.png", "img2.png"] 순이 되지만, 숫자 순으로 정렬된 ["img1.png", "img2.png", "img10.png", img12.png"] 순이 훨씬 자연스럽다.

 무지는 단순한 문자 코드 순이 아닌, 파일명에 포함된 숫자를 반영한 정렬 기능을 저장소 관리 프로그램에 구현하기로 했다.

 소스 파일 저장소에 저장된 파일명은 100 글자 이내로, 영문 대소문자, 숫자, 공백(" "), 마침표("."), 빼기 부호("-")만으로 이루어져 있다. 파일명은 영문자로 시작하며, 숫자를 하나 이상 포함하고 있다.

 파일명은 크게 HEAD, NUMBER, TAIL의 세 부분으로 구성된다.

 HEAD는 숫자가 아닌 문자로 이루어져 있으며, 최소한 한 글자 이상이다.
 NUMBER는 한 글자에서 최대 다섯 글자 사이의 연속된 숫자로 이루어져 있으며, 앞쪽에 0이 올 수 있다. 0부터 99999 사이의 숫자로, 00000이나 0101 등도 가능하다.
 TAIL은 그 나머지 부분으로, 여기에는 숫자가 다시 나타날 수도 있으며, 아무 글자도 없을 수 있다.
 파일명    HEAD    NUMBER    TAIL
 foo9.txt    foo    9    .txt
 foo010bar020.zip    foo    010    bar020.zip
 F-15    F-    15    (빈 문자열)
 파일명을 세 부분으로 나눈 후, 다음 기준에 따라 파일명을 정렬한다.

 파일명은 우선 HEAD 부분을 기준으로 사전 순으로 정렬한다. 이때, 문자열 비교 시 대소문자 구분을 하지 않는다. MUZI와 muzi, MuZi는 정렬 시에 같은 순서로 취급된다.
 파일명의 HEAD 부분이 대소문자 차이 외에는 같을 경우, NUMBER의 숫자 순으로 정렬한다. 9 < 10 < 0011 < 012 < 13 < 014 순으로 정렬된다. 숫자 앞의 0은 무시되며, 012와 12는 정렬 시에 같은 같은 값으로 처리된다.
 두 파일의 HEAD 부분과, NUMBER의 숫자도 같을 경우, 원래 입력에 주어진 순서를 유지한다. MUZI01.zip과 muzi1.png가 입력으로 들어오면, 정렬 후에도 입력 시 주어진 두 파일의 순서가 바뀌어서는 안 된다.
 무지를 도와 파일명 정렬 프로그램을 구현하라.

 입력 형식
 입력으로 배열 files가 주어진다.

 files는 1000 개 이하의 파일명을 포함하는 문자열 배열이다.
 각 파일명은 100 글자 이하 길이로, 영문 대소문자, 숫자, 공백(" "), 마침표("."), 빼기 부호("-")만으로 이루어져 있다. 파일명은 영문자로 시작하며, 숫자를 하나 이상 포함하고 있다.
 중복된 파일명은 없으나, 대소문자나 숫자 앞부분의 0 차이가 있는 경우는 함께 주어질 수 있다. (muzi1.txt, MUZI1.txt, muzi001.txt, muzi1.TXT는 함께 입력으로 주어질 수 있다.)
 출력 형식
 위 기준에 따라 정렬된 배열을 출력한다.
*/
func solution12(_ files:[String]) -> [String] {
    var dic:[String:[String]] = Dictionary(grouping: files) {
        $0.components(separatedBy: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])[0].lowercased()
    }
    var result:[String] = []
    for key in dic.keys.sorted(by: <) {
        if dic[key]!.count == 1 {
            result.append(dic[key]![0])
        } else {
            var list:[String] = dic[key]!.sorted {
                var str1:String = ""
                var str2:String = ""
                for i in key.count...$0.count-1 {
                    if Array($0)[i].isNumber {
                        str1 += String(Array($0)[i])
                    } else {
                        break
                    }
                }
                for i in key.count...$1.count-1 {
                    if Array($1)[i].isNumber {
                        str2 += String(Array($1)[i])
                    } else {
                        break
                    }
                }
                return Int(str1) ?? 0 < Int(str2) ?? 0
            }
            for s in list {
                result.append(s)
            }
        }
    }
    return result
}

solution12(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])
// ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
solution12(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])


/* [3차] 압축

 - 압축
 신입사원 어피치는 카카오톡으로 전송되는 메시지를 압축하여 전송 효율을 높이는 업무를 맡게 되었다. 메시지를 압축하더라도 전달되는 정보가 바뀌어서는 안 되므로, 압축 전의 정보를 완벽하게 복원 가능한 무손실 압축 알고리즘을 구현하기로 했다.

 어피치는 여러 압축 알고리즘 중에서 성능이 좋고 구현이 간단한 LZW(Lempel–Ziv–Welch) 압축을 구현하기로 했다. LZW 압축은 1983년 발표된 알고리즘으로, 이미지 파일 포맷인 GIF 등 다양한 응용에서 사용되었다.

 LZW 압축은 다음 과정을 거친다.

 길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
 w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
 단계 2로 돌아간다.
 압축 알고리즘이 영문 대문자만 처리한다고 할 때, 사전은 다음과 같이 초기화된다. 사전의 색인 번호는 정수값으로 주어지며, 1부터 시작한다고 하자.

 색인 번호    1    2    3    ...    24    25    26
 단어    A    B    C    ...    X    Y    Z
 예를 들어 입력으로 KAKAO가 들어온다고 하자.

 현재 사전에는 KAKAO의 첫 글자 K는 등록되어 있으나, 두 번째 글자까지인 KA는 없으므로, 첫 글자 K에 해당하는 색인 번호 11을 출력하고, 다음 글자인 A를 포함한 KA를 사전에 27 번째로 등록한다.
 두 번째 글자 A는 사전에 있으나, 세 번째 글자까지인 AK는 사전에 없으므로, A의 색인 번호 1을 출력하고, AK를 사전에 28 번째로 등록한다.
 세 번째 글자에서 시작하는 KA가 사전에 있으므로, KA에 해당하는 색인 번호 27을 출력하고, 다음 글자 O를 포함한 KAO를 29 번째로 등록한다.
 마지막으로 처리되지 않은 글자 O에 해당하는 색인 번호 15를 출력한다.
 현재 입력(w)    다음 글자(c)    출력    사전 추가(w+c)
 K    A    11    27: KA
 A    K    1    28: AK
 KA    O    27    29: KAO
 O        15
 이 과정을 거쳐 다섯 글자의 문장 KAKAO가 4개의 색인 번호 [11, 1, 27, 15]로 압축된다.

 입력으로 TOBEORNOTTOBEORTOBEORNOT가 들어오면 다음과 같이 압축이 진행된다.

 현재 입력(w)    다음 글자(c)    출력    사전 추가(w+c)
 T    O    20    27: TO
 O    B    15    28: OB
 B    E    2    29: BE
 E    O    5    30: EO
 O    R    15    31: OR
 R    N    18    32: RN
 N    O    14    33: NO
 O    T    15    34: OT
 T    T    20    35: TT
 TO    B    27    36: TOB
 BE    O    29    37: BEO
 OR    T    31    38: ORT
 TOB    E    36    39: TOBE
 EO    R    30    40: EOR
 RN    O    32    41: RNO
 OT        34
 입력 형식
 입력으로 영문 대문자로만 이뤄진 문자열 msg가 주어진다. msg의 길이는 1 글자 이상, 1000 글자 이하이다.

 출력 형식
 주어진 문자열을 압축한 후의 사전 색인 번호를 배열로 출력하라.
*/
func solution11(_ msg:String) -> [Int] {
    var dictionary:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var result:[Int] = []
    var jumpIndex = -1
    var lastStr:String = ""
    for i in 0...msg.count-1 {
        if i <= jumpIndex {
            continue
        }
        for j in 0...msg.count-1-i {
            if !dictionary.contains(String(Array(msg)[i...i+j])) {
                result.append(dictionary.firstIndex(of: String(Array(msg)[i...i+j-1]))!+1)
                dictionary.append(String(Array(msg)[i...i+j]))
                jumpIndex = i+j-1
                break
            } else {
                if i+j == msg.count-1 {
                    lastStr = String(Array(msg)[i...i+j])
                    jumpIndex = i+j
                    break
                }
            }
        }
    }
    if lastStr != "" {
        result.append(dictionary.firstIndex(of: lastStr)!+1)
    }
    return result
}

solution11("TOBEORNOTTOBEORTOBEORNOT")
solution11("KAKAO")

/* [3차] 방금그곡

 - 방금그곡
 라디오를 자주 듣는 네오는 라디오에서 방금 나왔던 음악이 무슨 음악인지 궁금해질 때가 많다. 그럴 때 네오는 다음 포털의 '방금그곡' 서비스를 이용하곤 한다. 방금그곡에서는 TV, 라디오 등에서 나온 음악에 관해 제목 등의 정보를 제공하는 서비스이다.

 네오는 자신이 기억한 멜로디를 가지고 방금그곡을 이용해 음악을 찾는다. 그런데 라디오 방송에서는 한 음악을 반복해서 재생할 때도 있어서 네오가 기억하고 있는 멜로디는 음악 끝부분과 처음 부분이 이어서 재생된 멜로디일 수도 있다. 반대로, 한 음악을 중간에 끊을 경우 원본 음악에는 네오가 기억한 멜로디가 들어있다 해도 그 곡이 네오가 들은 곡이 아닐 수도 있다. 그렇기 때문에 네오는 기억한 멜로디를 재생 시간과 제공된 악보를 직접 보면서 비교하려고 한다. 다음과 같은 가정을 할 때 네오가 찾으려는 음악의 제목을 구하여라.

 방금그곡 서비스에서는 음악 제목, 재생이 시작되고 끝난 시각, 악보를 제공한다.
 네오가 기억한 멜로디와 악보에 사용되는 음은 C, C#, D, D#, E, F, F#, G, G#, A, A#, B 12개이다.
 각 음은 1분에 1개씩 재생된다. 음악은 반드시 처음부터 재생되며 음악 길이보다 재생된 시간이 길 때는 음악이 끊김 없이 처음부터 반복해서 재생된다. 음악 길이보다 재생된 시간이 짧을 때는 처음부터 재생 시간만큼만 재생된다.
 음악이 00:00를 넘겨서까지 재생되는 일은 없다.
 조건이 일치하는 음악이 여러 개일 때에는 라디오에서 재생된 시간이 제일 긴 음악 제목을 반환한다. 재생된 시간도 같을 경우 먼저 입력된 음악 제목을 반환한다.
 조건이 일치하는 음악이 없을 때에는 “(None)”을 반환한다.
 입력 형식
 입력으로 네오가 기억한 멜로디를 담은 문자열 m과 방송된 곡의 정보를 담고 있는 배열 musicinfos가 주어진다.

 m은 음 1개 이상 1439개 이하로 구성되어 있다.
 musicinfos는 100개 이하의 곡 정보를 담고 있는 배열로, 각각의 곡 정보는 음악이 시작한 시각, 끝난 시각, 음악 제목, 악보 정보가 ','로 구분된 문자열이다.
 음악의 시작 시각과 끝난 시각은 24시간 HH:MM 형식이다.
 음악 제목은 ',' 이외의 출력 가능한 문자로 표현된 길이 1 이상 64 이하의 문자열이다.
 악보 정보는 음 1개 이상 1439개 이하로 구성되어 있다.
 출력 형식
 조건과 일치하는 음악 제목을 출력한다.
*/
func solution10(_ m:String, _ musicinfos:[String]) -> String {
    var result:String = "(None)"
    var maxLength = 0
    for str in musicinfos {
        let list:[String] = str.components(separatedBy: ",")
        let startTime:[Int] = list[0].components(separatedBy: ":").map{ Int($0) ?? 0 }
        let endTime:[Int] = list[1].components(separatedBy: ":").map{ Int($0) ?? 0 }
        let duration:Int = (endTime[0] - startTime[0])*60 + (endTime[1] - startTime[1])
        if duration > maxLength {
            var music:[Character] = []
            var index = 0
            var musicList = Array(list[3])
            for _ in 1...duration {
                music.append(musicList[index%list[3].count])
                index += 1
                if index%list[3].count < musicList.count && musicList[index%list[3].count] == "#" {
                    music.append("#")
                    index += 1
                }
            }
            if String(music).contains(m) {
                var musicCount = String(music).components(separatedBy: m).filter({ $0.count == 0 || Array($0)[0] != "#" }).count
                if musicCount > 1 {
                    maxLength = duration
                    result = list[2]
                }
            }
        }
    }
    return result
}

solution10("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:15,WORLD,ABC#DEFAB"])
solution10("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"])
solution10("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"])
solution10("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"])

/* [1차] 캐시

 - 캐시
 지도개발팀에서 근무하는 제이지는 지도에서 도시 이름을 검색하면 해당 도시와 관련된 맛집 게시물들을 데이터베이스에서 읽어 보여주는 서비스를 개발하고 있다.
 이 프로그램의 테스팅 업무를 담당하고 있는 어피치는 서비스를 오픈하기 전 각 로직에 대한 성능 측정을 수행하였는데, 제이지가 작성한 부분 중 데이터베이스에서 게시물을 가져오는 부분의 실행시간이 너무 오래 걸린다는 것을 알게 되었다.
 어피치는 제이지에게 해당 로직을 개선하라고 닦달하기 시작하였고, 제이지는 DB 캐시를 적용하여 성능 개선을 시도하고 있지만 캐시 크기를 얼마로 해야 효율적인지 몰라 난감한 상황이다.

 어피치에게 시달리는 제이지를 도와, DB 캐시를 적용할 때 캐시 크기에 따른 실행시간 측정 프로그램을 작성하시오.

 입력 형식
 캐시 크기(cacheSize)와 도시이름 배열(cities)을 입력받는다.
 cacheSize는 정수이며, 범위는 0 ≦ cacheSize ≦ 30 이다.
 cities는 도시 이름으로 이뤄진 문자열 배열로, 최대 도시 수는 100,000개이다.
 각 도시 이름은 공백, 숫자, 특수문자 등이 없는 영문자로 구성되며, 대소문자 구분을 하지 않는다. 도시 이름은 최대 20자로 이루어져 있다.
 출력 형식
 입력된 도시이름 배열을 순서대로 처리할 때, "총 실행시간"을 출력한다.
 조건
 캐시 교체 알고리즘은 LRU(Least Recently Used)를 사용한다.
 cache hit일 경우 실행시간은 1이다.
 cache miss일 경우 실행시간은 5이다.
*/
func solution9(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 {
        return cities.count*5
    }
    var cacheList:[String] = []
    var result:Int = 0
    for city in cities {
        if cacheList.contains(city.lowercased()) {
            result += 1
            cacheList.remove(at: cacheList.firstIndex(of: city.lowercased())!)
            cacheList.append(city.lowercased())
        } else {
            result += 5
            if cacheList.count < cacheSize {
                cacheList.append(city.lowercased())
            } else {
                cacheList.append(city.lowercased())
                cacheList.removeFirst()
            }
        }
    }
    return result
}

solution9(2, ["Jeju", "Pangyo", "NewYork", "newyork"]) // 16

/* [1차] 프렌즈4블록

 - 프렌즈4블록
 블라인드 공채를 통과한 신입 사원 라이언은 신규 게임 개발 업무를 맡게 되었다. 이번에 출시할 게임 제목은 "프렌즈4블록".
 같은 모양의 카카오프렌즈 블록이 2×2 형태로 4개가 붙어있을 경우 사라지면서 점수를 얻는 게임이다.
 
 만약 판이 위와 같이 주어질 경우, 라이언이 2×2로 배치된 7개 블록과 콘이 2×2로 배치된 4개 블록이 지워진다. 같은 블록은 여러 2×2에 포함될 수 있으며, 지워지는 조건에 만족하는 2×2 모양이 여러 개 있다면 한꺼번에 지워진다.
 
 블록이 지워진 후에 위에 있는 블록이 아래로 떨어져 빈 공간을 채우게 된다.

 만약 빈 공간을 채운 후에 다시 2×2 형태로 같은 모양의 블록이 모이면 다시 지워지고 떨어지고를 반복하게 된다.
 
 위 초기 배치를 문자로 표시하면 아래와 같다.

 TTTANT
 RRFACC
 RRRFCC
 TRRRAA
 TTMMMF
 TMMTTJ
 각 문자는 라이언(R), 무지(M), 어피치(A), 프로도(F), 네오(N), 튜브(T), 제이지(J), 콘(C)을 의미한다

 입력으로 블록의 첫 배치가 주어졌을 때, 지워지는 블록은 모두 몇 개인지 판단하는 프로그램을 제작하라.

 입력 형식
 입력으로 판의 높이 m, 폭 n과 판의 배치 정보 board가 들어온다.
 2 ≦ n, m ≦ 30
 board는 길이 n인 문자열 m개의 배열로 주어진다. 블록을 나타내는 문자는 대문자 A에서 Z가 사용된다.
 출력 형식
 입력으로 주어진 판 정보를 가지고 몇 개의 블록이 지워질지 출력하라.
*/
func solution8(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var b:[[Character]] = board.map{ Array($0) }
    var result:Int = 0
    while true {
        var list:Set<[Int]> = Set<[Int]>()
        for i in 0...b.count-2 {
            for j in 0...b[i].count-2 {
                if b[i][j] != Character("0") && b[i][j] == b[i][j+1] && b[i][j] == b[i+1][j] && b[i][j] == b[i+1][j+1] {
                    list.insert([i,j])
                    list.insert([i,j+1])
                    list.insert([i+1,j])
                    list.insert([i+1,j+1])
                }
            }
        }
        if list.count == 0 {
            break
        }
        result += list.count
        var sorted = list.sorted{
            if $0[0] < $1[0] {
                return true
            } else if $0[0] == $1[0] {
                if $0[1] < $1[1] {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        for value in sorted {
            var upValue:[Character] = []
            if value[0] > 0 {
                for i in 0...value[0]-1 {
                    if b[i][value[1]] != Character("0") {
                        upValue.append(b[i][value[1]])
                        b[i][value[1]] = "0"
                    }
                }
                if upValue.count == 0 {
                    b[value[0]][value[1]] = "0"
                } else {
                    for i in 0...upValue.count-1 {
                        b[value[0]-i][value[1]] = upValue[upValue.count-1-i]
                    }
                }
            } else {
                b[value[0]][value[1]] = "0"
            }
        }
    }
    return result
}

solution8(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]) // 14

/* [1차] 뉴스 클러스터링

 - 뉴스 클러스터링
 여러 언론사에서 쏟아지는 뉴스, 특히 속보성 뉴스를 보면 비슷비슷한 제목의 기사가 많아 정작 필요한 기사를 찾기가 어렵다. Daum 뉴스의 개발 업무를 맡게 된 신입사원 튜브는 사용자들이 편리하게 다양한 뉴스를 찾아볼 수 있도록 문제점을 개선하는 업무를 맡게 되었다.

 개발의 방향을 잡기 위해 튜브는 우선 최근 화제가 되고 있는 "카카오 신입 개발자 공채" 관련 기사를 검색해보았다.

 카카오 첫 공채..'블라인드' 방식 채용
 카카오, 합병 후 첫 공채.. 블라인드 전형으로 개발자 채용
 카카오, 블라인드 전형으로 신입 개발자 공채
 카카오 공채, 신입 개발자 코딩 능력만 본다
 카카오, 신입 공채.. "코딩 실력만 본다"
 카카오 "코딩 능력만으로 2018 신입 개발자 뽑는다"
 기사의 제목을 기준으로 "블라인드 전형"에 주목하는 기사와 "코딩 테스트"에 주목하는 기사로 나뉘는 걸 발견했다. 튜브는 이들을 각각 묶어서 보여주면 카카오 공채 관련 기사를 찾아보는 사용자에게 유용할 듯싶었다.

 유사한 기사를 묶는 기준을 정하기 위해서 논문과 자료를 조사하던 튜브는 "자카드 유사도"라는 방법을 찾아냈다.

 자카드 유사도는 집합 간의 유사도를 검사하는 여러 방법 중의 하나로 알려져 있다. 두 집합 A, B 사이의 자카드 유사도 J(A, B)는 두 집합의 교집합 크기를 두 집합의 합집합 크기로 나눈 값으로 정의된다.

 예를 들어 집합 A = {1, 2, 3}, 집합 B = {2, 3, 4}라고 할 때, 교집합 A ∩ B = {2, 3}, 합집합 A ∪ B = {1, 2, 3, 4}이 되므로, 집합 A, B 사이의 자카드 유사도 J(A, B) = 2/4 = 0.5가 된다. 집합 A와 집합 B가 모두 공집합일 경우에는 나눗셈이 정의되지 않으니 따로 J(A, B) = 1로 정의한다.

 자카드 유사도는 원소의 중복을 허용하는 다중집합에 대해서 확장할 수 있다. 다중집합 A는 원소 "1"을 3개 가지고 있고, 다중집합 B는 원소 "1"을 5개 가지고 있다고 하자. 이 다중집합의 교집합 A ∩ B는 원소 "1"을 min(3, 5)인 3개, 합집합 A ∪ B는 원소 "1"을 max(3, 5)인 5개 가지게 된다. 다중집합 A = {1, 1, 2, 2, 3}, 다중집합 B = {1, 2, 2, 4, 5}라고 하면, 교집합 A ∩ B = {1, 2, 2}, 합집합 A ∪ B = {1, 1, 2, 2, 3, 4, 5}가 되므로, 자카드 유사도 J(A, B) = 3/7, 약 0.42가 된다.

 이를 이용하여 문자열 사이의 유사도를 계산하는데 이용할 수 있다. 문자열 "FRANCE"와 "FRENCH"가 주어졌을 때, 이를 두 글자씩 끊어서 다중집합을 만들 수 있다. 각각 {FR, RA, AN, NC, CE}, {FR, RE, EN, NC, CH}가 되며, 교집합은 {FR, NC}, 합집합은 {FR, RA, AN, NC, CE, RE, EN, CH}가 되므로, 두 문자열 사이의 자카드 유사도 J("FRANCE", "FRENCH") = 2/8 = 0.25가 된다.

 입력 형식
 입력으로는 str1과 str2의 두 문자열이 들어온다. 각 문자열의 길이는 2 이상, 1,000 이하이다.
 입력으로 들어온 문자열은 두 글자씩 끊어서 다중집합의 원소로 만든다. 이때 영문자로 된 글자 쌍만 유효하고, 기타 공백이나 숫자, 특수 문자가 들어있는 경우는 그 글자 쌍을 버린다. 예를 들어 "ab+"가 입력으로 들어오면, "ab"만 다중집합의 원소로 삼고, "b+"는 버린다.
 다중집합 원소 사이를 비교할 때, 대문자와 소문자의 차이는 무시한다. "AB"와 "Ab", "ab"는 같은 원소로 취급한다.
 출력 형식
 입력으로 들어온 두 문자열의 자카드 유사도를 출력한다. 유사도 값은 0에서 1 사이의 실수이므로, 이를 다루기 쉽도록 65536을 곱한 후에 소수점 아래를 버리고 정수부만 출력한다.
*/
func solution7(_ str1:String, _ str2:String) -> Int {
    if str1 == "" && str2 == "" {
        return 65536
    }
    var s1:[Character] = Array(str1.lowercased())
    var s2:[Character] = Array(str2.lowercased())
    var list1:[String] = []
    var list2:[String] = []
    for i in 0...s1.count-2 {
        if (s1[i].asciiValue ?? 0) > 96 && (s1[i].asciiValue ?? 0) < 123 &&
            (s1[i+1].asciiValue ?? 0) > 96 && (s1[i+1].asciiValue ?? 0) < 123 {
            list1.append(String(s1[i...i+1]))
        }
    }
    for i in 0...s2.count-2 {
        if (s2[i].asciiValue ?? 0) > 96 && (s2[i].asciiValue ?? 0) < 123 &&
            (s2[i+1].asciiValue ?? 0) > 96 && (s2[i+1].asciiValue ?? 0) < 123 {
            list2.append(String(s2[i...i+1]))
        }
    }
    var list4 = list2
    var list3 = list1.filter {
        if list4.contains($0) {
            list4.remove(at: list4.firstIndex(of: $0)!)
            return true
        } else {
            return false
        }
    }
    if (list1.count+list2.count-list3.count == 0) {
        return 65536
    }
    var result:Int = 65536*(list3.count)/(list1.count+list2.count-list3.count)
    return result
}

solution7("di mi mi mi mi","di di di go")
solution7("E=M*C^2","e=m*c^2")
solution7("FRANCE","french")
solution7("handshake", "shake hands") // 65536
solution7("aa1+aa2", "AAAA12") // 43690

/* 예상 대진표

 - △△ 게임대회가 개최되었습니다. 이 대회는 N명이 참가하고, 토너먼트 형식으로 진행됩니다. N명의 참가자는 각각 1부터 N번을 차례대로 배정받습니다. 그리고, 1번↔2번, 3번↔4번, ... , N-1번↔N번의 참가자끼리 게임을 진행합니다. 각 게임에서 이긴 사람은 다음 라운드에 진출할 수 있습니다. 이때, 다음 라운드에 진출할 참가자의 번호는 다시 1번부터 N/2번을 차례대로 배정받습니다. 만약 1번↔2번 끼리 겨루는 게임에서 2번이 승리했다면 다음 라운드에서 1번을 부여받고, 3번↔4번에서 겨루는 게임에서 3번이 승리했다면 다음 라운드에서 2번을 부여받게 됩니다. 게임은 최종 한 명이 남을 때까지 진행됩니다.
 
 이때, 처음 라운드에서 A번을 가진 참가자는 경쟁자로 생각하는 B번 참가자와 몇 번째 라운드에서 만나는지 궁금해졌습니다. 게임 참가자 수 N, 참가자 번호 A, 경쟁자 번호 B가 함수 solution의 매개변수로 주어질 때, 처음 라운드에서 A번을 가진 참가자는 경쟁자로 생각하는 B번 참가자와 몇 번째 라운드에서 만나는지 return 하는 solution 함수를 완성해 주세요. 단, A번 참가자와 B번 참가자는 서로 붙게 되기 전까지 항상 이긴다고 가정합니다.

 제한사항
 N : 21 이상 220 이하인 자연수 (2의 지수 승으로 주어지므로 부전승은 발생하지 않습니다.)
 A, B : N 이하인 자연수 (단, A ≠ B 입니다.)
*/
func solution6(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var result:Int = 1
    var aLevel:Int = a
    var bLevel:Int = b
    while aLevel != bLevel {
        aLevel = aLevel%2 == 0 ? aLevel/2 : (aLevel+1)/2
        bLevel = bLevel%2 == 0 ? bLevel/2 : (bLevel+1)/2
        result += 1
    }
    return result
}

/* 영어 끝말잇기

 - 1부터 n까지 번호가 붙어있는 n명의 사람이 영어 끝말잇기를 하고 있습니다. 영어 끝말잇기는 다음과 같은 규칙으로 진행됩니다.
 
 1번부터 번호 순서대로 한 사람씩 차례대로 단어를 말합니다.
 마지막 사람이 단어를 말한 다음에는 다시 1번부터 시작합니다.
 앞사람이 말한 단어의 마지막 문자로 시작하는 단어를 말해야 합니다.
 이전에 등장했던 단어는 사용할 수 없습니다.
 한 글자인 단어는 인정되지 않습니다.
 다음은 3명이 끝말잇기를 하는 상황을 나타냅니다.

 tank → kick → know → wheel → land → dream → mother → robot → tank

 위 끝말잇기는 다음과 같이 진행됩니다.

 1번 사람이 자신의 첫 번째 차례에 tank를 말합니다.
 2번 사람이 자신의 첫 번째 차례에 kick을 말합니다.
 3번 사람이 자신의 첫 번째 차례에 know를 말합니다.
 1번 사람이 자신의 두 번째 차례에 wheel을 말합니다.
 (계속 진행)
 끝말잇기를 계속 진행해 나가다 보면, 3번 사람이 자신의 세 번째 차례에 말한 tank 라는 단어는 이전에 등장했던 단어이므로 탈락하게 됩니다.

 사람의 수 n과 사람들이 순서대로 말한 단어 words 가 매개변수로 주어질 때, 가장 먼저 탈락하는 사람의 번호와 그 사람이 자신의 몇 번째 차례에 탈락하는지를 구해서 return 하도록 solution 함수를 완성해주세요.

 제한 사항
 끝말잇기에 참여하는 사람의 수 n은 2 이상 10 이하의 자연수입니다.
 words는 끝말잇기에 사용한 단어들이 순서대로 들어있는 배열이며, 길이는 n 이상 100 이하입니다.
 단어의 길이는 2 이상 50 이하입니다.
 모든 단어는 알파벳 소문자로만 이루어져 있습니다.
 끝말잇기에 사용되는 단어의 뜻(의미)은 신경 쓰지 않으셔도 됩니다.
 정답은 [ 번호, 차례 ] 형태로 return 해주세요.
 만약 주어진 단어들로 탈락자가 생기지 않는다면, [0, 0]을 return 해주세요.
*/
func solution5(_ n:Int, _ words:[String]) -> [Int] {
    var index:Int = 0
    var lastChar:Character = Array(words[0])[words[0].count-1]
    var list:[String] = [words[0]]
    for i in 1...words.count-1 {
        if Array(words[i])[0] == lastChar && !list.contains(words[i]) {
            lastChar = Array(words[i])[words[i].count-1]
            list.append(words[i])
        } else {
            index = i
            break
        }
    }
                        
    var result:[Int] = []
    
    if index == 0 {
        result = [0,0]
    } else if (index+1)%n == 0 {
        result = [n, (index+1)/n]
    } else {
        result = [(index+1)%n, ((index+1)/n)+1]
    }

    return result
}

solution5(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]) // [3,3]

/* 점프와 순간 이동

 - OO 연구소는 한 번에 K 칸을 앞으로 점프하거나, (현재까지 온 거리) x 2 에 해당하는 위치로 순간이동을 할 수 있는 특수한 기능을 가진 아이언 슈트를 개발하여 판매하고 있습니다. 이 아이언 슈트는 건전지로 작동되는데, 순간이동을 하면 건전지 사용량이 줄지 않지만, 앞으로 K 칸을 점프하면 K 만큼의 건전지 사용량이 듭니다. 그러므로 아이언 슈트를 착용하고 이동할 때는 순간 이동을 하는 것이 더 효율적입니다. 아이언 슈트 구매자는 아이언 슈트를 착용하고 거리가 N 만큼 떨어져 있는 장소로 가려고 합니다. 단, 건전지 사용량을 줄이기 위해 점프로 이동하는 것은 최소로 하려고 합니다. 아이언 슈트 구매자가 이동하려는 거리 N이 주어졌을 때, 사용해야 하는 건전지 사용량의 최솟값을 return하는 solution 함수를 만들어 주세요.
 
 예를 들어 거리가 5만큼 떨어져 있는 장소로 가려고 합니다.
 아이언 슈트를 입고 거리가 5만큼 떨어져 있는 장소로 갈 수 있는 경우의 수는 여러 가지입니다.

 처음 위치 0 에서 5 칸을 앞으로 점프하면 바로 도착하지만, 건전지 사용량이 5 만큼 듭니다.
 처음 위치 0 에서 2 칸을 앞으로 점프한 다음 순간이동 하면 (현재까지 온 거리 : 2) x 2에 해당하는 위치로 이동할 수 있으므로 위치 4로 이동합니다. 이때 1 칸을 앞으로 점프하면 도착하므로 건전지 사용량이 3 만큼 듭니다.
 처음 위치 0 에서 1 칸을 앞으로 점프한 다음 순간이동 하면 (현재까지 온 거리 : 1) x 2에 해당하는 위치로 이동할 수 있으므로 위치 2로 이동됩니다. 이때 다시 순간이동 하면 (현재까지 온 거리 : 2) x 2 만큼 이동할 수 있으므로 위치 4로 이동합니다. 이때 1 칸을 앞으로 점프하면 도착하므로 건전지 사용량이 2 만큼 듭니다.
 위의 3가지 경우 거리가 5만큼 떨어져 있는 장소로 가기 위해서 3번째 경우가 건전지 사용량이 가장 적으므로 답은 2가 됩니다.

 제한 사항
 숫자 N: 1 이상 10억 이하의 자연수
 숫자 K: 1 이상의 자연수
*/
func solution4(_ n:Int) -> Int {
    var result:Int = 0
    var value = n
    while value > 1 {
        if value%2 == 1 {
            result += 1
        }
        value /= 2
    }
    result += 1
    return result
}

/* 배달

 - N개의 마을로 이루어진 나라가 있습니다. 이 나라의 각 마을에는 1부터 N까지의 번호가 각각 하나씩 부여되어 있습니다. 각 마을은 양방향으로 통행할 수 있는 도로로 연결되어 있는데, 서로 다른 마을 간에 이동할 때는 이 도로를 지나야 합니다. 도로를 지날 때 걸리는 시간은 도로별로 다릅니다. 현재 1번 마을에 있는 음식점에서 각 마을로 음식 배달을 하려고 합니다. 각 마을로부터 음식 주문을 받으려고 하는데, N개의 마을 중에서 K 시간 이하로 배달이 가능한 마을에서만 주문을 받으려고 합니다. 다음은 N = 5, K = 3인 경우의 예시입니다.
 
 위 그림에서 1번 마을에 있는 음식점은 [1, 2, 4, 5] 번 마을까지는 3 이하의 시간에 배달할 수 있습니다. 그러나 3번 마을까지는 3시간 이내로 배달할 수 있는 경로가 없으므로 3번 마을에서는 주문을 받지 않습니다. 따라서 1번 마을에 있는 음식점이 배달 주문을 받을 수 있는 마을은 4개가 됩니다.
 마을의 개수 N, 각 마을을 연결하는 도로의 정보 road, 음식 배달이 가능한 시간 K가 매개변수로 주어질 때, 음식 주문을 받을 수 있는 마을의 개수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 마을의 개수 N은 1 이상 50 이하의 자연수입니다.
 road의 길이(도로 정보의 개수)는 1 이상 2,000 이하입니다.
 road의 각 원소는 마을을 연결하고 있는 각 도로의 정보를 나타냅니다.
 road는 길이가 3인 배열이며, 순서대로 (a, b, c)를 나타냅니다.
 a, b(1 ≤ a, b ≤ N, a != b)는 도로가 연결하는 두 마을의 번호이며, c(1 ≤ c ≤ 10,000, c는 자연수)는 도로를 지나는데 걸리는 시간입니다.
 두 마을 a, b를 연결하는 도로는 여러 개가 있을 수 있습니다.
 한 도로의 정보가 여러 번 중복해서 주어지지 않습니다.
 K는 음식 배달이 가능한 시간을 나타내며, 1 이상 500,000 이하입니다.
 임의의 두 마을간에 항상 이동 가능한 경로가 존재합니다.
 1번 마을에 있는 음식점이 K 이하의 시간에 배달이 가능한 마을의 개수를 return 하면 됩니다.
*/
// TODO
func solution3(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    return answer
}

/* 짝지어 제거하기

 - 짝지어 제거하기는, 알파벳 소문자로 이루어진 문자열을 가지고 시작합니다. 먼저 문자열에서 같은 알파벳이 2개 붙어 있는 짝을 찾습니다. 그다음, 그 둘을 제거한 뒤, 앞뒤로 문자열을 이어 붙입니다. 이 과정을 반복해서 문자열을 모두 제거한다면 짝지어 제거하기가 종료됩니다. 문자열 S가 주어졌을 때, 짝지어 제거하기를 성공적으로 수행할 수 있는지 반환하는 함수를 완성해 주세요. 성공적으로 수행할 수 있으면 1을, 아닐 경우 0을 리턴해주면 됩니다.
 
 예를 들어, 문자열 S = baabaa 라면

 b aa baa → bb aa → aa →

 의 순서로 문자열을 모두 제거할 수 있으므로 1을 반환합니다.

 제한사항
 문자열의 길이 : 1,000,000이하의 자연수
 문자열은 모두 소문자로 이루어져 있습니다.
*/
func solution2(_ s:String) -> Int {
    if s.count%2 != 0 {
        return 0
    }
    var sList:[Character] = Array(s)
    var list:[Character] = [ sList[0] ]
    for i in 1...sList.count-1 {
        if list.count == 0 || sList[i] != list[list.count-1] {
            list.append(sList[i])
        } else {
            list.remove(at: list.count-1)
        }
    }
    return list.count == 0 ? 1 : 0
}

/* N개의 최소공배수

 - 두 수의 최소공배수(Least Common Multiple)란 입력된 두 수의 배수 중 공통이 되는 가장 작은 숫자를 의미합니다. 예를 들어 2와 7의 최소공배수는 14가 됩니다. 정의를 확장해서, n개의 수의 최소공배수는 n 개의 수들의 배수 중 공통이 되는 가장 작은 숫자가 됩니다. n개의 숫자를 담은 배열 arr이 입력되었을 때 이 수들의 최소공배수를 반환하는 함수, solution을 완성해 주세요.
 
 제한 사항
 arr은 길이 1이상, 15이하인 배열입니다.
 arr의 원소는 100 이하인 자연수입니다.
*/
// 최대공약수
func gcd(_ a: Int, _ b: Int) -> Int{
    if (b == 0) { return a }
    return gcd(b, a % b)
}

// 최소공배수
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution11(_ arr:[Int]) -> Int {
    var result:Int = arr[0]
    for i in 1...arr.count-1 {
        result = lcm(result,arr[i])
    }
    return result
}

func solution1(_ arr:[Int]) -> Int {
    var sorted:[Int] = arr.sorted(by: >)
    var result:Int = sorted[0]
    
    for i in 1...sorted.count-1 {
        if result%sorted[i] > 0 {
            result = lcm(result,sorted[i])
        }
    }
    return result
}

solution1([2,6,8,14])
