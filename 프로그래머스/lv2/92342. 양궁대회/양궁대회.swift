import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var maxValue = -1
    var result = [Int]()

    func dfs(_ cur: Int, _ lian: [Int], _ sum: Int) {
        var lian = lian
        if sum == n {
            let dif = isWin(lian)
            if dif != -1 && maxValue < dif {
                result = lian
                maxValue = dif
            } else if dif != -1 && maxValue == dif && isPsb(lian) {
                result = lian
            }
            return
        }
        if cur > 10 {
            return
        }
        for i in 0...n where sum + i <= n {
            lian[cur] = i
            dfs(cur+1, lian, sum+i)
        }
    }

    func isWin(_ lian: [Int]) -> Int {
        var (l, u) = (0, 0)
        for i in stride(from: 10, through: 0, by: -1) {
            if lian[10-i] == 0 && info[10-i] == 0 {
                continue
            }
            if lian[10-i] > info[10-i] {
                l += i
            } else {
                u += i
            }
        }
        if u >= l {
            return -1
        } else {
            return l - u
        }
    }

    func isPsb(_ lian: [Int]) -> Bool {
        if result.isEmpty { return true }
        for i in stride(from: 10, through: 0, by: -1) {
            if lian[i] > result[i] {
                return true
            } else if lian[i] < result[i] {
                return false
            }
        }
        return false
    }

    dfs(0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 0)

    if maxValue == -1 {
        return [-1]
    } else {
        return result
    }
}
