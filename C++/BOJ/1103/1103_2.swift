/**
* 메모리: 79572 KB, 시간: 12 ms
* 2022.10.04
* by Alub
*/
import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]
var G = [[Character]]()
var V = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
var memo = Array(repeating: Array(repeating: -1, count: M), count: N)

for _ in 0..<N {
    G.append(Array(readLine()!))
}

print(f(0, 0))

func f(_ y: Int, _ x: Int) -> Int {
    if V[y][x] {
        print(-1)
        exit(0)
    }
    if memo[y][x] != -1 {
        return memo[y][x]
    }
    V[y][x] = true
    var biggest = 1
    for i in 0..<4 {
        let move = Int(String(G[y][x]))!
        let ny = y+dy[i]*move, nx = x+dx[i]*move
        guard (0..<N) ~= ny && (0..<M) ~= nx else {continue}
        if G[ny][nx] == "H" { continue }
        biggest = max(biggest, f(ny, nx)+1)
    }
    V[y][x] = false
    memo[y][x] = biggest
    return biggest
}

