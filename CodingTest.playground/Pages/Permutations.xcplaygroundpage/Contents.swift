import Foundation

func permutations(_ n: Int, _ k: Int) -> Int {
  var n = n
  var answer = n
  for _ in 1..<k {
    n -= 1
    answer *= n
  }
  return answer
}

permutations(5, 3)   // returns 60
permutations(50, 6)  // returns 11441304000
permutations(9, 4)   // returns 3024

func permuteWirth<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        print(a)   // display the current permutation
    } else {
        var a = a
        permuteWirth(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteWirth(a, n - 1)
            a.swapAt(i, n)
        }
    }
}

let letters = ["a", "b", "c", "d", "e"]
permuteWirth(letters, letters.count - 1)

