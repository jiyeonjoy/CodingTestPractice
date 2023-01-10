import Foundation

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
