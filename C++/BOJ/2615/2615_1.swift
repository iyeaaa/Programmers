/**
* 메모리: 79516 KB, 시간: 12 ms
* 2022.09.13
* by Alub
*/
import Foundation

var G = [[0]]
let (BLACK, WHITE, NONE) = (1, 2, 0)
let dy = [0, 1, 1, -1]
let dx = [1, 0, 1, 1]

for _ in 0..<19 {
    G.append([0]+readLine()!.split{$0==" "}.map{Int(String($0))!})
}

for i in 1...19 {
    for j in 1...19 {
        for k in 0..<4 {
            if G[i][j] == 0 { continue }
            if isWin(i, j, to: k) {
                print(G[i][j])
                print(i, j)
                exit(0)
            }
        }
    }
}

print(0)

func isRange(_ y: Int, _ x: Int) -> Bool {
    (1...19) ~= y && (1...19) ~= x
}

func isWin(_ y: Int, _ x: Int, to D: Int) -> Bool {
    var ny = y, nx = x
    for _ in 1...5 {
        if !isRange(ny, nx) {
            return false
        }
        if G[y][x] != G[ny][nx] {
            return false
        }
        ny += dy[D]
        nx += dx[D]
    }
    if isRange(ny, nx) && G[y][x] == G[ny][nx] {
        return false
    }
    if isRange(y-dy[D], x-dx[D]) && G[y-dy[D]][x-dx[D]] == G[y][x] {
        return false
    }
    return true
}