
@discardableResult
func f(_ digit: Int, _ remainder: Int, _ isFive: Int) -> Int {
    if digit == N {
        if remainder == 0 && isFive == 1 {
            ans += 1
            return 1
        }
        return 0
    }
    if dp[digit][remainder][isFive] != -1 {
        ans += dp[digit][remainder][isFive]
        return dp[digit][remainder][isFive]
    }
    var temp = f(digit+1, (remainder+1)%3, 0)
    temp = (temp + f(digit+1, (remainder+5)%3, 1) % MOD)
    dp[digit][remainder][isFive] = temp
    return temp
}

let MOD = 1_000_000_007
let N = Int(readLine()!)!
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2), count: 15), count: N+1)
var ans = 0

f(0, 0, 0)
print(ans % MOD)
