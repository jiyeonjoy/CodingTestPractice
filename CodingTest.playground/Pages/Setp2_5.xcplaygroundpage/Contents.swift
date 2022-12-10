import Foundation

/* 디펜스 게임

 - 준호는 요즘 디펜스 게임에 푹 빠져 있습니다. 디펜스 게임은 준호가 보유한 병사 n명으로 연속되는 적의 공격을 순서대로 막는 게임입니다. 디펜스 게임은 다음과 같은 규칙으로 진행됩니다.
 
 준호는 처음에 병사 n명을 가지고 있습니다.
 매 라운드마다 enemy[i]마리의 적이 등장합니다.
 남은 병사 중 enemy[i]명 만큼 소모하여 enemy[i]마리의 적을 막을 수 있습니다.
 예를 들어 남은 병사가 7명이고, 적의 수가 2마리인 경우, 현재 라운드를 막으면 7 - 2 = 5명의 병사가 남습니다.
 남은 병사의 수보다 현재 라운드의 적의 수가 더 많으면 게임이 종료됩니다.
 게임에는 무적권이라는 스킬이 있으며, 무적권을 사용하면 병사의 소모없이 한 라운드의 공격을 막을 수 있습니다.
 무적권은 최대 k번 사용할 수 있습니다.
 준호는 무적권을 적절한 시기에 사용하여 최대한 많은 라운드를 진행하고 싶습니다.

 준호가 처음 가지고 있는 병사의 수 n, 사용 가능한 무적권의 횟수 k, 매 라운드마다 공격해오는 적의 수가 순서대로 담긴 정수 배열 enemy가 매개변수로 주어집니다. 준호가 몇 라운드까지 막을 수 있는지 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ n ≤ 1,000,000,000
 1 ≤ k ≤ 500,000
 1 ≤ enemy의 길이 ≤ 1,000,000
 1 ≤ enemy[i] ≤ 1,000,000
 enemy[i]에는 i + 1 라운드에서 공격해오는 적의 수가 담겨있습니다.
 모든 라운드를 막을 수 있는 경우에는 enemy[i]의 길이를 return 해주세요.
*/
//func solution111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
//    var min:Int = k-1
//    var max:Int = enemy.count-1
//    while true {
//        if min >= max {
//            return max+1
//        }
//        if max - min == 1 {
//            if min == k-1 {
//                if enemy[enemy.count-1] > n {
//                    return min
//                }
//            }
//            return max
//        }
//        var index:Int = min+(max-min)/2
//        var sum:Int = enemy[0...index].sorted(by: <)[0...index-k].reduce(0,+)
//        if sum == n {
//            return index+1
//        } else if sum < n {
//            min = index
//        } else {
//            max = index
//        }
//    }
//}

//solution111(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5
func solution111111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var min:Int = 0
    while true {
        if sum >= n {
            if list.count > k {
                list = Array(list.sorted(by: >)[0...k-1])
                min = list[k-1]
                var newExceptSum:Int = list.reduce(0,+)
                sum = sum+exceptSum-newExceptSum
                exceptSum = newExceptSum
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            if enemy[result] > min {
                list.append(enemy[result])
            } else {
                min = enemy[result]
            }
            result += 1
        }
    }
}

func solution11111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var min:Int = 0
    while true {
        if sum >= n {
            if list.count > k {
                list = Array(list.sorted(by: >)[0...k-1])
                min = list[k-1]
                var newExceptSum:Int = list.reduce(0,+)
                sum = sum+exceptSum-newExceptSum
                exceptSum = newExceptSum
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            if enemy[result] > min {
                list.append(enemy[result])
            }
            result += 1
        }
    }
}

func solution1111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1]).sorted(by: <)
    var min:Int = list[0]
    while true {
        if sum > n {
            return result-1
        } else if sum == n {
            return result
        } else if result == enemy.count {
            return result
        } else {
            if enemy[result] <= min {
                sum += enemy[result]
            } else {
                sum += min
                list.append(enemy[result])
                list.remove(at: 0)
                list.sort()
                min = list[0]
            }
            result += 1
        }
    }
}

solution1111111(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5

func solution111111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    var min:Int = list.min() ?? 0
    while true {
        if sum >= n {
            if list.count > k {
                list = Array(list.sorted(by: >)[0...k-1])
                min = list[k-1]
                var newExceptSum:Int = list.reduce(0,+)
                sum = sum+exceptSum-newExceptSum
                exceptSum = newExceptSum
            }
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            if enemy[result] > min {
                list.append(enemy[result])
            }
            result += 1
        }
    }
}

func solution11111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    while true {
        if sum >= n {
            if list.count > k {
                list = Array(list.sorted(by: >)[0...k-1])
            }
            var newExceptSum:Int = list.reduce(0,+)
            sum = sum+exceptSum-newExceptSum
            exceptSum = newExceptSum
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            list.append(enemy[result])
            result += 1
        }
    }
}

func solution1111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    while true {
        if sum >= n {
            var newList:[Int] = enemy[0...result-1].sorted(by: >)
            sum = newList[k...result-1].reduce(0,+)
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            result += 1
        }
    }
}

func solution111(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var sum:Int = 0
    var list:[Int] = Array(enemy[0...k-1])
    var exceptSum = list.reduce(0, +)
    while true {
        if sum >= n {
            var newExceptSum:Int = enemy[0...result-1].sorted(by: >)[0...k-1].reduce(0,+)
            sum = sum+exceptSum-newExceptSum
            exceptSum = newExceptSum
            if sum > n {
                return result-1
            } else if sum == n {
                return result
            } else {
                sum += enemy[result]
                result += 1
            }
        } else if result == enemy.count {
            return result
        } else {
            sum += enemy[result]
            result += 1
        }
    }
}

solution111(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5

func solution11(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    var result:Int = k
    var list:[Int] = Array(enemy[0...k-1])
    var sum:Int = 0
    while true {
        if sum > n {
            return result-1
        } else if sum == n {
            return result
        } else if result == enemy.count {
            return result
        } else {
            var min:Int = list.min() ?? 0
            if enemy[result] <= min {
                sum += enemy[result]
            } else {
                sum += min
                list[list.firstIndex(of: min)!] = enemy[result]
            }
            result += 1
        }
    }
}

solution11(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5

func solution1(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    
    var list:[Int] = Array(enemy[0...k]).sorted(by: <)
    while true {
        if list[0...list.count-k-1].reduce(0, +) > n {
            return list.count-1
        } else if list[0...list.count-k-1].reduce(0, +) == n {
            return list.count
        } else if list.count == enemy.count {
            return list.count
        } else {
            list.append(enemy[list.count])
            list.sort()
        }
    }
}

solution1(7, 3, [4, 2, 4, 5, 3, 3, 1]) // 5
