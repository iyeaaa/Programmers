/**
* 메모리: 70476 KB, 시간: 28 ms
* 2022.10.16
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var G = [[Int](repeating: 0, count: M+4)]
var memo: [[Int]]

for _ in 0..<N {
    G.append([0]+readLine()!.split{$0==" "}.map{Int(String($0))!})
}
memo = G

for i in 1...N {
    for j in 1...M {
        memo[i][j] += max(memo[i-1][j], memo[i][j-1])
    }
}

print(memo[N][M])