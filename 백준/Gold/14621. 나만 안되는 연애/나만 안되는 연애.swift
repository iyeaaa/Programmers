
struct Disjoint_set {
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

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var uf = Disjoint_set(n+1)
var gender = ["0"] + readLine()!.split{$0==" "}.map{String($0)}
var ans = 0, edgeCnt = 0
var edge = [(Int, Int, Int)]()

for _ in 0..<m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (u, v, d) = (input[0], input[1], input[2])
    if gender[u] == gender[v] { continue }
    edge.append((u, v, d))
}
edge.sort{$0.2 < $1.2}

for (u, v, cost) in edge where !uf.isUni(u, v) {
    ans += cost; uf.uni(u, v); edgeCnt += 1
}

print(edgeCnt == n-1 ? ans : -1)
