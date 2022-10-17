/**
* 메모리: 80344 KB, 시간: 176 ms
* 2022.10.17
* by Alub
*/
let N = Int(readLine()!)!
var G = [(Int, Int, Int)]()
var C = [[Int]](repeating: [Int](repeating: 1, count: 505), count: 505)
var memo = [[Int]](repeating: [Int](repeating: 1, count: 505), count: 505)
let dy = [-1, 0, 1, 0], dx = [0, -1, 0, 1]
var ans = 1

for i in 1...N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for j in 1...N {
        C[i][j] = input[j-1]
        G.append((i, j, input[j-1]))
    }
}

G.sort{$0.2 > $1.2}

for i in 0..<G.count {
    let (y, x, w) = G[i]
    for dir in 0..<4 {
        let ny = y + dy[dir], nx = x + dx[dir]
        if w >= C[ny][nx] { continue }
        memo[y][x] = max(memo[y][x], memo[ny][nx] + 1)
    }
    ans = max(ans, memo[y][x])
}

print(ans)