/**
* 메모리: 79516 KB, 시간: 12 ms
* 2022.09.19
* by Alub
*/
import Foundation

let N = Int(readLine()!)!
var G = [[String]]()
var T = [(Int, Int)]()
var X = [(Int, Int)]()
let dy = [-1, 0, 1, 0]
let dx = [0, -1, 0, 1]

for i in 0..<N {
    G.append(readLine()!.split(separator: " ").map{String($0)})
    for j in 0..<N {
        if G[i][j] == "X" {
            X.append((i, j))
        } else if G[i][j] == "T" {
            T.append((i, j))
        }
    }
}

func isPsb() -> Bool {
    for (y, x) in T {
        for i in 0..<4 {
            var ny = y+dy[i], nx = x+dx[i]
            while (0..<N) ~= ny && (0..<N) ~= nx && G[ny][nx] == "X" {
                ny += dy[i]; nx += dx[i]
            }
            guard (0..<N) ~= ny && (0..<N) ~= nx else {
                continue
            }
            if G[ny][nx] == "S" {
                return false
            }
        }
    }
    return true
}

for i in stride(from: 0, to: X.count, by: 1) {
    for j in stride(from: i+1, to: X.count, by: 1) {
        for k in stride(from: j+1, to: X.count, by: 1) {
            G[X[i].0][X[i].1] = "O"
            G[X[j].0][X[j].1] = "O"
            G[X[k].0][X[k].1] = "O"
            if isPsb() { print("YES"); exit(0) }
            G[X[i].0][X[i].1] = "X"
            G[X[j].0][X[j].1] = "X"
            G[X[k].0][X[k].1] = "X"
        }
    }
}

print("NO")