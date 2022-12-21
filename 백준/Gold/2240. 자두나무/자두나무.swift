
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let T = input[0], W = input[1]
var memo = [[Int]](repeating: [Int](repeating: Int.min, count: W+1), count: T+1)
var ans = 0

memo[0][0] = 0

for i in 1...T {
    let plum = Int(readLine()!)!
    for j in 0...W {
        let cur = j % 2 + 1
        if j == 0 {
            memo[i][j] = memo[i-1][0] + (cur==plum ? 1 : 0)
        } else
        if cur == plum {
            memo[i][j] = max(memo[i-1][j], memo[i-1][j-1]) + 1
        } else {
            memo[i][j] = max(memo[i-1][j-1], memo[i-1][j])
        }
    }
}

print(memo[T].max()!)