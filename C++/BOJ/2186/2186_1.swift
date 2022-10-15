/**
* 메모리: 69376 KB, 시간: 420 ms
* 2022.10.15
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M, K) = (input[0], input[1], input[2])
var G = [[Character]]()
var T: [Character]
var memo = (0..<N).map{_ in (0..<M).map{_ in 0}}
let dy = [-1, 0, 1, 0], dx = [0, -1, 0, 1]
var ans = 0

for _ in 0..<N {
    G.append(Array(readLine()!))
}
T = Array(readLine()!).reversed()

for i in 0..<N {
    for j in 0..<M where G[i][j] == T.first! {
        memo[i][j] = 1
    }
}

for idx in 1..<T.count {
    var temp = (0..<N).map{_ in (0..<M).map{_ in 0}}
    for y in 0..<N {
        for x in 0..<M where G[y][x] == T[idx] {
            for n in 0..<4 {
                for k in 1...K {
                    let ny = y + dy[n]*k, nx = x + dx[n]*k
                    if !isRange(ny, nx) { continue }
                    if G[ny][nx] != T[idx-1] { continue }
                    temp[y][x] += memo[ny][nx]
                }
            }
        }
    }
    for y in 0..<N {
        for x in 0..<M where G[y][x] == T[idx] {
            memo[y][x] = temp[y][x]
        }
    }
}

for i in 0..<N {
    for j in 0..<M where G[i][j] == T.last! {
        ans += memo[i][j]
    }
}

print(ans)

func isRange(_ y: Int, _ x: Int) -> Bool {
    (0..<N) ~= y && (0..<M) ~= x
}
