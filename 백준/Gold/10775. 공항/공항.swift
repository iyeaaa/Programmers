
struct Disjoint_Set {
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

let G = Int(readLine()!)!
let P = Int(readLine()!)!
var uf = Disjoint_Set(G+1)
var ans = 0

for _ in 0..<P {
    let g = uf.root(Int(readLine()!)!)
    if uf.root(g) == 0 { break }
    else { uf.parent[g] = g-1; ans += 1 }
}

print(ans)