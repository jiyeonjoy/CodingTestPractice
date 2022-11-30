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

/*

 -
*/

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
