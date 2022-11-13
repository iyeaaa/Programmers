
import Foundation

func isRange(_ y: Int, _ x: Int) -> Bool {
    (0..<n) ~= y && (0..<m) ~= x
}

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var g = [[Character]]()
var sy = 0, sx = 0
var q = [(Int, Int, Int)](), idx = 0
var v = (0..<n).map{_ in (0..<m).map{_ in false }}

for i in 0..<n {
    g.append(Array(readLine()!))
    for j in 0..<m {
        if g[i][j] == "*" {
            q.append((i, j, 0))
            v[i][j] = true
        } else if g[i][j] == "S" {
            sy = i; sx = j
            v[sy][sx] = true
        }
    }
}
q.append((sy, sx, 0))

while idx < q.count {
    let (y, x, cnt) = q[idx]; idx += 1
    for (ny, nx) in [(y+1,x),(y-1,x),(y,x-1),(y,x+1)] {
        if !isRange(ny, nx) { continue }
        if g[ny][nx] == "X" || v[ny][nx] { continue }
        if g[y][x] == "*" {
            if g[ny][nx] == "D" { continue }
            g[ny][nx] = "*"
            q.append((ny, nx, cnt+1))
            v[ny][nx] = true
        } else if g[ny][nx] != "*" {
            if g[ny][nx] == "D" {
                print(cnt+1)
                exit(0)
            }
            q.append((ny, nx, cnt+1))
            v[ny][nx] = true
        }
    }
}

print("KAKTUS")