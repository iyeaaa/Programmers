/**
* 메모리: 163852 KB, 시간: 508 ms
* 2022.10.15
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var G = [(0..<1005).map{_ in 0}]
var t = (0..<1005).map{_ in (0..<1005).map{_ in (0..<2).map{_ in 0}}}
var memo = (0..<1005).map{_ in (0..<1005).map{_ in 0}}

for _ in 0..<N {
    G.append([0]+readLine()!.split{$0==" "}.map{Int(String($0))!}+[0])
}

memo[1][1] = G[1][1]
for i in 1...M { memo[1][i] = memo[1][i-1] + G[1][i] }
for i in stride(from: 2, through: N, by: 1) {
    for j in stride(from: 1, through: M, by: 1) {
        t[i][j][0] = memo[i-1][j] + G[i][j]
        t[i][j][1] = memo[i-1][j] + G[i][j]
    }
    for j in stride(from: 2, through: M, by: 1) {
        t[i][j][0] = max(t[i][j][0], t[i][j-1][0] + G[i][j])
    }
    for j in stride(from: M-1, to: 0, by: -1) {
        t[i][j][1] = max(t[i][j][1], t[i][j+1][1] + G[i][j])
    }
    for j in stride(from: 1, through: M, by: 1) {
        memo[i][j] = t[i][j].max()!
    }
}

print(memo[N][M])