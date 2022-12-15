
extension Character {
    var code: Int {
        Int(unicodeScalars.first!.value) - (isUppercase ? 65 : 97)
    }
}

var ans = ""
let INF = 9999, dy = [-1,0,1,0], dx = [0,-1,0,1]

for _ in 0..<Int(readLine()!)! {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (h, w) = (ip[0], ip[1])
    var g = [[Character](repeating: ".", count: w+2)]
    var v = [[Bool]](repeating: [Bool](repeating: false, count: w+2), count: h+2)
    var hasKey = [Bool](repeating: false, count: 26)
    var q = [(0, 0)], idx = 0
    var door = [[(Int, Int)]](repeating: [], count: 26)
    var cnt = 0

    for _ in 0..<h {
        g.append(["."]+Array(readLine()!)+["."])
    }
    g.append([Character](repeating: ".", count: w+2))

    let key = Array(readLine()!)
    if key != ["0"] { key.forEach{hasKey[$0.code] = true} }

    while idx < q.count {
        let (y, x) = q[idx]; idx += 1
        if g[y][x] == "$" { cnt += 1 }
        for i in 0..<4 {
            let ny = y+dy[i], nx = x+dx[i]
            if ny<0 || ny>h+1 || nx<0 || nx>w+1 { continue }
            if v[ny][nx] || g[ny][nx] == "*" { continue }
            if g[ny][nx] == "." || g[ny][nx] == "$" {
                q.append((ny, nx))
                v[ny][nx] = true
            } else if g[ny][nx].isUppercase {
                let code = g[ny][nx].code
                if hasKey[code] {
                    q.append((ny, nx)); v[ny][nx] = true
                } else {
                    door[code].append((ny, nx))
                }
            } else { // lowerCase
                let code = g[ny][nx].code
                hasKey[code] = true
                while !door[code].isEmpty {
                    q.append(door[code].popLast()!)
                }
                q.append((ny, nx)); v[ny][nx] = true
            }
        }
    }

    ans += "\(cnt)\n"
}

print(ans)
