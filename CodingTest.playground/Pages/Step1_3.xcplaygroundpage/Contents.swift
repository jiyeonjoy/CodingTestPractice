import Foundation

/*
 
 - 
*/

/*
 
 -
*/

/*
 
 -
*/

/*
 
 -
*/

/*
 
 -
*/

/*
 
 -
*/

/*
 
 -
*/

/*
 
 -
*/

/*
 
 -
*/

/*
 
 -
*/

/*
 
 -
*/

/* 신고 결과 받기
 
 - 신입사원 무지는 게시판 불량 이용자를 신고하고 처리 결과를 메일로 발송하는 시스템을 개발하려 합니다. 무지가 개발하려는 시스템은 다음과 같습니다.
 
 각 유저는 한 번에 한 명의 유저를 신고할 수 있습니다.
 신고 횟수에 제한은 없습니다. 서로 다른 유저를 계속해서 신고할 수 있습니다.
 한 유저를 여러 번 신고할 수도 있지만, 동일한 유저에 대한 신고 횟수는 1회로 처리됩니다.
 k번 이상 신고된 유저는 게시판 이용이 정지되며, 해당 유저를 신고한 모든 유저에게 정지 사실을 메일로 발송합니다.
 유저가 신고한 모든 내용을 취합하여 마지막에 한꺼번에 게시판 이용 정지를 시키면서 정지 메일을 발송합니다.
 다음은 전체 유저 목록이 ["muzi", "frodo", "apeach", "neo"]이고, k = 2(즉, 2번 이상 신고당하면 이용 정지)인 경우의 예시입니다.

 유저 ID    유저가 신고한 ID    설명
 "muzi"    "frodo"    "muzi"가 "frodo"를 신고했습니다.
 "apeach"    "frodo"    "apeach"가 "frodo"를 신고했습니다.
 "frodo"    "neo"    "frodo"가 "neo"를 신고했습니다.
 "muzi"    "neo"    "muzi"가 "neo"를 신고했습니다.
 "apeach"    "muzi"    "apeach"가 "muzi"를 신고했습니다.
 각 유저별로 신고당한 횟수는 다음과 같습니다.

 유저 ID    신고당한 횟수
 "muzi"    1
 "frodo"    2
 "apeach"    0
 "neo"    2
 위 예시에서는 2번 이상 신고당한 "frodo"와 "neo"의 게시판 이용이 정지됩니다. 이때, 각 유저별로 신고한 아이디와 정지된 아이디를 정리하면 다음과 같습니다.

 유저 ID    유저가 신고한 ID    정지된 ID
 "muzi"    ["frodo", "neo"]    ["frodo", "neo"]
 "frodo"    ["neo"]    ["neo"]
 "apeach"    ["muzi", "frodo"]    ["frodo"]
 "neo"    없음    없음
 따라서 "muzi"는 처리 결과 메일을 2회, "frodo"와 "apeach"는 각각 처리 결과 메일을 1회 받게 됩니다.

 이용자의 ID가 담긴 문자열 배열 id_list, 각 이용자가 신고한 이용자의 ID 정보가 담긴 문자열 배열 report, 정지 기준이 되는 신고 횟수 k가 매개변수로 주어질 때, 각 유저별로 처리 결과 메일을 받은 횟수를 배열에 담아 return 하도록 solution 함수를 완성해주세요.

 제한사항
 2 ≤ id_list의 길이 ≤ 1,000
 1 ≤ id_list의 원소 길이 ≤ 10
 id_list의 원소는 이용자의 id를 나타내는 문자열이며 알파벳 소문자로만 이루어져 있습니다.
 id_list에는 같은 아이디가 중복해서 들어있지 않습니다.
 1 ≤ report의 길이 ≤ 200,000
 3 ≤ report의 원소 길이 ≤ 21
 report의 원소는 "이용자id 신고한id"형태의 문자열입니다.
 예를 들어 "muzi frodo"의 경우 "muzi"가 "frodo"를 신고했다는 의미입니다.
 id는 알파벳 소문자로만 이루어져 있습니다.
 이용자id와 신고한id는 공백(스페이스)하나로 구분되어 있습니다.
 자기 자신을 신고하는 경우는 없습니다.
 1 ≤ k ≤ 200, k는 자연수입니다.
 return 하는 배열은 id_list에 담긴 id 순서대로 각 유저가 받은 결과 메일 수를 담으면 됩니다.
*/
func solution10(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var dic:[String:[String]] = [:]
    var dic2:[String:Int] = [:]
    for data in report {
        var list = data.components(separatedBy: " ")
        if dic[list[0]] == nil {
            dic[list[0]] = [list[1]]
            if dic2[list[1]] == nil {
                dic2[list[1]] = 1
            } else {
                var count = dic2[list[1]]! + 1
                dic2[list[1]] = count
            }
        } else {
            var reportId = dic[list[0]] ?? []
            if !reportId.contains(list[1]) {
                reportId.append(list[1])
                dic[list[0]] = reportId
                if dic2[list[1]] == nil {
                    dic2[list[1]] = 1
                } else {
                    var count = dic2[list[1]]! + 1
                    dic2[list[1]] = count
                }
            }
        }
    }
    var countDic = dic2.filter{ $0.value >= k }
    return id_list.map {
        if dic[$0] == nil {
            return 0
        }
        var count = 0
        for i in dic[$0] ?? [] {
            if countDic[i] != nil {
                count += 1
            }
        }
        return count
    }
}

solution10(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","frodo neo","muzi neo","apeach muzi"], 2)

/* 나머지가 1이 되는 수 찾기
 
 - 자연수 n이 매개변수로 주어집니다. n을 x로 나눈 나머지가 1이 되도록 하는 가장 작은 자연수 x를 return 하도록 solution 함수를 완성해주세요. 답이 항상 존재함은 증명될 수 있습니다.
 
 제한사항
 3 ≤ n ≤ 1,000,000
*/
func solution9(_ n:Int) -> Int {
    var result:Int = 0
    for i in 1...n {
        if n%i == 1 {
            result = i
            break
        }
    }
    return result
}

/* 최소직사각형
 
 - 명함 지갑을 만드는 회사에서 지갑의 크기를 정하려고 합니다. 다양한 모양과 크기의 명함들을 모두 수납할 수 있으면서, 작아서 들고 다니기 편한 지갑을 만들어야 합니다. 이러한 요건을 만족하는 지갑을 만들기 위해 디자인팀은 모든 명함의 가로 길이와 세로 길이를 조사했습니다.
 
 아래 표는 4가지 명함의 가로 길이와 세로 길이를 나타냅니다.

 명함 번호    가로 길이    세로 길이
 1    60    50
 2    30    70
 3    60    30
 4    80    40
 가장 긴 가로 길이와 세로 길이가 각각 80, 70이기 때문에 80(가로) x 70(세로) 크기의 지갑을 만들면 모든 명함들을 수납할 수 있습니다. 하지만 2번 명함을 가로로 눕혀 수납한다면 80(가로) x 50(세로) 크기의 지갑으로 모든 명함들을 수납할 수 있습니다. 이때의 지갑 크기는 4000(=80 x 50)입니다.

 모든 명함의 가로 길이와 세로 길이를 나타내는 2차원 배열 sizes가 매개변수로 주어집니다. 모든 명함을 수납할 수 있는 가장 작은 지갑을 만들 때, 지갑의 크기를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 sizes의 길이는 1 이상 10,000 이하입니다.
 sizes의 원소는 [w, h] 형식입니다.
 w는 명함의 가로 길이를 나타냅니다.
 h는 명함의 세로 길이를 나타냅니다.
 w와 h는 1 이상 1,000 이하인 자연수입니다.
*/
func solution8(_ sizes:[[Int]]) -> Int {
    var list = sizes.map{
        $0.sorted()
    }
   
    var maxWidth:Int = list.sorted {
        $0[0] > $1[0]
    }[0][0]
    
    var maxHeight:Int = list.sorted {
        $0[1] > $1[1]
    }[0][1]
    
    return maxWidth * maxHeight
}

solution8([[60, 50], [30, 70], [60, 30], [80, 40]])

/* 없는 숫자 더하기
 
 - 0부터 9까지의 숫자 중 일부가 들어있는 정수 배열 numbers가 매개변수로 주어집니다. numbers에서 찾을 수 없는 0부터 9까지의 숫자를 모두 찾아 더한 수를 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 1 ≤ numbers의 길이 ≤ 9
 0 ≤ numbers의 모든 원소 ≤ 9
 numbers의 모든 원소는 서로 다릅니다.
*/
func solution7(_ numbers:[Int]) -> Int {
    (1...9).filter {
        !numbers.contains($0)
    }.reduce(0,+)
}

/* 부족한 금액 계산하기
 
 - 새로 생긴 놀이기구는 인기가 매우 많아 줄이 끊이질 않습니다. 이 놀이기구의 원래 이용료는 price원 인데, 놀이기구를 N 번 째 이용한다면 원래 이용료의 N배를 받기로 하였습니다. 즉, 처음 이용료가 100이었다면 2번째에는 200, 3번째에는 300으로 요금이 인상됩니다.
 놀이기구를 count번 타게 되면 현재 자신이 가지고 있는 금액에서 얼마가 모자라는지를 return 하도록 solution 함수를 완성하세요.
 단, 금액이 부족하지 않으면 0을 return 하세요.

 제한사항
 놀이기구의 이용료 price : 1 ≤ price ≤ 2,500, price는 자연수
 처음 가지고 있던 금액 money : 1 ≤ money ≤ 1,000,000,000, money는 자연수
 놀이기구의 이용 횟수 count : 1 ≤ count ≤ 2,500, count는 자연수
*/
func solution6(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = Int64(money)
    for i in 1...count {
        answer -= Int64(i*price)
    }
    return answer >= 0 ? 0 : -answer
}

/* 숫자 문자열과 영단어
 
 - 네오와 프로도가 숫자놀이를 하고 있습니다. 네오가 프로도에게 숫자를 건넬 때 일부 자릿수를 영단어로 바꾼 카드를 건네주면 프로도는 원래 숫자를 찾는 게임입니다.
 
 다음은 숫자의 일부 자릿수를 영단어로 바꾸는 예시입니다.

 1478 → "one4seveneight"
 234567 → "23four5six7"
 10203 → "1zerotwozero3"
 이렇게 숫자의 일부 자릿수가 영단어로 바뀌어졌거나, 혹은 바뀌지 않고 그대로인 문자열 s가 매개변수로 주어집니다. s가 의미하는 원래 숫자를 return 하도록 solution 함수를 완성해주세요.

 참고로 각 숫자에 대응되는 영단어는 다음 표와 같습니다.

 숫자    영단어
 0    zero
 1    one
 2    two
 3    three
 4    four
 5    five
 6    six
 7    seven
 8    eight
 9    nine
 제한사항
 1 ≤ s의 길이 ≤ 50
 s가 "zero" 또는 "0"으로 시작하는 경우는 주어지지 않습니다.
 return 값이 1 이상 2,000,000,000 이하의 정수가 되는 올바른 입력만 s로 주어집니다.
*/
func solution5(_ s:String) -> Int {
    let dic:[String:String] = [
        "zero":"0",
        "one":"1",
        "two":"2",
        "three":"3",
        "four":"4",
        "five":"5",
        "six":"6",
        "seven":"7",
        "eight":"8",
        "nine":"9",
    ]
    var result:String = s
    dic.map {
        result = result.replacingOccurrences(of: $0.key, with: $0.value)
    }
    return Int(result) ?? 0
}

/* 약수의 개수와 덧셈
 
 - 두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ left ≤ right ≤ 1,000
*/
func solution4(_ left:Int, _ right:Int) -> Int {
    (left...right).map {
        if sqrt(Double($0)) == Double(Int(sqrt(Double($0)))) {
            return -$0
        } else {
            return $0
        }
    }.reduce(0,+)
}

solution4(13,17)

/* 로또의 최고 순위와 최저 순위
 
 - 로또 6/45(이하 '로또'로 표기)는 1부터 45까지의 숫자 중 6개를 찍어서 맞히는 대표적인 복권입니다. 아래는 로또의 순위를 정하는 방식입니다. 1
 
 순위    당첨 내용
 1    6개 번호가 모두 일치
 2    5개 번호가 일치
 3    4개 번호가 일치
 4    3개 번호가 일치
 5    2개 번호가 일치
 6(낙첨)    그 외
 로또를 구매한 민우는 당첨 번호 발표일을 학수고대하고 있었습니다. 하지만, 민우의 동생이 로또에 낙서를 하여, 일부 번호를 알아볼 수 없게 되었습니다. 당첨 번호 발표 후, 민우는 자신이 구매했던 로또로 당첨이 가능했던 최고 순위와 최저 순위를 알아보고 싶어 졌습니다.
 알아볼 수 없는 번호를 0으로 표기하기로 하고, 민우가 구매한 로또 번호 6개가 44, 1, 0, 0, 31 25라고 가정해보겠습니다. 당첨 번호 6개가 31, 10, 45, 1, 6, 19라면, 당첨 가능한 최고 순위와 최저 순위의 한 예는 아래와 같습니다.

 당첨 번호    31    10    45    1    6    19    결과
 최고 순위 번호    31    0→10    44    1    0→6    25    4개 번호 일치, 3등
 최저 순위 번호    31    0→11    44    1    0→7    25    2개 번호 일치, 5등
 순서와 상관없이, 구매한 로또에 당첨 번호와 일치하는 번호가 있으면 맞힌 걸로 인정됩니다.
 알아볼 수 없는 두 개의 번호를 각각 10, 6이라고 가정하면 3등에 당첨될 수 있습니다.
 3등을 만드는 다른 방법들도 존재합니다. 하지만, 2등 이상으로 만드는 것은 불가능합니다.
 알아볼 수 없는 두 개의 번호를 각각 11, 7이라고 가정하면 5등에 당첨될 수 있습니다.
 5등을 만드는 다른 방법들도 존재합니다. 하지만, 6등(낙첨)으로 만드는 것은 불가능합니다.
 민우가 구매한 로또 번호를 담은 배열 lottos, 당첨 번호를 담은 배열 win_nums가 매개변수로 주어집니다. 이때, 당첨 가능한 최고 순위와 최저 순위를 차례대로 배열에 담아서 return 하도록 solution 함수를 완성해주세요.

 제한사항
 lottos는 길이 6인 정수 배열입니다.
 lottos의 모든 원소는 0 이상 45 이하인 정수입니다.
 0은 알아볼 수 없는 숫자를 의미합니다.
 0을 제외한 다른 숫자들은 lottos에 2개 이상 담겨있지 않습니다.
 lottos의 원소들은 정렬되어 있지 않을 수도 있습니다.
 win_nums은 길이 6인 정수 배열입니다.
 win_nums의 모든 원소는 1 이상 45 이하인 정수입니다.
 win_nums에는 같은 숫자가 2개 이상 담겨있지 않습니다.
 win_nums의 원소들은 정렬되어 있지 않을 수도 있습니다.
*/
func solution3(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var winCount: Int = 0
    var zeroCount: Int = 0
    for num in lottos {
        if num == 0 {
            zeroCount += 1
        } else if win_nums.contains(num) {
            winCount += 1
        }
    }
    return [min(6,7-winCount-zeroCount), min(6,7-winCount)]
}

/* 음양 더하기
 
 - 어떤 정수들이 있습니다. 이 정수들의 절댓값을 차례대로 담은 정수 배열 absolutes와 이 정수들의 부호를 차례대로 담은 불리언 배열 signs가 매개변수로 주어집니다. 실제 정수들의 합을 구하여 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 absolutes의 길이는 1 이상 1,000 이하입니다.
 absolutes의 모든 수는 각각 1 이상 1,000 이하입니다.
 signs의 길이는 absolutes의 길이와 같습니다.
 signs[i] 가 참이면 absolutes[i] 의 실제 정수가 양수임을, 그렇지 않으면 음수임을 의미합니다.
*/
func solution2(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    (0...absolutes.count-1).map {
        if signs[$0] {
            return absolutes[$0]
        } else {
            return -(absolutes[$0])
        }
    }.reduce(0,+)
}

/* 신규 아이디 추천
 
 - 카카오에 입사한 신입 개발자 네오는 "카카오계정개발팀"에 배치되어, 카카오 서비스에 가입하는 유저들의 아이디를 생성하는 업무를 담당하게 되었습니다. "네오"에게 주어진 첫 업무는 새로 가입하는 유저들이 카카오 아이디 규칙에 맞지 않는 아이디를 입력했을 때, 입력된 아이디와 유사하면서 규칙에 맞는 아이디를 추천해주는 프로그램을 개발하는 것입니다.
 다음은 카카오 아이디의 규칙입니다.

 아이디의 길이는 3자 이상 15자 이하여야 합니다.
 아이디는 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.) 문자만 사용할 수 있습니다.
 단, 마침표(.)는 처음과 끝에 사용할 수 없으며 또한 연속으로 사용할 수 없습니다.
 "네오"는 다음과 같이 7단계의 순차적인 처리 과정을 통해 신규 유저가 입력한 아이디가 카카오 아이디 규칙에 맞는 지 검사하고 규칙에 맞지 않은 경우 규칙에 맞는 새로운 아이디를 추천해 주려고 합니다.
 신규 유저가 입력한 아이디가 new_id 라고 한다면,

 1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
 2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
 3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
 4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
 5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
 6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
      만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
 7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
 예를 들어, new_id 값이 "...!@BaT#*..y.abcdefghijklm" 라면, 위 7단계를 거치고 나면 new_id는 아래와 같이 변경됩니다.

 1단계 대문자 'B'와 'T'가 소문자 'b'와 't'로 바뀌었습니다.
 "...!@BaT#*..y.abcdefghijklm" → "...!@bat#*..y.abcdefghijklm"

 2단계 '!', '@', '#', '*' 문자가 제거되었습니다.
 "...!@bat#*..y.abcdefghijklm" → "...bat..y.abcdefghijklm"

 3단계 '...'와 '..' 가 '.'로 바뀌었습니다.
 "...bat..y.abcdefghijklm" → ".bat.y.abcdefghijklm"

 4단계 아이디의 처음에 위치한 '.'가 제거되었습니다.
 ".bat.y.abcdefghijklm" → "bat.y.abcdefghijklm"

 5단계 아이디가 빈 문자열이 아니므로 변화가 없습니다.
 "bat.y.abcdefghijklm" → "bat.y.abcdefghijklm"

 6단계 아이디의 길이가 16자 이상이므로, 처음 15자를 제외한 나머지 문자들이 제거되었습니다.
 "bat.y.abcdefghijklm" → "bat.y.abcdefghi"

 7단계 아이디의 길이가 2자 이하가 아니므로 변화가 없습니다.
 "bat.y.abcdefghi" → "bat.y.abcdefghi"

 따라서 신규 유저가 입력한 new_id가 "...!@BaT#*..y.abcdefghijklm"일 때, 네오의 프로그램이 추천하는 새로운 아이디는 "bat.y.abcdefghi" 입니다.

 [문제]
 신규 유저가 입력한 아이디를 나타내는 new_id가 매개변수로 주어질 때, "네오"가 설계한 7단계의 처리 과정을 거친 후의 추천 아이디를 return 하도록 solution 함수를 완성해 주세요.

 [제한사항]
 new_id는 길이 1 이상 1,000 이하인 문자열입니다.
 new_id는 알파벳 대문자, 알파벳 소문자, 숫자, 특수문자로 구성되어 있습니다.
 new_id에 나타날 수 있는 특수문자는 -_.~!@#$%^&*()=+[{]}:?,<>/ 로 한정됩니다.
*/
func solution1(_ new_id:String) -> String {
    var result:String = new_id.lowercased().filter {
        "abcdefghijklmnopqrstuvwxyz0123456789-_.".contains($0)
    }.components(separatedBy: ".").map{
        if $0 == "" {
            return ""
        } else {
            return "\($0)."
        }
    }.joined()
    
    result = String(result.prefix(15))
    
    if result.last == "." {
        result.removeLast()
    }
    if result == "" {
        result = "a"
    }
    if result.count <= 2 {
        result += String(repeating: result.last!, count: 3-result.count)
    }
    return result
}

solution1("=.=")
solution1("...!@BaT#*..y.abcdefghijklm")
