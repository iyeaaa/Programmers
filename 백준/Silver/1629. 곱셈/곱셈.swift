
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
var (A, B, MOD) = (ip[0], ip[1], ip[2])
var dp = [Int: Int]()

print(f(B))

func f(_ x: Int) -> Int {
    if x == 1 { return A%MOD }
    if dp[x,default: -1] != -1 { return dp[x]! }
    if x % 2 == 0 {
        dp[x] = f(x/2)*f(x/2)%MOD
        return dp[x]!
    }
    dp[x] = ((f(x/2)*f(x/2) % MOD) * A) % MOD
    return dp[x]!
}