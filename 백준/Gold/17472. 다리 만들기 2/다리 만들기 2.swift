
struct Disjoint_Set {
    var parent: [Int]
    var rank: [Int]

    init(_ x: Int) {
        parent = Array(0..<x)
        rank = [Int](repeating: 0, count: x)
    }

    mutating func root(_ x: Int) -> Int {
        if x == parent[x] { return x }
        parent[x] = root(parent[x])
        return parent[x]
    }

    mutating func uni(_ x: Int, _ y: Int) {
        let x = root(x), y = root(y)
        if rank[x] > rank[y] {
            parent[y] = x
        } else {
            parent[x] = y
        }
        if rank[x] == rank[y] {
            rank[y] += 1
        }
    }

    mutating func isUni(_ x: Int, _ y: Int) -> Bool {
        root(x) == root(y)
    }
}

func isRange(_ y: Int, _ x: Int) -> Bool {
    (0..<n) ~= y && (0..<m) ~= x
}

func numbering(_ y: Int, _ x: Int, _ number: Int) {
    if v[y][x] { return }
    var isSide = false
    v[y][x] = true; g[y][x] = number
    for i in 0..<4 {
        let ny = y+dy[i], nx = x+dx[i]
        if !isRange(ny, nx) { continue }
        if g[ny][nx] == 0 { isSide = true; continue }
        numbering(ny, nx, number)
    }
    if isSide { side.append((y, x)) }
}

func findDist(_ dir: Int, _ y: Int, _ x: Int, _ cnt: Int, _ start: Int) {
    if start != g[y][x] && g[y][x] > 0 {
        if cnt <= 1 { return }
        edge.append((start, g[y][x], cnt))
        return
    }
    let ny = y+dy[dir], nx = x+dx[dir]
    if !isRange(ny, nx) { return }
    if g[ny][nx] == start { return }
    findDist(dir, ny, nx, cnt+1, start)
}

let dy = [-1, 0, 1, 0], dx = [0, -1, 0, 1]
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var v = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var side = [(Int, Int)]()
var edge = [(Int, Int, Int)]()
var g = [[Int]]()
var uf = Disjoint_Set(10)
var ans = 0, edge_cnt = 0

for _ in 0..<n {
    g.append(readLine()!.split{$0==" "}.map{$0 == "0" ? 0 : -1})
}

var cnt = 1
for i in 0..<n {
    for j in 0..<m where g[i][j] == -1 && !v[i][j] {
        numbering(i, j, cnt)
        cnt += 1
    }
}

for (y, x) in side {
    for dir in 0..<4 {
        findDist(dir, y, x, -1, g[y][x])
    }
}

for (a, b, cost) in edge.sorted(by: {$0.2 < $1.2}) where !uf.isUni(a, b) {
    ans += cost
    cnt -= 1
    uf.uni(a, b)
}

print(cnt == 2 ? ans : -1)