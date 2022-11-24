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
/* 겹치는 선분의 길이

 - 빨간색, 초록색, 파란색 선분이 x축 위에 있습니다. 세 선분의 x좌표 시작과 끝이 [[start, end], [start, end], [start, end]] 형태로 들어있는 2차원 배열 lines가 매개변수로 주어질 때, 두 개 이상의 선분이 겹치는 부분의 길이를return 하도록 solution 함수를 완성해보세요.
 
 lines가 [[0, 2], [-3, -1], [-2, 1]]일 때 그림으로 나타내면 다음과 같습니다.

 선분이 두 개 이상 겹친 곳은 [-2, -1], [0, 1]로 2만큼 겹쳐있습니다.
*/
func solution4(_ lines:[[Int]]) -> Int {
    var result = Set<Int>()
    for i in lines[0][0]+1...lines[0][1] {
        if (i > lines[1][0] && i <= lines[1][1]) ||
            (i > lines[2][0] && i <= lines[2][1]) {
            result.insert(i)
        }
    }
    for i in lines[1][0]+1...lines[1][1] {
        if (i > lines[2][0] && i <= lines[2][1]) {
            result.insert(i)
        }
    }
    return result.count
}

/* 평행

 - 점 네 개의 좌표를 담은 이차원 배열  dots가 다음과 같이 매개변수로 주어집니다.
 
 [[x1, y1], [x2, y2], [x3, y3], [x4, y4]]
 주어진 네 개의 점을 두 개씩 이었을 때, 두 직선이 평행이 되는 경우가 있으면 1을 없으면 0을 return 하도록 solution 함수를 완성해보세요.
*/
func solution3(_ dots:[[Int]]) -> Int {
    if Double(dots[0][1] - dots[1][1])/Double(dots[0][0]-dots[1][0])
    == Double(dots[2][1] - dots[3][1])/Double(dots[2][0]-dots[3][0]) {
        return 1
    }
    if Double(dots[0][1] - dots[2][1])/Double(dots[0][0]-dots[2][0])
    == Double(dots[1][1] - dots[3][1])/Double(dots[1][0]-dots[3][0]) {
        return 1
    }
    if Double(dots[0][1] - dots[3][1])/Double(dots[0][0]-dots[3][0])
    == Double(dots[2][1] - dots[1][1])/Double(dots[2][0]-dots[1][0]) {
        return 1
    }
    return 0
}

/* 저주의 숫자 3

 - 3x 마을 사람들은 3을 저주의 숫자라고 생각하기 때문에 3의 배수와 숫자 3을 사용하지 않습니다. 3x 마을 사람들의 숫자는 다음과 같습니다.
 
 10진법    3x 마을에서 쓰는 숫자    10진법    3x 마을에서 쓰는 숫자
 1    1    6    8
 2    2    7    10
 3    4    8    11
 4    5    9    14
 5    7    10    16
 정수 n이 매개변수로 주어질 때, n을 3x 마을에서 사용하는 숫자로 바꿔 return하도록 solution 함수를 완성해주세요.
*/
func solution2(_ n: Int) -> Int {
    var answer = 0

    for i in 1..<n + 1 {
        answer += 1
        while answer % 3 == 0 || String(answer).contains("3") {
            answer += 1
        }
    }
    return answer
}

func solution(_ n:Int) -> Int {
    var result:Int = 0
    var list:[Int] = []
    while list.count != n {
        result += 1
        if (result%3 != 0 && !String(result).contains("3")) {
            list.append(result)
        }
    }
    return result
}

solution(15)
