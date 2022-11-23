
let MOD = 1_000_000_007
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (S, A, B, C) = (input[0], input[1], input[2], input[3])
var dp = (0...S).map{_ in (0...A).map{_ in (0...B).map{_ in (0...C).map{_ in -1}}}}

print(f(S, A, B, C))

func f(_ s: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
    if s<0 || a<0 || b<0 || c<0 { return 0 }
    if s==0 && a==0 && b==0 && c==0 { return 1 }
    if dp[s][a][b][c] != -1 { return dp[s][a][b][c] }

    var temp = 0
    temp = (temp + f(s-1, a-1, b, c)) % MOD
    temp = (temp + f(s-1, a-1, b-1, c)) % MOD
    temp = (temp + f(s-1, a-1, b-1, c-1)) % MOD
    temp = (temp + f(s-1, a-1, b, c-1)) % MOD
    temp = (temp + f(s-1, a, b-1, c)) % MOD
    temp = (temp + f(s-1, a, b-1, c-1)) % MOD
    temp = (temp + f(s-1, a, b, c-1)) % MOD

    dp[s][a][b][c] = temp
    return temp
}