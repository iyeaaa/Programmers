
struct Distjoint_Set {
    private var parent: [Int]
    private var rank: [Int]

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
        if rank[x] < rank[y] { parent[x] = y; }
        else { parent[y] = x; }
        if rank[x] == rank[y] { rank[x] += 1 }
    }

    mutating func isUni(_ x: Int, _ y: Int) -> Bool {
        root(x) == root(y)
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var e = [(Int, Int, Int)]()
var uf = Distjoint_Set(n+1)
var ans = 0

for _ in 0..<m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    e.append((input[0], input[1], input[2]))
}


for (a, b, cost) in e.sorted(by: {$0.2 < $1.2}) where !uf.isUni(a, b) {
    ans += cost; uf.uni(a, b)
}

print(ans)