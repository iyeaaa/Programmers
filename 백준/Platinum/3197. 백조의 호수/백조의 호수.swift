
struct Disjoint_Set {
    var p: [Int], r: [Int]

    init(_ x: Int) {
        p = Array(0...x)
        r = [Int](repeating: 1, count: x+1)
    }

    mutating func root(_ x: Int) -> Int {
        if p[x] == x { return x }
        p[x] = root(p[x])
        return p[x]
    }

    mutating func uni(_ y: Int, _ x: Int) {
        let y = root(y), x = root(x)
        if y == x { return }
        if r[y] > r[x] { p[x] = y }
        else { p[y] = x }
        if r[y] == r[x] { r[x] += 1 }
    }

    mutating func isUni(_ y: Int, _ x: Int) -> Bool {
        root(y) == root(x)
    }
}

func isRange(_ y: Int, _ x: Int) -> Bool {
    y >= 0 && y < R && x >= 0 && x < C
}

func key(_ x: (Int, Int)) -> Int { x.0*C + x.1 }

let dy = [-1, 0, 1, 0], dx = [0, -1, 0, 1]
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (R, C) = (ip[0], ip[1])
var g = [[Character]]()
var water = [(Int, Int)]() // 새로 생기는 물 기록
var uf = Disjoint_Set(R*C)
var bird = [(Int, Int)]()

for _ in 0..<R {
    g.append(Array(readLine()!))
}

for y in 0..<R {
    for x in 0..<C {
        if g[y][x] != "X" {
            if g[y][x] == "L" {
                bird.append((y, x))
                g[y][x] = "."
            }
            water.append((y, x))
            for d in 0..<4 {
                let ny = y+dy[d], nx = x+dx[d]
                if !isRange(ny, nx) || g[ny][nx] == "X" { continue }
                uf.uni(key((y, x)), key((ny, nx)))
            }
        }
    }
}

for time in 0... {
    if uf.isUni(key(bird.first!), key(bird.last!)) {
        print(time); break
    }
    var melt = [(Int, Int)]()
    while let (y, x) = water.popLast() {
        for i in 0..<4 {
            let ny = y+dy[i], nx = x+dx[i]
            if !isRange(ny, nx) || g[ny][nx] != "X" { continue }
            melt.append((ny, nx))
            uf.uni(key((y, x)), key((ny, nx)))
            g[ny][nx] = "."
        }
    }
    for (y, x) in melt {
        for i in 0..<4 {
            let ny = y+dy[i], nx = x+dx[i]
            if !isRange(ny, nx) || g[ny][nx] == "X" {continue}
            uf.uni(key((y, x)), key((ny, nx)))
        }
    }
    water = melt
}