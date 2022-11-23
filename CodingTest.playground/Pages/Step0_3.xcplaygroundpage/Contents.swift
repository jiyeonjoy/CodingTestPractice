import Foundation

/* 외계어 사전

 - PROGRAMMERS-962 행성에 불시착한 우주비행사 머쓱이는 외계행성의 언어를 공부하려고 합니다. 알파벳이 담긴 배열 spell과 외계어 사전 dic이 매개변수로 주어집니다. spell에 담긴 알파벳을 한번씩만 모두 사용한 단어가 dic에 존재한다면 1, 존재하지 않는다면 2를 return하도록 solution 함수를 완성해주세요.
*/
func solution28(_ spell:[String], _ dic:[String]) -> Int {
    var isMatch:Bool = dic.filter {
           $0.count == spell.count
        && $0.compactMap{ String($0) }.sorted().joined() == spell.sorted().joined()
    }.count > 0
       
    return isMatch ? 1 : 2
}

solution28(["p", "o", "s"], ["sod", "eocd", "qixm", "adio", "soo"])

/* 삼각형의 완성조건 (2)

 - 선분 세 개로 삼각형을 만들기 위해서는 다음과 같은 조건을 만족해야 합니다.
 
 가장 긴 변의 길이는 다른 두 변의 길이의 합보다 작아야 합니다.
 삼각형의 두 변의 길이가 담긴 배열 sides이 매개변수로 주어집니다. 나머지 한 변이 될 수 있는 정수의 개수를 return하도록 solution 함수를 완성해주세요.
*/
func solution27(_ sides:[Int]) -> Int {
    let long:Int = max(sides[0],sides[1])
    let short:Int = min(sides[0],sides[1])
    return (long-short+1...long+short-1).count
}

/* 안전지대

 - 다음 그림과 같이 지뢰가 있는 지역과 지뢰에 인접한 위, 아래, 좌, 우 대각선 칸을 모두 위험지역으로 분류합니다.
 지뢰는 2차원 배열 board에 1로 표시되어 있고 board에는 지뢰가 매설 된 지역 1과, 지뢰가 없는 지역 0만 존재합니다.
 지뢰가 매설된 지역의 지도 board가 매개변수로 주어질 때, 안전한 지역의 칸 수를 return하도록 solution 함수를 완성해주세요.
*/
func solution26(_ board:[[Int]]) -> Int {
    var copy = board
    for i in 0...board.count-1 {
        for j in 0...board.count-1 {
            if board[i][j] == 1 {
                if i != 0 && j != 0 {
                    if copy[i-1][j-1] != 1 {
                        copy[i-1][j-1] = 2
                    }
                }
                if i != 0 {
                    if copy[i-1][j] != 1 {
                        copy[i-1][j] = 2
                    }
                }
                if i != 0 && j+1 < board.count {
                    if copy[i-1][j+1] != 1 {
                        copy[i-1][j+1] = 2
                    }
                }
                if j != 0 {
                    if copy[i][j-1] != 1 {
                        copy[i][j-1] = 2
                    }
                }
                if j+1 < board.count {
                    if copy[i][j+1] != 1 {
                        copy[i][j+1] = 2
                    }
                }
                if i+1 < board.count && j != 0 {
                    if copy[i+1][j-1] != 1 {
                        copy[i+1][j-1] = 2
                    }
                }
                if i+1 < board.count {
                    if copy[i+1][j] != 1 {
                        copy[i+1][j] = 2
                    }
                }
                if i+1 < board.count && j+1 < board.count {
                    if copy[i+1][j+1] != 1 {
                        copy[i+1][j+1] = 2
                    }
                }
            }
        }
    }
    var result:Int = 0
    for i in 0...board.count-1 {
        result += copy[i].filter { $0==0 }.count
    }
    return result
}

//solution26([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 1, 0], [0, 0, 0, 0, 0]])
solution26([[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]])

/* 숨어있는 숫자의 덧셈 (2)

 - 문자열 my_string이 매개변수로 주어집니다. my_string은 소문자, 대문자, 자연수로만 구성되어있습니다. my_string안의 자연수들의 합을 return하도록 solution 함수를 완성해주세요.
*/
func solution25(_ my_string:String) -> Int {
    var result:Int = 0
    var str:String = my_string.replacingOccurrences(of: "[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]", with: ".",options: .regularExpression)
    str.components(separatedBy: ".").map { result += (Int($0) ?? 0) }
    
    return result
}

solution25("aAb1B2cC34oOp")

/* 다항식 더하기

 - 한 개 이상의 항의 합으로 이루어진 식을 다항식이라고 합니다. 다항식을 계산할 때는 동류항끼리 계산해 정리합니다. 덧셈으로 이루어진 다항식 polynomial이 매개변수로 주어질 때, 동류항끼리 더한 결괏값을 문자열로 return 하도록 solution 함수를 완성해보세요. 같은 식이라면 가장 짧은 수식을 return 합니다.
*/
func solution24(_ polynomial:String) -> String {
    var first:Int = 0
    var second:Int = 0
    polynomial.components(separatedBy: " + ").map {
        if $0.contains("x") {
            first += (Int(String($0.replacingOccurrences(of: "x", with: ""))) ?? 1)
        } else {
            second += (Int($0) ?? 0)
        }
    }
    var result:String = ""
    if first != 0 {
        if first == 1 {
            result += "x"
        } else {
            result += "\(first)x"
        }
        if second != 0 {
            result += " + \(second)"
        }
    } else {
        if second != 0 {
            result += "\(second)"
        }
    }
    
    return result
}

/* 최댓값 만들기 (2)

 - 정수 배열 numbers가 매개변수로 주어집니다. numbers의 원소 중 두 개를 곱해 만들 수 있는 최댓값을 return하도록 solution 함수를 완성해주세요.
*/
func solution23(_ numbers:[Int]) -> Int {
    var sorted: [Int] = numbers.sorted()
    
    var num: Int = sorted[0]*sorted[1]
    var num2: Int = sorted[numbers.count-1]*sorted[numbers.count-2]
    
    return num > num2 ? num : num2
}

solution23([1,2,3,4,9])

/* 캐릭터의 좌표

 - 머쓱이는 RPG게임을 하고 있습니다. 게임에는 up, down, left, right 방향키가 있으며 각 키를 누르면 위, 아래, 왼쪽, 오른쪽으로 한 칸씩 이동합니다. 예를 들어 [0,0]에서 up을 누른다면 캐릭터의 좌표는 [0, 1], down을 누른다면 [0, -1], left를 누른다면 [-1, 0], right를 누른다면 [1, 0]입니다. 머쓱이가 입력한 방향키의 배열 keyinput와 맵의 크기 board이 매개변수로 주어집니다. 캐릭터는 항상 [0,0]에서 시작할 때 키 입력이 모두 끝난 뒤에 캐릭터의 좌표 [x, y]를 return하도록 solution 함수를 완성해주세요.
 
 [0, 0]은 board의 정 중앙에 위치합니다. 예를 들어 board의 가로 크기가 9라면 캐릭터는 왼쪽으로 최대 [-4, 0]까지 오른쪽으로 최대 [4, 0]까지 이동할 수 있습니다.
*/
func solution22(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var x:Int = 0
    var y:Int = 0
    
    for key in keyinput {
        if key == "up" {
            if y != board[1]/2 {
                y += 1
            }
        } else if key == "down" {
            if y != -board[1]/2 {
                y -= 1
            }
        } else if key == "left" {
            if x != -board[0]/2 {
                x -= 1
            }
        } else {
            if x != board[0]/2 {
                x += 1
            }
        }
    }
    
    return [x,y]
}

/* 직사각형 넓이 구하기

 - 2차원 좌표 평면에 변이 축과 평행한 직사각형이 있습니다. 직사각형 네 꼭짓점의 좌표 [[x1, y1], [x2, y2], [x3, y3], [x4, y4]]가 담겨있는 배열 dots가 매개변수로 주어질 때, 직사각형의 넓이를 return 하도록 solution 함수를 완성해보세요.
*/
func solution21(_ dots:[[Int]]) -> Int {
    guard dots.count < 5 else { return 0 }
   
    var width:Int = 1
    var height:Int = 1
    
    for i in 1...3 {
        if dots[0][0] == dots[i][0] {
            width = dots[i][1] > dots[0][1] ? dots[i][1] - dots[0][1] : dots[0][1] - dots[i][1]
        }
        if dots[0][1] == dots[i][1] {
            height = dots[i][0] > dots[0][0] ? dots[i][0] - dots[0][0] : dots[0][0] - dots[i][0]
        }
    }
    
    return width * height
}

solution21([[-1, -1], [1, 1], [1, -1], [-1, 1]])

/* 배열 원소의 길이

 - 문자열 배열 strlist가 매개변수로 주어집니다. strlist 각 원소의 길이를 담은 배열을 retrun하도록 solution 함수를 완성해주세요.
*/
func solution20(_ strlist:[String]) -> [Int] { strlist.map { $0.count } }

/* 컨트롤 제트

 - 숫자들이 공백으로 구분된 문자열이 주어집니다. 문자열에 있는 숫자를 차례대로 더하려고 합니다. 이 때 “Z”가 나오면 바로 전에 더했던 숫자를 뺀다는 뜻입니다. 숫자와 “Z”로 이루어진 문자열 s가 주어질 때, 머쓱이가 구한 값을 return 하도록 solution 함수를 완성해보세요.
*/
func solution19(_ s:String) -> Int {
    var list:[String] = s.components(separatedBy: " ")
    var sumList:[Int] = []
    for num in list {
        if num == "Z" {
            sumList.removeLast()
        } else {
            sumList.append( Int(num) ?? 0 )
        }
    }
    return sumList.reduce(0,+)
}

solution19("1 2 Z 3")

/* 소인수분해

 - 소인수분해란 어떤 수를 소수들의 곱으로 표현하는 것입니다. 예를 들어 12를 소인수 분해하면 2 * 2 * 3 으로 나타낼 수 있습니다. 따라서 12의 소인수는 2와 3입니다. 자연수 n이 매개변수로 주어질 때 n의 소인수를 오름차순으로 담은 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution18(_ n:Int) -> [Int] {
    if n == 2 { return [2] }
    var result:[Int] = []
    var num = n
    for i in 2...n {
        if num%i == 0 {
            result.append(i)
            while num%i == 0 {
                num /= i
            }
        }
        if num == 1 {
            break
        }
    }
    return result
}

solution18(420)

/* 숨어있는 숫자의 덧셈 (1)

 - 문자열 my_string이 매개변수로 주어집니다. my_string안의 모든 자연수들의 합을 return하도록 solution 함수를 완성해주세요.
*/
func solution17(_ my_string:String) -> Int {
     return my_string.compactMap{Int(String($0))}.reduce(0,+)
}

func solution16(_ my_string:String) -> Int { my_string.filter { $0.isNumber }.map{ Int(String($0)) ?? 0 }.reduce(0, +) }

solution16("aAb1B2cC34oOp")

/* 문자열 정렬하기 (1)

 - 문자열 my_string이 매개변수로 주어질 때, my_string 안에 있는 숫자만 골라 오름차순 정렬한 리스트를 return 하도록 solution 함수를 작성해보세요.
*/
func solution15(_ my_string:String) -> [Int] {
    return my_string.filter{$0.isNumber}.map{Int(String($0))!}.sorted(by: <)
}

func solution14(_ my_string:String) -> [Int] { my_string.filter {
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"].contains($0) }.map {
        Int(String($0)) ?? 0
    }.sorted()
}

solution14("1가나23")

/* 모음 제거

 - 영어에선 a, e, i, o, u 다섯 가지 알파벳을 모음으로 분류합니다. 문자열 my_string이 매개변수로 주어질 때 모음을 제거한 문자열을 return하도록 solution 함수를 완성해주세요.
*/
func solution13(_ my_string:String) -> String {
    return my_string.replacingOccurrences(of: "[aeiou]", with: "", options: .regularExpression)
}

func solution12(_ my_string:String) -> String {
    return my_string.components(separatedBy: ["a", "e", "i", "o", "u"]).joined()
}

func solution11(_ my_string:String) -> String {
    return my_string.filter { !["a", "e", "i", "o", "u"].contains($0)}
}

func solution10(_ my_string:String) -> String {
    my_string.replacingOccurrences(of: "a", with: "").replacingOccurrences(of: "e", with: "").replacingOccurrences(of: "i", with: "").replacingOccurrences(of: "o", with: "").replacingOccurrences(of: "u", with: "")
}

// time error
func solution9(_ my_string:String) -> String { my_string.filter{ String($0) != "a" && String($0) != "e" && String($0) != "i" && String($0) != "o" && String($0) != "u" }
}

solution9("nice to meet you")

/* 팩토리얼

 - i팩토리얼 (i!)은 1부터 i까지 정수의 곱을 의미합니다. 예를들어 5! = 5 * 4 * 3 * 2 * 1 = 120 입니다. 정수 n이 주어질 때 다음 조건을 만족하는 가장 큰 정수 i를 return 하도록 solution 함수를 완성해주세요.
 
 i! ≤ n
*/
func solution8(_ n:Int) -> Int {
    if n == 1 {
        return 1
    }
    var result: Int = 1
    var multiply: Int = 1
    while multiply <= n {
        result += 1
        multiply *= result
    }
    return result-1
}

/* 최댓값 만들기 (1)

 - 정수 배열 numbers가 매개변수로 주어집니다. numbers의 원소 중 두 개를 곱해 만들 수 있는 최댓값을 return하도록 solution 함수를 완성해주세요.
*/
func solution7(_ numbers:[Int]) -> Int {
    var sorted = numbers.sorted()
    return sorted[numbers.count-2] * sorted[numbers.count-1]
}

/* 합성수 찾기
 
 - 약수의 개수가 세 개 이상인 수를 합성수라고 합니다. 자연수 n이 매개변수로 주어질 때 n이하의 합성수의 개수를 return하도록 solution 함수를 완성해주세요.
*/
func solution6(_ n: Int) -> Int { (1...n).filter { i in (1...i).filter { i % $0 == 0 }.count > 2 }.count }

func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

func solution5(_ n:Int) -> Int {
    if n < 4 {
        return 0
    }
    return (4...n).filter { !isPrime(num: $0) }.count
}

/* 주사위의 개수
 
 - 머쓱이는 직육면체 모양의 상자를 하나 가지고 있는데 이 상자에 정육면체 모양의 주사위를 최대한 많이 채우고 싶습니다. 상자의 가로, 세로, 높이가 저장되어있는 배열 box와 주사위 모서리의 길이 정수 n이 매개변수로 주어졌을 때, 상자에 들어갈 수 있는 주사위의 최대 개수를 return 하도록 solution 함수를 완성해주세요.
*/
func solution4(_ box:[Int], _ n:Int) -> Int {
    guard box.count > 2 && box[0] >= n && box[1] >= n && box[2] >= n else {
        return 0
    }
    var result:Int = 1
    for size in box {
        result *= size/n
    }
    return result
}

solution4([10,8,6],3)

/* 배열 회전시키기
 
 - 정수가 담긴 배열 numbers와 문자열 direction가 매개변수로 주어집니다. 배열 numbers의 원소를 direction방향으로 한 칸씩 회전시킨 배열을 return하도록 solution 함수를 완성해주세요.
*/
func solution3(_ numbers: [Int], _ direction: String) -> [Int] {
    var mutableNumbers = numbers

    if direction == "right" {
        mutableNumbers.insert(mutableNumbers.last!, at: 0)
        mutableNumbers.removeLast()
    } else {
        mutableNumbers.append(mutableNumbers.first!)
        mutableNumbers.removeFirst()
    }
    return mutableNumbers
}

func solution2(_ numbers:[Int], _ direction:String) -> [Int] {
    var result:[Int] = []
    if direction == "left" {
        for i in 1...numbers.count-1 {
            result.append(numbers[i])
        }
        result.append(numbers[0])
    } else {
        result.append(numbers[numbers.count-1])
        for i in 0...numbers.count-2 {
            result.append(numbers[i])
        }
    }
    return result
}

/* 공 던지기
 
 - 머쓱이는 친구들과 동그랗게 서서 공 던지기 게임을 하고 있습니다. 공은 1번부터 던지며 오른쪽으로 한 명을 건너뛰고 그다음 사람에게만 던질 수 있습니다. 친구들의 번호가 들어있는 정수 배열 numbers와 정수 K가 주어질 때, k번째로 공을 던지는 사람의 번호는 무엇인지 return 하도록 solution 함수를 완성해보세요.
*/
func solution(_ numbers:[Int], _ k:Int) -> Int {
    numbers[((k*2-1)%numbers.count)-1]
}
