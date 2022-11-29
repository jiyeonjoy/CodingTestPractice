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

/*

 -
*/

/* 짝지어 제거하기

 - 짝지어 제거하기는, 알파벳 소문자로 이루어진 문자열을 가지고 시작합니다. 먼저 문자열에서 같은 알파벳이 2개 붙어 있는 짝을 찾습니다. 그다음, 그 둘을 제거한 뒤, 앞뒤로 문자열을 이어 붙입니다. 이 과정을 반복해서 문자열을 모두 제거한다면 짝지어 제거하기가 종료됩니다. 문자열 S가 주어졌을 때, 짝지어 제거하기를 성공적으로 수행할 수 있는지 반환하는 함수를 완성해 주세요. 성공적으로 수행할 수 있으면 1을, 아닐 경우 0을 리턴해주면 됩니다.
 
 예를 들어, 문자열 S = baabaa 라면

 b aa baa → bb aa → aa →

 의 순서로 문자열을 모두 제거할 수 있으므로 1을 반환합니다.

 제한사항
 문자열의 길이 : 1,000,000이하의 자연수
 문자열은 모두 소문자로 이루어져 있습니다.
*/
func solution2(_ s:String) -> Int {
    if s.count%2 != 0 {
        return 0
    }
    var sList:[Character] = Array(s)
    var list:[Character] = [ sList[0] ]
    for i in 1...sList.count-1 {
        if list.count == 0 || sList[i] != list[list.count-1] {
            list.append(sList[i])
        } else {
            list.remove(at: list.count-1)
        }
    }
    return list.count == 0 ? 1 : 0
}

/* N개의 최소공배수

 - 두 수의 최소공배수(Least Common Multiple)란 입력된 두 수의 배수 중 공통이 되는 가장 작은 숫자를 의미합니다. 예를 들어 2와 7의 최소공배수는 14가 됩니다. 정의를 확장해서, n개의 수의 최소공배수는 n 개의 수들의 배수 중 공통이 되는 가장 작은 숫자가 됩니다. n개의 숫자를 담은 배열 arr이 입력되었을 때 이 수들의 최소공배수를 반환하는 함수, solution을 완성해 주세요.
 
 제한 사항
 arr은 길이 1이상, 15이하인 배열입니다.
 arr의 원소는 100 이하인 자연수입니다.
*/
// 최대공약수
func gcd(_ a: Int, _ b: Int) -> Int{
    if (b == 0) { return a }
    return gcd(b, a % b)
}

// 최소공배수
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
func solution1(_ arr:[Int]) -> Int {
    var sorted:[Int] = arr.sorted(by: >)
    var result:Int = sorted[0]
    
    for i in 1...sorted.count-1 {
        if result%sorted[i] > 0 {
            result = lcm(result,sorted[i])
        }
    }
    return result
}

solution1([2,6,8,14])
