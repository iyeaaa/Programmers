
func isRange(_ y: Int, _ x: Int) -> Bool {
    (0..<12) ~= y && (0..<6) ~= x
}

func check(_ y: Int, _ x: Int, _ color: Character, _ cnt: Int, _ v: inout [[Bool]]) -> Bool {
    var q = [(y, x)], idx = 0
    v[y][x] = true
    var cnt = 1

    while q.count - idx > 0 {
        let (y, x) = q[idx]; idx += 1
        for i in 0..<4 {
            let ny = y+dy[i], nx = x+dx[i]
            if !isRange(ny, nx) { continue }
            if v[ny][nx] { continue }
            if g[ny][nx] != color { continue }
            q.append((ny, nx))
            v[ny][nx] = true
            cnt += 1
        }
    }

    if cnt < 4 { return false }

    for (y, x) in q {
        g[y][x] = "."
    }

    return true
}

let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]
var g = [[Character]]()
for _ in 0..<12 { g.append(Array(readLine()!)) }

for time in 0... {
    var v = [[Bool]](repeating: [Bool](repeating: false, count: 6), count: 12)
    var change = false
    for i in 0..<12 {
         for j in 0..<6 where g[i][j] != "." && !v[i][j] {
            if check(i, j, g[i][j], 1, &v) {
                change = true
            }
        }
    }
    if !change {
        print(time); break
    }
    for i in stride(from: 10, through: 0, by: -1) {
        for j in 0..<6 {
            var cur = i
            while cur+1 < 12 && g[cur][j] != "." && g[cur+1][j] == "." {
                g[cur+1][j] = g[cur][j]
                g[cur][j] = "."
                cur += 1
            }
        }
    }
}

