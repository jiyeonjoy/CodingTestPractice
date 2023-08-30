import Foundation

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
