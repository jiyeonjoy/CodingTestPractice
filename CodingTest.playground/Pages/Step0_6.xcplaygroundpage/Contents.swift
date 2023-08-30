import Foundation

func solution34(_ arr:[Int], _ flag:[Bool]) -> [Int] {
    var a:[Int] = []
    for (i, v) in flag.enumerated() {
        if v {
            for _ in 0...arr[i]*2 {
                a.append(arr[i])
            }
        } else {
            for _ in 0...arr[i] {
                a.removeLast()
            }
        }
    }
    return a
}

func solution33(_ arr:[Int]) -> [Int] {
    var stk:[Int] = []
    var i = 0
    while i < arr.count {
        if stk.isEmpty {
            stk.append(arr[i])
            i += 1
        } else if stk.last! == arr[i] {
            stk.removeLast()
            i += 1
        } else {
            stk.append(arr[i])
            i += 1
        }
    }
    return stk.isEmpty ? [-1] : stk
}

func solution32(_ arr:[Int], _ k:Int) -> [Int] {
    var a:[Int] = []
    for n in arr {
        if !a.contains(n) {
            a.append(n)
            if a.count == k {
                break
            }
        }
    }
    if a.count < k {
        for _ in 1...k-a.count {
            a.append(-1)
        }
    }
    return a
}

func solution31(_ myString:String) -> String {
    return myString.lowercased().replacingOccurrences(of: "a", with: "A")
}

func solution30(_ my_string:String, _ alp:String) -> String {
    return my_string.replacingOccurrences(of: alp, with: alp.uppercased())
}

solution30("programmers","p")

func solution29(_ myString:String, _ pat:String) -> String {
    var arr1 = Array(myString)
    var arr2 = Array(pat)
    while arr1.count > 0 && arr1.count > arr2.count {
        var isM = true
        for i in arr1.count-arr2.count..<arr1.count {
            if arr1[i] != arr2[i-arr1.count+arr2.count] {
                isM = false
                arr1.removeLast()
                break
            }
        }
        if isM { break }
    }
    return String(arr1)
}

solution29("AbCdEFG", "dE")

func solution28(_ myString:String, _ pat:String) -> Int {
    if pat.count > myString.count {
        return 0
    }
    let arr1 = Array(myString)
    let arr2 = Array(pat)
    var a = 0
    for i in 0...myString.count-pat.count {
        var isM = true
        for j in 0..<pat.count {
            if arr1[i+j] != arr2[j] {
                isM = false
                break
            }
        }
        if isM { a += 1}
    }
    return a
}

func solution27(_ strArr:[String]) -> [String] {
    var a:[String] = []
    for s in strArr {
        if !s.contains("ad") {
            a.append(s)
        }
    }
    return a
//    return strArr.filter{ !$0.contains("ad") } // 시간초과!!
}

func solution26(_ my_string:String) -> [String] {
    return my_string.components(separatedBy: " ").filter{ !$0.isEmpty }
}

solution26(" i    love  you")

func solution25(_ num_list:[Int]) -> Int {
    if num_list.count >= 11 {
        return num_list.reduce(0, +)
    } else {
        return num_list.reduce(1, *)
    }
}

func solution24(_ myString:String, _ pat:String) -> Int {
    let s1 = myString.lowercased()
    let s2 = pat.lowercased()
    return s1.contains(s2) ? 1 : 0
}

func solution23(_ myString:String) -> String {
    return myString.uppercased()
}

func solution22(_ strArr:[String]) -> [String] {
    var a:[String] = []
    for (i, v) in strArr.enumerated() {
        if i%2 == 0 {
            a.append(v.lowercased())
        } else {
            a.append(v.uppercased())
        }
    }
    return a
}

func solution21(_ numbers:[Int], _ n:Int) -> Int {
    if numbers[0] > n {
        return numbers[0]
    }
    var s = 0
    var e = numbers.count-1
    var i = (s+e)/2
    while e-s > 1 {
        let sum = numbers[0...i].reduce(0, +)
        if sum > n {
            e = i
        } else {
            s = i
        }
        i = s+((e-s)/2)
    }
    let sum1 = numbers[0...s].reduce(0, +)
    let sum2 = numbers[0...e].reduce(0, +)
    return sum1 > n ? sum1 : sum2
}

solution21([1, 1, 1, 1, 1], 2)

func solution20(_ num_list:[Int]) -> Int {
    var a = 0
    for num in num_list {
        var c = 0
        var n = num
        while n > 1 {
            c += 1
            if n%2 == 0 {
                n /= 2
            } else {
                n = (n-1)/2
            }
        }
        a += c
    }
    return a
}

solution20([12, 4, 15, 1, 14])

func solution19(_ arr:[Int]) -> Int {
    var list = arr
    var a = 0
    var isChange = true
    while isChange {
        isChange = false
        for (i, n) in list.enumerated() {
            if n >= 50 && n%2 == 0 {
                isChange = true
                list[i] /= 2
            } else if n < 50 && n%2 == 1 {
                isChange = true
                list[i] = n*2+1
            }
        }
        if !isChange {
            break
        } else {
            a += 1
        }
    }
    return a
}

solution19([1, 2, 3, 100, 99, 98])

func solution18(_ arr:[Int]) -> [Int] {
    var a = arr
    for (i, n) in arr.enumerated() {
        if n >= 50 {
            if  n%2 == 0 {
                a[i] /= 2
            }
        } else if n%2 == 1 {
            a[i] *= 2
        }
    }
    return a
}

func solution17(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var a = arr
    for query in queries {
        for i in query[0]...query[1] {
            a[i] += 1
        }
    }
    return a
}

func solution16(_ todo_list:[String], _ finished:[Bool]) -> [String] {
    var a:[String] = []
    for (i, v) in todo_list.enumerated() {
        if !finished[i] {
            a.append(v)
        }
    }
    return a
}

func solution15(_ names:[String]) -> [String] {
    var a:[String] = []
    for (i, v) in names.enumerated() {
        if i%5 == 0 {
            a.append(v)
        }
    }
    return a
}

func solution14(_ num_list:[Int], _ n:Int) -> [Int] {
    if n == num_list.count {
        return num_list
    }
    var a: [Int] = Array(num_list[n..<num_list.count])
    a.append(contentsOf: Array(num_list[0..<n]))
    return a
}

func solution13(_ str_list:[String]) -> [String] {
    let l = str_list.firstIndex(of: "l") ?? str_list.count
    let r = str_list.firstIndex(of: "r") ?? str_list.count
    if l == r {
        return []
    } else if l < r {
        if l == 0 {
            return []
        }
        return Array(str_list[0..<l])
    } else {
        return Array(str_list[r+1..<str_list.count])
    }
}

solution13([])

func solution12(_ num_list:[Int], _ n:Int) -> [Int] {
    return Array(num_list[0..<n])
}

func solution11(_ num_list:[Int], _ n:Int) -> [Int] {
    var a:[Int] = []
    for (i, v) in num_list.enumerated() {
        if i%n == 0 {
            a.append(v)
        }
    }
    return a
}

func solution10(_ num_list:[Int]) -> Int {
    var sum1 = 0
    var sum2 = 0
    for (i, v) in num_list.enumerated() {
        if i%2 == 0 {
            sum1 += v
        } else {
            sum2 += v
        }
    }
    return max(sum1, sum2)
}

func solution9(_ num_list:[Int], _ n:Int) -> [Int] {
    return Array(num_list[n-1..<num_list.count])
}

func solution8(_ arr:[Int], _ query:[Int]) -> [Int] {
    var a = arr
    for (i, v) in query.enumerated() {
        if i%2 == 0 {
            if v+1 < a.count {
                for _ in v+1..<a.count {
                    a.removeLast()
                }
            }
        } else {
            if v < a.count {
                for _ in 0..<v {
                    a.removeFirst()
                }
            }
        }
    }
    return a
}

solution8([0,1,2,3,4,5], [4,1,2])

func solution7(_ arr:[Int]) -> [Int] {
    guard let s = arr.firstIndex(of: 2), let e = arr.lastIndex(of: 2) else {
        return [-1]
    }
    return Array(arr[s...e])
}

func solution6(_ arr:[Int], _ intervals:[[Int]]) -> [Int] {
    var a:[Int] = []
    for interval in intervals {
        let s = interval[0]
        let e = interval[1]
        a.append(contentsOf: arr[s...e])
    }
    return a
}

solution6([1,2,3,4,5], [[1,3],[0,4]])

func solution5(_ my_string:String, _ indices:[Int]) -> String {
    var arr = Array(my_string)
    for i in indices {
        arr[i] = "."
    }
    
    return String(arr.filter{ $0 != "." })
}

func solution4(_ start:Int, _ end_num:Int) -> [Int] {
    var a:[Int] = []
    for n in 0...start-end_num {
        a.append(start-n)
    }
    return a
}

func solution3(_ arr:[Int], _ idx:Int) -> Int {
    if arr.count <= idx {
        return -1
    }
    var a = -1
    for i in idx..<arr.count {
        if arr[i] == 1 {
            a = i
            break
        }
    }
    return a
}

func solution2(_ n:Int, _ slicer:[Int], _ num_list:[Int]) -> [Int] {
    let a = slicer[0]
    let b = slicer[1]
    let c = slicer[2]

    var result:[Int] = []

    if n == 1 {
        result = Array(num_list[0...b])
    } else if n == 2 {
        result = Array(num_list[a..<num_list.count])
    } else if n == 3 {
        result = Array(num_list[a...b])
    } else {
        for i in a...b {
            if (i-a)%c == 0 {
                result.append(num_list[i])
            }
        }
    }
    return result
}

solution2(3, [1, 5, 2], [1, 2, 3, 4, 5, 6, 7, 8, 9])

func solution1(_ num_list:[Int]) -> Int {
    var a = -1
    for (i, v) in num_list.enumerated() {
        if v < 0 {
            a = i
            break
        }
    }
    return a
}
