
func isRange(_ y: Int, _ x: Int) -> Bool {
    (0..<n) ~= y && (0..<n) ~= x
}

func numbering(_ y: Int, _ x: Int, _ number: Int) {
    var isEdge = false
    for i in 0..<4 {
        let ny = y+dy[i], nx = x+dx[i]
        if !isRange(ny, nx) { continue }
        if g[ny][nx] == 0 { isEdge = true }
        if g[ny][nx] != -1 { continue }
        g[ny][nx] = number
        numbering(ny, nx, number)
    }
    if isEdge { e.append((y, x)) }
}

let n = Int(readLine()!)!
var g = [[Int]]()
var e = [(Int, Int)]()
var ans = Int.max
let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]

for _ in 0..<n {
    g.append(readLine()!.split{$0==" "}.map{-1*Int(String($0))!})
}

var number = 1
for i in 0..<n {
    for j in 0..<n where g[i][j] == -1 {
        g[i][j] = number
        numbering(i, j, number)
        number += 1
    }
}

for i in 0..<e.count {
    let (y1, x1) = e[i]
    for j in i+1..<e.count {
        let (y2, x2) = e[j]
        if g[y1][x1] == g[y2][x2] { continue }
        ans = min(ans, abs(y2-y1)+abs(x2-x1)-1)
    }
}

print(ans)