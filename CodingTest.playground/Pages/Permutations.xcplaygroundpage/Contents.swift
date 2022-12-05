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

func permute<C: Collection>(items: C) -> [[C.Iterator.Element]] {
    var scratch = Array(items) // This is a scratch space for Heap's algorithm
    var result: [[C.Iterator.Element]] = [] // This will accumulate our result

    // Heap's algorithm
    func heap(_ n: Int) {
        if n == 1 {
            result.append(scratch)
            return
        }

        for i in 0..<n-1 {
            heap(n-1)
            let j = (n%2 == 1) ? 0 : i
            scratch.swapAt(j, n-1)
        }
        heap(n-1)
    }

    // Let's get started
    heap(scratch.count)

    // And return the result we built up
    return result
}

// We could make an overload for permute() that handles strings if we wanted
// But it's often good to be very explicit with strings, and make it clear
// that we're permuting Characters rather than something else.

let string = "ABCD"
let perms = permute(items: Array(string)) // Get the character permutations
let permStrings = perms.map() { String($0) } // Turn them back into strings
print(permStrings)
