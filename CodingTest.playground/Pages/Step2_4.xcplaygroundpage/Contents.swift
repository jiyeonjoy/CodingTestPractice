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

/* n^2 배열 자르기

 - 정수 n, left, right가 주어집니다. 다음 과정을 거쳐서 1차원 배열을 만들고자 합니다.
 
 n행 n열 크기의 비어있는 2차원 배열을 만듭니다.
 i = 1, 2, 3, ..., n에 대해서, 다음 과정을 반복합니다.
 1행 1열부터 i행 i열까지의 영역 내의 모든 빈 칸을 숫자 i로 채웁니다.
 1행, 2행, ..., n행을 잘라내어 모두 이어붙인 새로운 1차원 배열을 만듭니다.
 새로운 1차원 배열을 arr이라 할 때, arr[left], arr[left+1], ..., arr[right]만 남기고 나머지는 지웁니다.
 정수 n, left, right가 매개변수로 주어집니다. 주어진 과정대로 만들어진 1차원 배열을 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ n ≤ 107
 0 ≤ left ≤ right < n2
 right - left < 105
*/
func solution7(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var list:[Int] = []
    var count:Int = Int(left)/n*n
    var isDone:Bool = false
    for i in (Int(left)/n)+1...n {
        for j in 1...n {
            count += 1
            if count > left {
                list.append(j < i ? i : j)
                if count > right {
                    isDone = true
                    break
                }
            }
        }
        if isDone {
            break
        }
    }
    return list
}

solution7(4, 7, 14)
solution7(3,2,5)

/* 교점에 별 만들기
 
 - Ax + By + C = 0으로 표현할 수 있는 n개의 직선이 주어질 때, 이 직선의 교점 중 정수 좌표에 별을 그리려 합니다.
 
 예를 들어, 다음과 같은 직선 5개를

 2x - y + 4 = 0
 -2x - y + 4 = 0
 -y + 1 = 0
 5x - 8y - 12 = 0
 5x + 8y + 12 = 0
 좌표 평면 위에 그리면 아래 그림과 같습니다.
 이때, 모든 교점의 좌표는 (4, 1), (4, -4), (-4, -4), (-4, 1), (0, 4), (1.5, 1.0), (2.1, -0.19), (0, -1.5), (-2.1, -0.19), (-1.5, 1.0)입니다. 이 중 정수로만 표현되는 좌표는 (4, 1), (4, -4), (-4, -4), (-4, 1), (0, 4)입니다.

 만약 정수로 표현되는 교점에 별을 그리면 다음과 같습니다.
 위의 그림을 문자열로 나타낼 때, 별이 그려진 부분은 *, 빈 공간(격자선이 교차하는 지점)은 .으로 표현하면 다음과 같습니다.
 "..........."
 ".....*....."
 "..........."
 "..........."
 ".*.......*."
 "..........."
 "..........."
 "..........."
 "..........."
 ".*.......*."
 "..........."
 이때 격자판은 무한히 넓으니 모든 별을 포함하는 최소한의 크기만 나타내면 됩니다.

 따라서 정답은

 "....*...."
 "........."
 "........."
 "*.......*"
 "........."
 "........."
 "........."
 "........."
 "*.......*"
 입니다.

 직선 A, B, C에 대한 정보가 담긴 배열 line이 매개변수로 주어집니다. 이때 모든 별을 포함하는 최소 사각형을 return 하도록 solution 함수를 완성해주세요.

 제한사항
 line의 세로(행) 길이는 2 이상 1,000 이하인 자연수입니다.
 line의 가로(열) 길이는 3입니다.
 line의 각 원소는 [A, B, C] 형태입니다.
 A, B, C는 -100,000 이상 100,000 이하인 정수입니다.
 무수히 많은 교점이 생기는 직선 쌍은 주어지지 않습니다.
 A = 0이면서 B = 0인 경우는 주어지지 않습니다.
 정답은 1,000 * 1,000 크기 이내에서 표현됩니다.
 별이 한 개 이상 그려지는 입력만 주어집니다.
*/
func getSpot(a:Int, b:Int, c:Int, d:Int, e:Int, f:Int) -> [Int] {
    if (b*f-e*d)%(a*d-b*c) == 0 && (e*c-a*f)%(a*d-b*c) == 0 {
        return [(b*f-e*d)/(a*d-b*c), (e*c-a*f)/(a*d-b*c)]
    } else {
        return []
    }
}

func solution6(_ line:[[Int]]) -> [String] {
    var spots = Set<[Int]>()
    for i in 0...line.count-2 {
        for j in 1...line.count-1-i {
            if line[i][0]*line[i+j][1] - line[i][1]*line[i+j][0] != 0 {
                var spot = getSpot(a: line[i][0], b: line[i][1], c: line[i+j][0], d: line[i+j][1], e: line[i][2], f: line[i+j][2])
                if spot.count > 0 {
                    spots.insert(spot)
                }
            }
        }
    }
    var maxX:Int = spots.first![0]
    var minX:Int = spots.first![0]
    var maxY:Int = spots.first![1]
    var minY:Int = spots.first![1]
    spots.map {
        maxX = max($0[0], maxX)
        minX = min($0[0], minX)
        maxY = max($0[1], maxY)
        minY = min($0[1], minY)
    }
    var result:[String] = []
    for i in minY...maxY {
        var list = spots.filter { $0[1] == i }.map { $0[0] }
        if list.count > 0 {
            var str = ""
            for j in minX...maxX {
                if list.contains(j) {
                    str += "*"
                } else {
                    str += "."
                }
            }
            result.insert(str, at: 0)
        } else {
            result.insert(String(repeating: ".", count: maxX-minX+1), at: 0)
        }
    }
    return result
}

//solution6([[0, 1, -1], [1, 0, -1], [1, 0, 1]])
solution6([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]])
// ["....*....", ".........", ".........", "*.......*", ".........", ".........", ".........", ".........", "*.......*"]

/* 전력망을 둘로 나누기

 - n개의 송전탑이 전선을 통해 하나의 트리 형태로 연결되어 있습니다. 당신은 이 전선들 중 하나를 끊어서 현재의 전력망 네트워크를 2개로 분할하려고 합니다. 이때, 두 전력망이 갖게 되는 송전탑의 개수를 최대한 비슷하게 맞추고자 합니다.
 
 송전탑의 개수 n, 그리고 전선 정보 wires가 매개변수로 주어집니다. 전선들 중 하나를 끊어서 송전탑 개수가 가능한 비슷하도록 두 전력망으로 나누었을 때, 두 전력망이 가지고 있는 송전탑 개수의 차이(절대값)를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 n은 2 이상 100 이하인 자연수입니다.
 wires는 길이가 n-1인 정수형 2차원 배열입니다.
 wires의 각 원소는 [v1, v2] 2개의 자연수로 이루어져 있으며, 이는 전력망의 v1번 송전탑과 v2번 송전탑이 전선으로 연결되어 있다는 것을 의미합니다.
 1 ≤ v1 < v2 ≤ n 입니다.
 전력망 네트워크가 하나의 트리 형태가 아닌 경우는 입력으로 주어지지 않습니다.
*/
func solution5(_ n:Int, _ wires:[[Int]]) -> Int {
    var result:Int = n
    for wire in wires {
        var left:[Int] = [wire[0]]
        var right:[Int] = [wire[1]]
        while left.count + right.count != n {
            wires.map {
                if $0 != wire {
                    if left.contains($0[0]) && !left.contains($0[1]) {
                        left.append($0[1])
                    } else if left.contains($0[1]) && !left.contains($0[0]) {
                        left.append($0[0])
                    } else if right.contains($0[0]) && !right.contains($0[1]) {
                        right.append($0[1])
                    } else if right.contains($0[0]) && !right.contains($0[0]) {
                        right.append($0[0])
                    }
                }
            }
        }
        if result > abs(left.count - right.count) {
            result = abs(left.count - right.count)
        }
    }
    return result
}

solution5(9, [[1, 3], [2, 3], [3, 4], [4, 5], [4, 6], [4, 7], [7, 8], [7, 9]])

/* 빛의 경로 사이클

 - 각 칸마다 S, L, 또는 R가 써져 있는 격자가 있습니다. 당신은 이 격자에서 빛을 쏘고자 합니다. 이 격자의 각 칸에는 다음과 같은 특이한 성질이 있습니다.
 
 빛이 "S"가 써진 칸에 도달한 경우, 직진합니다.
 빛이 "L"이 써진 칸에 도달한 경우, 좌회전을 합니다.
 빛이 "R"이 써진 칸에 도달한 경우, 우회전을 합니다.
 빛이 격자의 끝을 넘어갈 경우, 반대쪽 끝으로 다시 돌아옵니다. 예를 들어, 빛이 1행에서 행이 줄어드는 방향으로 이동할 경우, 같은 열의 반대쪽 끝 행으로 다시 돌아옵니다.
 당신은 이 격자 내에서 빛이 이동할 수 있는 경로 사이클이 몇 개 있고, 각 사이클의 길이가 얼마인지 알고 싶습니다. 경로 사이클이란, 빛이 이동하는 순환 경로를 의미합니다.

 예를 들어, 다음 그림은 격자 ["SL","LR"]에서 1행 1열에서 2행 1열 방향으로 빛을 쏠 경우, 해당 빛이 이동하는 경로 사이클을 표현한 것입니다.
 
 이 격자에는 길이가 16인 사이클 1개가 있으며, 다른 사이클은 존재하지 않습니다.

 격자의 정보를 나타내는 1차원 문자열 배열 grid가 매개변수로 주어집니다. 주어진 격자를 통해 만들어지는 빛의 경로 사이클의 모든 길이들을 배열에 담아 오름차순으로 정렬하여 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ grid의 길이 ≤ 500
 1 ≤ grid의 각 문자열의 길이 ≤ 500
 grid의 모든 문자열의 길이는 서로 같습니다.
 grid의 모든 문자열은 'L', 'R', 'S'로 이루어져 있습니다.
*/
func solution4(_ grid:[String]) -> [Int] {
    return []
}

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
