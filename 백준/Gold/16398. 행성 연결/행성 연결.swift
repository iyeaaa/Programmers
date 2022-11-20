
struct DisjointSet {
    var parent: [Int]
    var rank: [Int]

    init(_ x: Int) {
        parent = Array(0..<x)
        rank = [Int](repeating: 0, count: x)
    }

    mutating func root(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = root(parent[x])
        return parent[x]
    }

    mutating func uni(_ x: Int, _ y: Int) {
        let x = root(x), y = root(y)
        if rank[x] > rank[y] { parent[y] = x }
        else { parent[x] = y }
        if rank[x] == rank[y] { rank[y] += 1 }
    }

    mutating func isUni(_ x: Int, _ y: Int) -> Bool {
        root(x) == root(y)
    }
}

let n = Int(readLine()!)!
var uf = DisjointSet(n+1)
var edge = [(Int, Int, Int)]()
var ans = 0

for i in 0..<n {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for j in i+1..<n {
        edge.append((i, j, input[j]))
    }
}

for (u, v, cost) in edge.sorted(by:{$0.2<$1.2}) {
    if uf.isUni(u, v) { continue }
    ans += cost; uf.uni(u, v)
}

print(ans)