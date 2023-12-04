import Foundation

/* 달리기 경주
 
 - 얀에서는 매년 달리기 경주가 열립니다. 해설진들은 선수들이 자기 바로 앞의 선수를 추월할 때 추월한 선수의 이름을 부릅니다. 예를 들어 1등부터 3등까지 "mumu", "soe", "poe" 선수들이 순서대로 달리고 있을 때, 해설진이 "soe"선수를 불렀다면 2등인 "soe" 선수가 1등인 "mumu" 선수를 추월했다는 것입니다. 즉 "soe" 선수가 1등, "mumu" 선수가 2등으로 바뀝니다.
 
 선수들의 이름이 1등부터 현재 등수 순서대로 담긴 문자열 배열 players와 해설진이 부른 이름을 담은 문자열 배열 callings가 매개변수로 주어질 때, 경주가 끝났을 때 선수들의 이름을 1등부터 등수 순서대로 배열에 담아 return 하는 solution 함수를 완성해주세요.
*/
func solution8(_ players:[String], _ callings:[String]) -> [String] {
    var dic1:[Int:String] = [:]
    var dic2:[String:Int] = [:]
    for i in 1...players.count {
        dic1[i] = players[i-1]
        dic2[players[i-1]] = i
    }
    for calling in callings {
        let rank = dic2[calling] ?? 0
        let name = dic1[rank-1] ?? ""
        dic1[rank-1] = calling
        dic1[rank] = name
        dic2[calling] = rank-1
        dic2[name] = rank
    }
    var result:[String] = []
    for i in 1...players.count {
        result.append(dic1[i] ?? "")
    }
    return result
}

solution8(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]) //["mumu", "kai", "mine", "soe", "poe"]

/* 대충 만든 자판

 - 휴대폰의 자판은 컴퓨터 키보드 자판과는 다르게 하나의 키에 여러 개의 문자가 할당될 수 있습니다. 키 하나에 여러 문자가 할당된 경우, 동일한 키를 연속해서 빠르게 누르면 할당된 순서대로 문자가 바뀝니다.
 
 예를 들어, 1번 키에 "A", "B", "C" 순서대로 문자가 할당되어 있다면 1번 키를 한 번 누르면 "A", 두 번 누르면 "B", 세 번 누르면 "C"가 되는 식입니다.

 같은 규칙을 적용해 아무렇게나 만든 휴대폰 자판이 있습니다. 이 휴대폰 자판은 키의 개수가 1개부터 최대 100개까지 있을 수 있으며, 특정 키를 눌렀을 때 입력되는 문자들도 무작위로 배열되어 있습니다. 또, 같은 문자가 자판 전체에 여러 번 할당된 경우도 있고, 키 하나에 같은 문자가 여러 번 할당된 경우도 있습니다. 심지어 아예 할당되지 않은 경우도 있습니다. 따라서 몇몇 문자열은 작성할 수 없을 수도 있습니다.

 이 휴대폰 자판을 이용해 특정 문자열을 작성할 때, 키를 최소 몇 번 눌러야 그 문자열을 작성할 수 있는지 알아보고자 합니다.

 1번 키부터 차례대로 할당된 문자들이 순서대로 담긴 문자열배열 keymap과 입력하려는 문자열들이 담긴 문자열 배열 targets가 주어질 때, 각 문자열을 작성하기 위해 키를 최소 몇 번씩 눌러야 하는지 순서대로 배열에 담아 return 하는 solution 함수를 완성해 주세요.

 단, 목표 문자열을 작성할 수 없을 때는 -1을 저장합니다.
*/
func solution7(_ keymap:[String], _ targets:[String]) -> [Int] {
    var dic:[Character:Int] = [
        "A":-1,
        "B":-1,
        "C":-1,
        "D":-1,
        "E":-1,
        "F":-1,
        "G":-1,
        "H":-1,
        "I":-1,
        "J":-1,
        "K":-1,
        "L":-1,
        "M":-1,
        "N":-1,
        "O":-1,
        "P":-1,
        "Q":-1,
        "R":-1,
        "S":-1,
        "T":-1,
        "U":-1,
        "V":-1,
        "W":-1,
        "X":-1,
        "Y":-1,
        "Z":-1,
    ]
    for d in dic.keys {
        var i = 100
        for s in keymap {
            if let index = s.firstIndex(of: d) {
                let int_index = s.distance(from: s.startIndex, to: index)
                if i > int_index {
                    i = int_index
                }
            }
        }
        if i < 100 {
            dic[d] = i
        }
    }
    var result:[Int] = []
    for t in targets {
        var s = 0
        for c in Array(t) {
            if dic[c] == -1 {
                s = -1
                break
            }
            s += dic[c]!+1
        }
        result.append(s)
    }
    return result
}

solution7(["ABACD", "BCEFD"], ["ABCD","AABB"]) // [9, 4]
solution7(["AA"], ["B"]) // [-1]

/* 카드 뭉치

 - 코니는 영어 단어가 적힌 카드 뭉치 두 개를 선물로 받았습니다. 코니는 다음과 같은 규칙으로 카드에 적힌 단어들을 사용해 원하는 순서의 단어 배열을 만들 수 있는지 알고 싶습니다.
 
 원하는 카드 뭉치에서 카드를 순서대로 한 장씩 사용합니다.
 한 번 사용한 카드는 다시 사용할 수 없습니다.
 카드를 사용하지 않고 다음 카드로 넘어갈 수 없습니다.
 기존에 주어진 카드 뭉치의 단어 순서는 바꿀 수 없습니다.
 예를 들어 첫 번째 카드 뭉치에 순서대로 ["i", "drink", "water"], 두 번째 카드 뭉치에 순서대로 ["want", "to"]가 적혀있을 때 ["i", "want", "to", "drink", "water"] 순서의 단어 배열을 만들려고 한다면 첫 번째 카드 뭉치에서 "i"를 사용한 후 두 번째 카드 뭉치에서 "want"와 "to"를 사용하고 첫 번째 카드뭉치에 "drink"와 "water"를 차례대로 사용하면 원하는 순서의 단어 배열을 만들 수 있습니다.

 문자열로 이루어진 배열 cards1, cards2와 원하는 단어 배열 goal이 매개변수로 주어질 때, cards1과 cards2에 적힌 단어들로 goal를 만들 있다면 "Yes"를, 만들 수 없다면 "No"를 return하는 solution 함수를 완성해주세요.
*/
func solution6(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var a = 0
    var b = 0
    var isYes = true
    for str in goal {
        if a < cards1.count && str == cards1[a] {
            a += 1
        } else if b < cards2.count && str == cards2[b] {
            b += 1
        } else {
            isYes = false
            break
        }
    }
    return isYes ? "Yes" : "No"
}

solution6(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"]) // Yes
solution6(["i", "water", "drink"], ["want", "to"], ["i", "want", "to", "drink", "water"]) // No

/* 둘만의 암호

 - 두 문자열 s와 skip, 그리고 자연수 index가 주어질 때, 다음 규칙에 따라 문자열을 만들려 합니다. 암호의 규칙은 다음과 같습니다.
 
 문자열 s의 각 알파벳을 index만큼 뒤의 알파벳으로 바꿔줍니다.
 index만큼의 뒤의 알파벳이 z를 넘어갈 경우 다시 a로 돌아갑니다.
 skip에 있는 알파벳은 제외하고 건너뜁니다.
 예를 들어 s = "aukks", skip = "wbqd", index = 5일 때, a에서 5만큼 뒤에 있는 알파벳은 f지만 [b, c, d, e, f]에서 'b'와 'd'는 skip에 포함되므로 세지 않습니다. 따라서 'b', 'd'를 제외하고 'a'에서 5만큼 뒤에 있는 알파벳은 [c, e, f, g, h] 순서에 의해 'h'가 됩니다. 나머지 "ukks" 또한 위 규칙대로 바꾸면 "appy"가 되며 결과는 "happy"가 됩니다.

 두 문자열 s와 skip, 그리고 자연수 index가 매개변수로 주어질 때 위 규칙대로 s를 변환한 결과를 return하도록 solution 함수를 완성해주세요.
*/
func solution5(_ s:String, _ skip:String, _ index:Int) -> String {
    var alphabet = "abcdefghijklmnopqrstuvwxyz"
    skip.forEach{
        alphabet.remove(at: alphabet.firstIndex(of: $0)! )
    }
   
    var map:[Character:Character] = [:]
    alphabet.forEach {
        let int_index = alphabet.distance(from: alphabet.startIndex, to: alphabet.firstIndex(of: $0)!)
        let i = (int_index + index)%alphabet.count
        map[$0] = Array(alphabet)[i]
    }
    var result = ""
    s.forEach{
        result.write(String(map[$0]!))
    }
    return result
}

solution5("aukks", "wbqd", 5) // happy

/* 개인정보 수집 유효기간

 - 고객의 약관 동의를 얻어서 수집된 1~n번으로 분류되는 개인정보 n개가 있습니다. 약관 종류는 여러 가지 있으며 각 약관마다 개인정보 보관 유효기간이 정해져 있습니다. 당신은 각 개인정보가 어떤 약관으로 수집됐는지 알고 있습니다. 수집된 개인정보는 유효기간 전까지만 보관 가능하며, 유효기간이 지났다면 반드시 파기해야 합니다.
 
 예를 들어, A라는 약관의 유효기간이 12 달이고, 2021년 1월 5일에 수집된 개인정보가 A약관으로 수집되었다면 해당 개인정보는 2022년 1월 4일까지 보관 가능하며 2022년 1월 5일부터 파기해야 할 개인정보입니다.
 당신은 오늘 날짜로 파기해야 할 개인정보 번호들을 구하려 합니다.

 모든 달은 28일까지 있다고 가정합니다.

 오늘 날짜를 의미하는 문자열 today, 약관의 유효기간을 담은 1차원 문자열 배열 terms와 수집된 개인정보의 정보를 담은 1차원 문자열 배열 privacies가 매개변수로 주어집니다. 이때 파기해야 할 개인정보의 번호를 오름차순으로 1차원 정수 배열에 담아 return 하도록 solution 함수를 완성해 주세요.
*/
func solution4(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let list = today.split(separator: ".").map{ Int(String($0))! }
    let y = list[0]
    let m = list[1]
    let d = list[2]
    
    var dic:[String:Int] = [:]
    
    terms.forEach {
        let l = $0.split(separator: " ")
        dic[String(l[0])] = Int(String(l[1]))!
    }
    var result:[Int] = []
    
    for i in 0...privacies.count-1 {
        let list = privacies[i].split(separator: " ").map{ String($0) }
        let pl = list[0].split(separator: ".").map{ Int(String($0))! }
        var py = pl[0]
        var pm = pl[1]
        let pd = pl[2]
        
        pm += dic[list[1]]!
        py += (pm-1)/12
        pm = pm%12 == 0 ? 12 : pm%12
        
        if py < y {
            result.append(i+1)
        } else if py == y {
            if pm < m {
                result.append(i+1)
            } else if pm == m {
                if pd <= d {
                    result.append(i+1)
                }
            }
        }
    }
    
    return result
}

solution4("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"])

/* 크기가 작은 부분문자열

 - 숫자로 이루어진 문자열 t와 p가 주어질 때, t에서 p와 길이가 같은 부분문자열 중에서, 이 부분문자열이 나타내는 수가 p가 나타내는 수보다 작거나 같은 것이 나오는 횟수를 return하는 함수 solution을 완성하세요.
 
 예를 들어, t="3141592"이고 p="271" 인 경우, t의 길이가 3인 부분 문자열은 314, 141, 415, 159, 592입니다. 이 문자열이 나타내는 수 중 271보다 작거나 같은 수는 141, 159 2개 입니다.

 제한사항
 1 ≤ p의 길이 ≤ 18
 p의 길이 ≤ t의 길이 ≤ 10,000
 t와 p는 숫자로만 이루어진 문자열이며, 0으로 시작하지 않습니다.
*/
func solution3(_ t:String, _ p:String) -> Int {
    var result:Int = 0
    for i in 0...t.count-p.count {
        if (Int(String(Array(t)[i..<i+p.count])) ?? 0) <= (Int(p) ?? 0) {
            result += 1
        }
    }
    return result
}

solution3("3141592", "271")

/* 가장 가까운 같은 글자

 - 문자열 s가 주어졌을 때, s의 각 위치마다 자신보다 앞에 나왔으면서, 자신과 가장 가까운 곳에 있는 같은 글자가 어디 있는지 알고 싶습니다.
 예를 들어, s="banana"라고 할 때,  각 글자들을 왼쪽부터 오른쪽으로 읽어 나가면서 다음과 같이 진행할 수 있습니다.

 b는 처음 나왔기 때문에 자신의 앞에 같은 글자가 없습니다. 이는 -1로 표현합니다.
 a는 처음 나왔기 때문에 자신의 앞에 같은 글자가 없습니다. 이는 -1로 표현합니다.
 n은 처음 나왔기 때문에 자신의 앞에 같은 글자가 없습니다. 이는 -1로 표현합니다.
 a는 자신보다 두 칸 앞에 a가 있습니다. 이는 2로 표현합니다.
 n도 자신보다 두 칸 앞에 n이 있습니다. 이는 2로 표현합니다.
 a는 자신보다 두 칸, 네 칸 앞에 a가 있습니다. 이 중 가까운 것은 두 칸 앞이고, 이는 2로 표현합니다.
 따라서 최종 결과물은 [-1, -1, -1, 2, 2, 2]가 됩니다.

 문자열 s이 주어질 때, 위와 같이 정의된 연산을 수행하는 함수 solution을 완성해주세요.

 제한사항
 1 ≤ s의 길이 ≤ 10,000
 s은 영어 소문자로만 이루어져 있습니다.
*/
func solution2(_ s:String) -> [Int] {
    var list:[Character] = Array(s)
    var dic:[Character: Int] = [:]
    var result:[Int] = []
    
    for i in 0...list.count-1 {
        if dic[list[i]] == nil {
            result.append(-1)
        } else {
            result.append(i-(dic[list[i]] ?? 0))
        }
        dic[list[i]] = i
    }
    return result
}

solution2("banana")

/* 문자열 나누기

 - 문자열 s가 입력되었을 때 다음 규칙을 따라서 이 문자열을 여러 문자열로 분해하려고 합니다.
 
 먼저 첫 글자를 읽습니다. 이 글자를 x라고 합시다.
 이제 이 문자열을 왼쪽에서 오른쪽으로 읽어나가면서, x와 x가 아닌 다른 글자들이 나온 횟수를 각각 셉니다. 처음으로 두 횟수가 같아지는 순간 멈추고, 지금까지 읽은 문자열을 분리합니다.
 s에서 분리한 문자열을 빼고 남은 부분에 대해서 이 과정을 반복합니다. 남은 부분이 없다면 종료합니다.
 만약 두 횟수가 다른 상태에서 더 이상 읽을 글자가 없다면, 역시 지금까지 읽은 문자열을 분리하고, 종료합니다.
 문자열 s가 매개변수로 주어질 때, 위 과정과 같이 문자열들로 분해하고, 분해한 문자열의 개수를 return 하는 함수 solution을 완성하세요.

 제한사항
 1 ≤ s의 길이 ≤ 10,000
 s는 영어 소문자로만 이루어져 있습니다.
*/
func solution1(_ s:String) -> Int {
    var x: Character = "0"
    var xCount = 0
    var otherCount = 0
    var result:Int = 0
    for c in s {
        if x == "0" {
            x = c
            xCount += 1
            result += 1
        } else if c == x {
            xCount += 1
        } else {
            otherCount += 1
        }
        if xCount == otherCount {
            x = "0"
            xCount = 0
            otherCount = 0
        }
    }
    return result
}

solution1("banana")
