
let fire = 0, ppl = 1
let dy = [-1, 0, 1, 0], dx = [0, -1, 0, 1]
var ans = ""

for _ in 0..<Int(readLine()!)! {
    func isRange(_ y: Int, _ x: Int) -> Bool {
        (0..<h) ~= y && (0..<w) ~= x
    }

    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (w, h) = (input[0], input[1])
    var v = [[Int]](repeating: [Int](repeating: 9999, count: w), count: h)
    var g = [[Character]]()
    var q = [(Int, Int, Int)](), idx = 0
    var escape = false

    for i in 0..<h {
        g.append(Array(readLine()!))
        for j in 0..<w {
            if g[i][j] == "*" {
                q.append((i, j, fire))
                v[i][j] = 0
            }
        }
    }

    for i in 0..<h {
        for j in 0..<w where g[i][j] == "@" {
            q.append((i, j, ppl))
            v[i][j] = 0
        }
    }

    f: while idx < q.count {
        let (y, x, me) = q[idx]; idx += 1
        for i in 0..<4 {
            let ny = y+dy[i], nx = x+dx[i]
            if !isRange(ny, nx) {
                if me == fire { continue }
                escape = true
                ans += "\(v[y][x]+1)\n"
                break f
            }
            if g[ny][nx] == "#" { continue }
            if me == fire {
                if g[ny][nx] == "*" { continue }
                g[ny][nx] = "*"
                q.append((ny, nx, fire))
            } else {
                if v[ny][nx] != 9999 || g[ny][nx] == "*" { continue }
                v[ny][nx] = v[y][x] + 1
                q.append((ny, nx, ppl))
            }
        }
    }

    if !escape { ans += "IMPOSSIBLE\n" }
}

print(ans)