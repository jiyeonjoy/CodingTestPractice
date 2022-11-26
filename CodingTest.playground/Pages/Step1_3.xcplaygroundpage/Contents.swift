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
