import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    func dfs(_ x: Int, _ digit: Int) {
        if x == target && digit == n-1 {
            result += 1
        }
        if digit >= n-1 {
            return
        }
        dfs(x+numbers[digit+1], digit+1)
        dfs(x+(-1*numbers[digit+1]), digit+1)
    }
    var result = 0
    var n = numbers.count
    
    dfs(numbers[0], 0)
    dfs(-1*numbers[0], 0)
    
    return result
}
