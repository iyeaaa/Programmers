/**
* 메모리: 83252 KB, 시간: 140 ms
* 2022.10.13
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var G = [[Int]](repeating: [Int](repeating: 0, count: 1005), count: 1005)
var v = [(x: Int, y: Int, w: Int)]()
var memo = [[Int]](repeating: [Int](repeating: 0, count: 1005), count: 1005)

for i in 1...N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for j in 1...M {
        G[i][j] = input[j-1]
        v.append((i, j, G[i][j]))
    }
}

memo[1][1] = 1
v.sort{$0.w > $1.w}

for i in 0..<v.count {
    let px = v[i].x, py = v[i].y
    if G[px-1][py] > G[px][py] {
        memo[px][py] += memo[px-1][py]
    }
    if G[px][py-1] > G[px][py] {
        memo[px][py] += memo[px][py-1]
    }
    if G[px+1][py] > G[px][py] {
        memo[px][py] += memo[px+1][py]
    }
    if G[px][py+1] > G[px][py] {
        memo[px][py] += memo[px][py+1]
    }
}

print(memo[N][M])