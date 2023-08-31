import Foundation

func solution20(_ date1:[Int], _ date2:[Int]) -> Int {
    if date1[0] == date2[0] {
        if date1[1] == date2[1] {
            if date1[2] >= date2[2] {
                return 0
            }
        } else if date1[1] > date2[1] {
            return 0
        }
    } else if date1[0] > date2[0] {
        return 0
    }
    return 1
}

func solution191(_ order:[String]) -> Int {
    let latte = order.filter{ $0.contains("latte") }.count
    let americano = order.count-latte
    return latte*5000+americano*4500
}

func solution19(_ order:[String]) -> Int {
    let americano = 4500
    let latte = 5000
    var a = 0
    for s in order {
        if s.contains("latte") {
            a += latte
        } else {
            a += americano
        }
    }
    return a
}

solution19(["cafelatte", "americanoice", "hotcafelatte", "anything"]) // 19000

func solution18(_ picture:[String], _ k:Int) -> [String] {
    var a:[String] = []
    for p in picture {
        var str = ""
        for c in p {
            for _ in 1...k {
                str.append(c)
            }
        }
        for _ in 1...k {
            a.append(str)
        }
    }
    return a
}

solution18(["x.x", ".x.", "x.x"], 3)
//["xxx...xxx", "xxx...xxx", "xxx...xxx", "...xxx...", "...xxx...", "...xxx...", "xxx...xxx", "xxx...xxx", "xxx...xxx"]

func solution17(_ arr:[Int], _ k:Int) -> [Int] {
    var arr = arr
    if k%2 == 0 {
        for (i, v) in arr.enumerated() {
            arr[i] = v+k
        }
    } else {
        for (i, v) in arr.enumerated() {
            arr[i] = v*k
        }
    }
    return arr
}

func solution16(_ myString:String) -> String {
    var arr = Array(myString)
    let alphabet = "abcdefghijk"
    for (i, c) in arr.enumerated() {
        if alphabet.contains(c) {
            arr[i] = "l"
        }
    }
    return String(arr)
}

func solution15(_ n:Int) -> [[Int]] {
    var arr = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
    for i in 0..<n {
        arr[i][i] = 1
    }
    return arr
}

func solution14(_ n:Int) -> [[Int]] {
    var arr = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
    var i = 0
    var j = 0
    var s = "r"
    for num in 1...n*n {
        if i < n && j < n {
            arr[i][j] = num
        }
        if num == n*n {
            break
        }
        if s == "r" {
            if j < n-1 && arr[i][j+1] == 0 {
                j += 1
            } else {
                i += 1
                s = "d"
            }
        } else if s == "d" {
            if i < n-1 && arr[i+1][j] == 0 {
                i += 1
            } else {
                j -= 1
                s = "l"
            }
        } else if s == "l" {
            if j > 0 && arr[i][j-1] == 0 {
                j -= 1
            } else {
                i -= 1
                s = "u"
            }
        } else {
            if i > 0 && arr[i-1][j] == 0 {
                i -= 1
            } else {
                j += 1
                s = "r"
            }
        }
    }
    return arr
}

solution14(4)

func solution13(_ arr:[[Int]]) -> Int {
    var isM = true
    for i in 0..<arr.count {
        for j in 0..<arr.count {
            if arr[i][j] != arr[j][i] {
                isM = false
                break
            }
        }
        if !isM {
            break
        }
    }
    return isM ? 1 : 0
}

func solution12(_ arr:[[Int]]) -> [[Int]] {
    var arr = arr
    let c1 = arr.count
    let c2 = arr[0].count
    if c1 < c2 {
        for _ in 1...c2-c1 {
            arr.append(Array.init(repeating: 0, count: c2))
        }
    } else if c1 > c2 {
        for i in 0..<c1 {
            var a = arr[i]
            for _ in 1...c1-c2 {
                a.append(0)
            }
            arr[i] = a
        }
    }
    return arr
}

func solution11(_ board:[[Int]], _ k:Int) -> Int {
    var s = 0
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if i+j <= k {
                s += board[i][j]
            }
        }
    }
    return s
}

func solution10(_ n_str:String) -> Int {
    return Int(n_str) ?? 0
}

func solution9(_ n_str:String) -> String {
    var i = 0
    for s in Array(n_str) {
        if s == "0" {
            i += 1
        } else {
            break
        }
    }
    return String(Array(n_str)[i..<n_str.count])
}

func solution8(_ a:String, _ b:String) -> String {
    let aList = a.reversed().map { Int(String($0)) }
    let bList = b.reversed().map { Int(String($0)) }
    
    let maxCount = max(aList.count, bList.count)
    var sList:[Int] = Array.init(repeating: 0, count: maxCount+1)
    for i in 0..<maxCount {
        var n = 0
        if i < aList.count {
            n += aList[i] ?? 0
        }
        if i < bList.count {
            n += bList[i] ?? 0
        }
        let a = (sList[i]+n)%10
        let b = (sList[i]+n)/10
        sList[i] = a
        sList[i+1] = b
    }
    sList.reverse()
    if sList[0] == 0 {
        sList.removeFirst()
    }
    var a = ""
    for n in sList {
        a += String(n)
    }
    return a
}

solution8("18446744073709551615", "287346502836570928366") // "305793246910280479981"
solution8("582", "734") // "1316"

func solution7(_ n:Int) -> String {
    return String(n)
}

func solution6(_ arr:[Int], _ delete_list:[Int]) -> [Int] {
    return arr.filter{ !delete_list.contains($0) }
}

func solution5(_ my_string:String, _ target:String) -> Int {
    return my_string.contains(target) ? 1 : 0
}

func solution4(_ str1:String, _ str2:String) -> Int {
    return str2.contains(str1) ? 1 : 0
}

func solution3(_ str_list:[String], _ ex:String) -> String {
    var a = ""
    for str in str_list {
        if !str.contains(ex) {
            a.append(str)
        }
    }
    return a
}

func solution2(_ num_list:[Int], _ n:Int) -> Int {
    return num_list.contains(n) ? 1 : 0
}

func solution1(_ a:Int, _ b:Int) -> Int {
    if a%2 == 1 && b%2 == 1 {
        return a*a+b*b
    } else if a%2 == 1 || b%2 == 1 {
        return 2*(a+b)
    } else {
        return abs(a-b)
    }
}
