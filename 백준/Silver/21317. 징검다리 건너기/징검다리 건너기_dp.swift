import Foundation

typealias Stone = (s: Int, l: Int)
let N = Int(readLine()!)!
var stones = crtStones()
let K = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: Int.max, count: 2), count: N+4)
dp[1][0] = 0; dp[1][1] = 0

for i in 1..<N {
    let (s, l) = (stones[i-1].s, stones[i-1].l)
    for j in 0..<2 {
        dp[i+1][j] = min(dp[i+1][j], dp[i][j]+s)
        dp[i+2][j] = min(dp[i+2][j], dp[i][j]+l)
    }
    dp[i+3][1] = min(dp[i+3][1], dp[i][0]+K)
}

print(dp[N].min()!)

func crtStones() -> [Stone] {
    var result = [Stone]()
    for _ in 0..<N-1 {
        let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
        result.append(Stone(s: input[0], l: input[1]))
    }
    return result
}
