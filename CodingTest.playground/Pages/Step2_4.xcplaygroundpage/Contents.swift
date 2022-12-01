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

solution3("I")
solution3("EIO")
solution3("AAAAE")

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
// TODO
func solution1(_ numbers:[Int64]) -> [Int64] {
    return []
}
