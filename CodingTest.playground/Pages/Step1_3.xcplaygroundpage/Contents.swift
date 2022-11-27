import Foundation

/* 명예의 전당 (1)

 - "명예의 전당"이라는 TV 프로그램에서는 매일 1명의 가수가 노래를 부르고, 시청자들의 문자 투표수로 가수에게 점수를 부여합니다. 매일 출연한 가수의 점수가 지금까지 출연 가수들의 점수 중 상위 k번째 이내이면 해당 가수의 점수를 명예의 전당이라는 목록에 올려 기념합니다. 즉 프로그램 시작 이후 초기에 k일까지는 모든 출연 가수의 점수가 명예의 전당에 오르게 됩니다. k일 다음부터는 출연 가수의 점수가 기존의 명예의 전당 목록의 k번째 순위의 가수 점수보다 더 높으면, 출연 가수의 점수가 명예의 전당에 오르게 되고 기존의 k번째 순위의 점수는 명예의 전당에서 내려오게 됩니다.
 
 이 프로그램에서는 매일 "명예의 전당"의 최하위 점수를 발표합니다. 예를 들어, k = 3이고, 7일 동안 진행된 가수의 점수가 [10, 100, 20, 150, 1, 100, 200]이라면, 명예의 전당에서 발표된 점수는 아래의 그림과 같이 [10, 10, 10, 20, 20, 100, 100]입니다.

 명예의 전당 목록의 점수의 개수 k, 1일부터 마지막 날까지 출연한 가수들의 점수인 score가 주어졌을 때, 매일 발표된 명예의 전당의 최하위 점수를 return하는 solution 함수를 완성해주세요.

 제한사항
 3 ≤ k ≤ 100
 7 ≤ score의 길이 ≤ 1,000
 0 ≤ score[i] ≤ 2,000
*/
func solution21(_ k:Int, _ score:[Int]) -> [Int] {
    var result:[Int] = []
    var list:[Int] = []
    for num in score {
        if list.count == k {
            if list.last! < num {
                list.append(num)
                list = list.sorted(by: >)
                list.removeLast()
                result.append(list.last!)
            } else {
                result.append(list.last!)
            }
        } else {
            list.append(num)
            list = list.sorted(by: >)
            result.append(list.last!)
        }
    }
    return result
}

solution21(3, [10, 100, 20, 150, 1, 100, 200])

/* 기사단원의 무기
 
 - 숫자나라 기사단의 각 기사에게는 1번부터 number까지 번호가 지정되어 있습니다. 기사들은 무기점에서 무기를 구매하려고 합니다.
 
 각 기사는 자신의 기사 번호의 약수 개수에 해당하는 공격력을 가진 무기를 구매하려 합니다. 단, 이웃나라와의 협약에 의해 공격력의 제한수치를 정하고, 제한수치보다 큰 공격력을 가진 무기를 구매해야 하는 기사는 협약기관에서 정한 공격력을 가지는 무기를 구매해야 합니다.

 예를 들어, 15번으로 지정된 기사단원은 15의 약수가 1, 3, 5, 15로 4개 이므로, 공격력이 4인 무기를 구매합니다. 만약, 이웃나라와의 협약으로 정해진 공격력의 제한수치가 3이고 제한수치를 초과한 기사가 사용할 무기의 공격력이 2라면, 15번으로 지정된 기사단원은 무기점에서 공격력이 2인 무기를 구매합니다. 무기를 만들 때, 무기의 공격력 1당 1kg의 철이 필요합니다. 그래서 무기점에서 무기를 모두 만들기 위해 필요한 철의 무게를 미리 계산하려 합니다.

 기사단원의 수를 나타내는 정수 number와 이웃나라와 협약으로 정해진 공격력의 제한수치를 나타내는 정수 limit와 제한수치를 초과한 기사가 사용할 무기의 공격력을 나타내는 정수 power가 주어졌을 때, 무기점의 주인이 무기를 모두 만들기 위해 필요한 철의 무게를 return 하는 solution 함수를 완성하시오.

 제한사항
 1 ≤ number ≤ 100,000
 2 ≤ limit ≤ 100
 1 ≤ power ≤ limit
*/
func getDivisor(_ n:Int, _ limit:Int, _ power: Int) -> Int {
    if n == 1 {
        return 1
    }
    var isSquare = Double(Int(sqrt(Double(n)))) == sqrt(Double(n))
    var count:Int = 0
    for i in 1...Int(sqrt(Double(n))) {
        if n%i == 0 {
            count += 1
            if (isSquare ? count*2-1 : count*2) > limit {
               return power
            }
        }
    }
    count = isSquare ? count*2-1 : count*2
    return count
}

func solution20(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result:Int = 0
    for i in 1...number {
        let count = getDivisor(i, limit, power)
        result += count
    }
    return result
}

solution20(5,3,2)

/* 과일 장수
 
 - 과일 장수가 사과 상자를 포장하고 있습니다. 사과는 상태에 따라 1점부터 k점까지의 점수로 분류하며, k점이 최상품의 사과이고 1점이 최하품의 사과입니다. 사과 한 상자의 가격은 다음과 같이 결정됩니다.
 
 한 상자에 사과를 m개씩 담아 포장합니다.
 상자에 담긴 사과 중 가장 낮은 점수가 p (1 ≤ p ≤ k)점인 경우, 사과 한 상자의 가격은 p * m 입니다.
 과일 장수가 가능한 많은 사과를 팔았을 때, 얻을 수 있는 최대 이익을 계산하고자 합니다.(사과는 상자 단위로만 판매하며, 남는 사과는 버립니다)

 예를 들어, k = 3, m = 4, 사과 7개의 점수가 [1, 2, 3, 1, 2, 3, 1]이라면, 다음과 같이 [2, 3, 2, 3]으로 구성된 사과 상자 1개를 만들어 판매하여 최대 이익을 얻을 수 있습니다.

 (최저 사과 점수) x (한 상자에 담긴 사과 개수) x (상자의 개수) = 2 x 4 x 1 = 8
 사과의 최대 점수 k, 한 상자에 들어가는 사과의 수 m, 사과들의 점수 score가 주어졌을 때, 과일 장수가 얻을 수 있는 최대 이익을 return하는 solution 함수를 완성해주세요.

 제한사항
 3 ≤ k ≤ 9
 3 ≤ m ≤ 10
 7 ≤ score의 길이 ≤ 1,000,000
 1 ≤ score[i] ≤ k
 이익이 발생하지 않는 경우에는 0을 return 해주세요.
*/
func solution19(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var result:Int = 0
    var sorted = score.sorted(by: >)
    if score.count/m < 1 {
        return 0
    }
    for i in 1...score.count/m {
        result += m*min(sorted[i*m-1], k)
    }
    return result
}

solution19(3,4,[1, 2, 3, 1, 2, 3, 1])

/* 푸드 파이트 대회
 
 - 수웅이는 매달 주어진 음식을 빨리 먹는 푸드 파이트 대회를 개최합니다. 이 대회에서 선수들은 1대 1로 대결하며, 매 대결마다 음식의 종류와 양이 바뀝니다. 대결은 준비된 음식들을 일렬로 배치한 뒤, 한 선수는 제일 왼쪽에 있는 음식부터 오른쪽으로, 다른 선수는 제일 오른쪽에 있는 음식부터 왼쪽으로 순서대로 먹는 방식으로 진행됩니다. 중앙에는 물을 배치하고, 물을 먼저 먹는 선수가 승리하게 됩니다.
 
 이때, 대회의 공정성을 위해 두 선수가 먹는 음식의 종류와 양이 같아야 하며, 음식을 먹는 순서도 같아야 합니다. 또한, 이번 대회부터는 칼로리가 낮은 음식을 먼저 먹을 수 있게 배치하여 선수들이 음식을 더 잘 먹을 수 있게 하려고 합니다. 이번 대회를 위해 수웅이는 음식을 주문했는데, 대회의 조건을 고려하지 않고 음식을 주문하여 몇 개의 음식은 대회에 사용하지 못하게 되었습니다.

 예를 들어, 3가지의 음식이 준비되어 있으며, 칼로리가 적은 순서대로 1번 음식을 3개, 2번 음식을 4개, 3번 음식을 6개 준비했으며, 물을 편의상 0번 음식이라고 칭한다면, 두 선수는 1번 음식 1개, 2번 음식 2개, 3번 음식 3개씩을 먹게 되므로 음식의 배치는 "1223330333221"이 됩니다. 따라서 1번 음식 1개는 대회에 사용하지 못합니다.

 수웅이가 준비한 음식의 양을 칼로리가 적은 순서대로 나타내는 정수 배열 food가 주어졌을 때, 대회를 위한 음식의 배치를 나타내는 문자열을 return 하는 solution 함수를 완성해주세요.

 제한사항
 2 ≤ food의 길이 ≤ 9
 1 ≤ food의 각 원소 ≤ 1,000
 food에는 칼로리가 적은 순서대로 음식의 양이 담겨 있습니다.
 food[i]는 i번 음식의 수입니다.
 food[0]은 수웅이가 준비한 물의 양이며, 항상 1입니다.
 정답의 길이가 3 이상인 경우만 입력으로 주어집니다.
*/
func solution18(_ food:[Int]) -> String {
    var result:String = ""
    for i in 0...food.count-1 {
        result += String(repeating: "\(i)", count: food[i]/2)
    }
    var reverse = result.reversed()
    result += "0"
    result += reverse
    return result
}

/* 햄버거 만들기
 
 - 햄버거 가게에서 일을 하는 상수는 햄버거를 포장하는 일을 합니다. 함께 일을 하는 다른 직원들이 햄버거에 들어갈 재료를 조리해 주면 조리된 순서대로 상수의 앞에 아래서부터 위로 쌓이게 되고, 상수는 순서에 맞게 쌓여서 완성된 햄버거를 따로 옮겨 포장을 하게 됩니다. 상수가 일하는 가게는 정해진 순서(아래서부터, 빵 – 야채 – 고기 - 빵)로 쌓인 햄버거만 포장을 합니다. 상수는 손이 굉장히 빠르기 때문에 상수가 포장하는 동안 속 재료가 추가적으로 들어오는 일은 없으며, 재료의 높이는 무시하여 재료가 높이 쌓여서 일이 힘들어지는 경우는 없습니다.
 
 예를 들어, 상수의 앞에 쌓이는 재료의 순서가 [야채, 빵, 빵, 야채, 고기, 빵, 야채, 고기, 빵]일 때, 상수는 여섯 번째 재료가 쌓였을 때, 세 번째 재료부터 여섯 번째 재료를 이용하여 햄버거를 포장하고, 아홉 번째 재료가 쌓였을 때, 두 번째 재료와 일곱 번째 재료부터 아홉 번째 재료를 이용하여 햄버거를 포장합니다. 즉, 2개의 햄버거를 포장하게 됩니다.

 상수에게 전해지는 재료의 정보를 나타내는 정수 배열 ingredient가 주어졌을 때, 상수가 포장하는 햄버거의 개수를 return 하도록 solution 함수를 완성하시오.

 제한사항
 1 ≤ ingredient의 길이 ≤ 1,000,000
 ingredient의 원소는 1, 2, 3 중 하나의 값이며, 순서대로 빵, 야채, 고기를 의미합니다.
*/
// 빵 야채 고기 빵 1, 2, 3, 1]
func solution17(_ ingredient:[Int]) -> Int {
    var result:Int = 0
    var list:[Int] = []
    for num in ingredient {
        list.append(num)
        if list.count > 3 {
            if list[list.count-1] == 1 &&
                list[list.count-2] == 3 &&
                list[list.count-3] == 2 &&
                list[list.count-4] == 1 {
                result += 1
                list.removeLast()
                list.removeLast()
                list.removeLast()
                list.removeLast()
            }
        }
    }
    return result
}

solution17([2, 1, 1, 2, 3, 1,2,1, 2, 3, 1,3,1, 2, 3, 4, 1, 2, 3, 1])

/* 옹알이 (2)
 
 - 머쓱이는 태어난 지 11개월 된 조카를 돌보고 있습니다. 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음과 네 가지 발음을 조합해서 만들 수 있는 발음밖에 하지 못하고 연속해서 같은 발음을 하는 것을 어려워합니다. 문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.
 
 제한사항
 1 ≤ babbling의 길이 ≤ 100
 1 ≤ babbling[i]의 길이 ≤ 30
 문자열은 알파벳 소문자로만 이루어져 있습니다.
*/
func solution16(_ babbling:[String]) -> Int {
    babbling.filter{
        !$0.contains("ayaaya") &&
        !$0.contains("yeye") &&
        !$0.contains("woowoo") &&
        !$0.contains("mama") &&
        $0.replacingOccurrences(of: "aya", with: ".").replacingOccurrences(of: "ye", with: ".").replacingOccurrences(of: "woo", with: ".").replacingOccurrences(of: "ma", with: ".").replacingOccurrences(of: ".", with: "") == ""
    }.count
}

solution16(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"])
solution16(["aya", "yee", "u", "maa"])

/* 콜라 문제
 
 - 오래전 유행했던 콜라 문제가 있습니다. 콜라 문제의 지문은 다음과 같습니다.
 
 정답은 아무에게도 말하지 마세요.

 콜라 빈 병 2개를 가져다주면 콜라 1병을 주는 마트가 있다. 빈 병 20개를 가져다주면 몇 병을 받을 수 있는가?

 단, 보유 중인 빈 병이 2개 미만이면, 콜라를 받을 수 없다.

 문제를 풀던 상빈이는 콜라 문제의 완벽한 해답을 찾았습니다. 상빈이가 푼 방법은 아래 그림과 같습니다. 우선 콜라 빈 병 20병을 가져가서 10병을 받습니다. 받은 10병을 모두 마신 뒤, 가져가서 5병을 받습니다. 5병 중 4병을 모두 마신 뒤 가져가서 2병을 받고, 또 2병을 모두 마신 뒤 가져가서 1병을 받습니다. 받은 1병과 5병을 받았을 때 남은 1병을 모두 마신 뒤 가져가면 1병을 또 받을 수 있습니다. 이 경우 상빈이는 총 10 + 5 + 2 + 1 + 1 = 19병의 콜라를 받을 수 있습니다.
 
 문제를 열심히 풀던 상빈이는 일반화된 콜라 문제를 생각했습니다. 이 문제는 빈 병 a개를 가져다주면 콜라 b병을 주는 마트가 있을 때, 빈 병 n개를 가져다주면 몇 병을 받을 수 있는지 계산하는 문제입니다. 기존 콜라 문제와 마찬가지로, 보유 중인 빈 병이 a개 미만이면, 추가적으로 빈 병을 받을 순 없습니다. 상빈이는 열심히 고심했지만, 일반화된 콜라 문제의 답을 찾을 수 없었습니다. 상빈이를 도와, 일반화된 콜라 문제를 해결하는 프로그램을 만들어 주세요.

 콜라를 받기 위해 마트에 주어야 하는 병 수 a, 빈 병 a개를 가져다 주면 마트가 주는 콜라 병 수 b, 상빈이가 가지고 있는 빈 병의 개수 n이 매개변수로 주어집니다. 상빈이가 받을 수 있는 콜라의 병 수를 return 하도록 solution 함수를 작성해주세요.

 제한사항
 1 ≤ b < a ≤ n ≤ 1,000,000
 정답은 항상 int 범위를 넘지 않게 주어집니다.
*/
func solution15(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var result: Int = 0
    var x: Int = n
    
    while x >= a {
        result += b*(x/a)
        x = b*(x/a) + x%a
    }
    return result
}

solution15(2, 1, 20)

/* 삼총사
 
 - 한국중학교에 다니는 학생들은 각자 정수 번호를 갖고 있습니다. 이 학교 학생 3명의 정수 번호를 더했을 때 0이 되면 3명의 학생은 삼총사라고 합니다. 예를 들어, 5명의 학생이 있고, 각각의 정수 번호가 순서대로 -2, 3, 0, 2, -5일 때, 첫 번째, 세 번째, 네 번째 학생의 정수 번호를 더하면 0이므로 세 학생은 삼총사입니다. 또한, 두 번째, 네 번째, 다섯 번째 학생의 정수 번호를 더해도 0이므로 세 학생도 삼총사입니다. 따라서 이 경우 한국중학교에서는 두 가지 방법으로 삼총사를 만들 수 있습니다.
 
 한국중학교 학생들의 번호를 나타내는 정수 배열 number가 매개변수로 주어질 때, 학생들 중 삼총사를 만들 수 있는 방법의 수를 return 하도록 solution 함수를 완성하세요.

 제한사항
 3 ≤ number의 길이 ≤ 13
 -1,000 ≤ number의 각 원소 ≤ 1,000
 서로 다른 학생의 정수 번호가 같을 수 있습니다.
*/
func solution14(_ number:[Int]) -> Int {
    var result:Int = 0
    for i in 0...number.count-3 {
        for j in 1...number.count-2-i {
            for k in 1...number.count-1-j-i {
                if number[i]+number[i+j]+number[i+j+k] == 0 {
                    result += 1
                }
            }
        }
    }
    return result
}

solution14([-2, 3, 0, 2, -5])

/* 숫자 짝꿍
 
 - 두 정수 X, Y의 임의의 자리에서 공통으로 나타나는 정수 k(0 ≤ k ≤ 9)들을 이용하여 만들 수 있는 가장 큰 정수를 두 수의 짝꿍이라 합니다(단, 공통으로 나타나는 정수 중 서로 짝지을 수 있는 숫자만 사용합니다). X, Y의 짝꿍이 존재하지 않으면, 짝꿍은 -1입니다. X, Y의 짝꿍이 0으로만 구성되어 있다면, 짝꿍은 0입니다.
 
 예를 들어, X = 3403이고 Y = 13203이라면, X와 Y의 짝꿍은 X와 Y에서 공통으로 나타나는 3, 0, 3으로 만들 수 있는 가장 큰 정수인 330입니다. 다른 예시로 X = 5525이고 Y = 1255이면 X와 Y의 짝꿍은 X와 Y에서 공통으로 나타나는 2, 5, 5로 만들 수 있는 가장 큰 정수인 552입니다(X에는 5가 3개, Y에는 5가 2개 나타나므로 남는 5 한 개는 짝 지을 수 없습니다.)
 두 정수 X, Y가 주어졌을 때, X, Y의 짝꿍을 return하는 solution 함수를 완성해주세요.

 제한사항
 3 ≤ X, Y의 길이(자릿수) ≤ 3,000,000입니다.
 X, Y는 0으로 시작하지 않습니다.
 X, Y의 짝꿍은 상당히 큰 정수일 수 있으므로, 문자열로 반환합니다.
*/
/// 시간 초과!! ERROR
func solution13(_ X:String, _ Y:String) -> String {
    var result = ""
    if X.count <= Y.count {
        var yList:[Character] = Array(Y)
        X.map {
            if yList.contains($0) {
                yList.remove(at: yList.firstIndex(of: $0) ?? 0)
                result += String($0)
            }
        }
    } else {
        var xList:[Character] = Array(X)
        Y.map {
            if xList.contains($0) {
                xList.remove(at: xList.firstIndex(of: $0) ?? 0)
                result += String($0)
            }
        }
    }
   
    if result == "" {
        result = "-1"
    } else {
        result = String(result.sorted(by: >))
        if result.first == "0" {
            result = "0"
        }
    }
    return result
}

// 성공!
func solution12(_ X:String, _ Y:String) -> String {
    var dicX = Dictionary(grouping: X) { $0 }
    var dicY = Dictionary(grouping: Y) { $0 }
    var result:String = ""
    for i in 0...9 {
        let key:Character = Character("\(9-i)")
        result += String(repeating: key, count: min(dicX[key]?.count ?? 0, dicY[key]?.count ?? 0))
    }
    if result == "" {
        result = "-1"
    } else {
        if result.first == "0" {
            result = "0"
        }
    }
    return result
}

solution12("100","2345") // -1
solution12("100","203045") // 0
solution12("100","123450") // 10
solution12("12321","42531") // 321

/* 성격 유형 검사하기
 
 - 나만의 카카오 성격 유형 검사지를 만들려고 합니다.
 성격 유형 검사는 다음과 같은 4개 지표로 성격 유형을 구분합니다. 성격은 각 지표에서 두 유형 중 하나로 결정됩니다.

 지표 번호    성격 유형
 1번 지표    라이언형(R), 튜브형(T)
 2번 지표    콘형(C), 프로도형(F)
 3번 지표    제이지형(J), 무지형(M)
 4번 지표    어피치형(A), 네오형(N)
 4개의 지표가 있으므로 성격 유형은 총 16(=2 x 2 x 2 x 2)가지가 나올 수 있습니다. 예를 들어, "RFMN"이나 "TCMA"와 같은 성격 유형이 있습니다.

 검사지에는 총 n개의 질문이 있고, 각 질문에는 아래와 같은 7개의 선택지가 있습니다.

 매우 비동의
 비동의
 약간 비동의
 모르겠음
 약간 동의
 동의
 매우 동의
 각 질문은 1가지 지표로 성격 유형 점수를 판단합니다.

 예를 들어, 어떤 한 질문에서 4번 지표로 아래 표처럼 점수를 매길 수 있습니다.

 선택지    성격 유형 점수
 매우 비동의    네오형 3점
 비동의    네오형 2점
 약간 비동의    네오형 1점
 모르겠음    어떤 성격 유형도 점수를 얻지 않습니다
 약간 동의    어피치형 1점
 동의    어피치형 2점
 매우 동의    어피치형 3점
 이때 검사자가 질문에서 약간 동의 선택지를 선택할 경우 어피치형(A) 성격 유형 1점을 받게 됩니다. 만약 검사자가 매우 비동의 선택지를 선택할 경우 네오형(N) 성격 유형 3점을 받게 됩니다.

 위 예시처럼 네오형이 비동의, 어피치형이 동의인 경우만 주어지지 않고, 질문에 따라 네오형이 동의, 어피치형이 비동의인 경우도 주어질 수 있습니다.
 하지만 각 선택지는 고정적인 크기의 점수를 가지고 있습니다.

 매우 동의나 매우 비동의 선택지를 선택하면 3점을 얻습니다.
 동의나 비동의 선택지를 선택하면 2점을 얻습니다.
 약간 동의나 약간 비동의 선택지를 선택하면 1점을 얻습니다.
 모르겠음 선택지를 선택하면 점수를 얻지 않습니다.
 검사 결과는 모든 질문의 성격 유형 점수를 더하여 각 지표에서 더 높은 점수를 받은 성격 유형이 검사자의 성격 유형이라고 판단합니다. 단, 하나의 지표에서 각 성격 유형 점수가 같으면, 두 성격 유형 중 사전 순으로 빠른 성격 유형을 검사자의 성격 유형이라고 판단합니다.

 질문마다 판단하는 지표를 담은 1차원 문자열 배열 survey와 검사자가 각 질문마다 선택한 선택지를 담은 1차원 정수 배열 choices가 매개변수로 주어집니다. 이때, 검사자의 성격 유형 검사 결과를 지표 번호 순서대로 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ survey의 길이 ( = n) ≤ 1,000
 survey의 원소는 "RT", "TR", "FC", "CF", "MJ", "JM", "AN", "NA" 중 하나입니다.
 survey[i]의 첫 번째 캐릭터는 i+1번 질문의 비동의 관련 선택지를 선택하면 받는 성격 유형을 의미합니다.
 survey[i]의 두 번째 캐릭터는 i+1번 질문의 동의 관련 선택지를 선택하면 받는 성격 유형을 의미합니다.
 choices의 길이 = survey의 길이

 choices[i]는 검사자가 선택한 i+1번째 질문의 선택지를 의미합니다.
 1 ≤ choices의 원소 ≤ 7
 choices    뜻
 1    매우 비동의
 2    비동의
 3    약간 비동의
 4    모르겠음
 5    약간 동의
 6    동의
 7    매우 동의
*/
func solution11(_ survey:[String], _ choices:[Int]) -> String {
    var dic:[Character:Int] = [:]
    for i in 0...survey.count-1 {
        var char:Character = survey[i].last!
        if dic[char] == nil {
            dic[char] = choices[i] - 4
        } else {
            var count = dic[char]! + choices[i] - 4
            dic[char] = count
        }
        
    }
    var result:String = ""

    if dic["R"] ?? 0 >= dic["T"] ?? 0 {
        result += "R"
    } else {
        result += "T"
    }
    if dic["C"] ?? 0 >= dic["F"] ?? 0 {
        result += "C"
    } else {
        result += "F"
    }
    if dic["J"] ?? 0 >= dic["M"] ?? 0 {
        result += "J"
    } else {
        result += "M"
    }
    if dic["A"] ?? 0 >= dic["N"] ?? 0 {
        result += "A"
    } else {
        result += "N"
    }
    return result
}

solution11(["AN", "CF", "MJ", "RT", "NA"],[5, 3, 2, 7, 5])
    
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
