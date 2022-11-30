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
// TODO
func solution6(_ numbers:[Int], _ target:Int) -> Int {
    var value = (numbers.reduce(0, +)-target)/2
    var result:Int = 0
    
    for i in 0...numbers.count-2 {
        
    }
    return result
}

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
// TODO
func solution3(_ number:String, _ k:Int) -> String {
    String(number.sorted(by: >)[0...number.count-1-k])
}

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
