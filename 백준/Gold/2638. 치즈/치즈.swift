
struct pair: Hashable {
    let y: Int, x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y;
        self.x = x;
    }
}

func isRange(_ y: Int, _ x: Int) -> Bool {
    (0..<n) ~= y && (0..<m) ~= x
}

func findOutAir(_ y: Int, _ x: Int) {
    if v[y][x] || g[y][x] != 0 { return }
    v[y][x] = true; g[y][x] = 2
    for i in 0..<4 {
        let ny = y+dy[i], nx = x+dx[i]
        if !isRange(ny, nx) { continue }
        findOutAir(ny, nx)
    }
}

let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var g = [[Int]]()
var s = Set<pair>()
var v = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for i in 0..<n {
    g.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    for j in 0..<m {
        if g[i][j] == 1 {
            s.insert(pair(i, j))
        }
    }
}

findOutAir(0, 0)

for time in 0... {
    if s.isEmpty {
        print(time)
        break
    }

    var rmvd = [pair]()
    for c in s {
        var cnt = 0
        for i in 0..<4 {
            let ny = c.y+dy[i], nx = c.x+dx[i]
            if g[ny][nx] == 2 {
                cnt += 1
            }
        }
        if cnt >= 2 {
            rmvd.append(c)
        }
    }

    for c in rmvd {
        s.remove(c)
        g[c.y][c.x] = 0
    }

    for c in rmvd {
        findOutAir(c.y, c.x)
    }
}
