import Foundation

func factorial(_ n: Int) -> Int {
  var n = n
  var result = 1
  while n > 1 {
    result *= n
    n -= 1
  }
  return result
}

factorial(5)
