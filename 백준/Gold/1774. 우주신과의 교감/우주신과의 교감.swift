
import Foundation

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
        if rank[x] < rank[y] { parent[x] = y }
        else { parent[y] = x }
        if rank[x] == rank[y] { rank[x] += 1 }
    }

    mutating func isUni(_ x: Int, _ y: Int) -> Bool {
        root(x) == root(y)
    }
}

func calculate(_ a: (Double, Double), _ b: (Double, Double)) -> Double {
    sqrt((a.0-b.0)*(a.0-b.0) + (a.1-b.1)*(a.1-b.1))
}

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = input[0], m = input[1]
var g = [(0.0, 0.0)]
var edge = [(Int, Int)]()
var dist = [[Double]](repeating: [Double](repeating: 9999.0, count: n+1), count: n+1)
var uf = Disjoint_Set(n+1)
var ans = 0.0

for i in 1...n {
    let input = readLine()!.split{$0==" "}.map{Double(String($0))!}
    g.append((input[0], input[1]))
    for j in 1..<i {
        edge.append((i, j))
        dist[i][j] = calculate(g[i], g[j])
    }
}

for _ in 1...m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let b = input.min()!, a = input.max()!
    uf.uni(a, b)
}

edge.sort{dist[$0.0][$0.1] < dist[$1.0][$1.1]}
for i in 0..<edge.count {
    let (a, b) = edge[i]
    if uf.isUni(a, b) { continue }
    uf.uni(a, b); ans += dist[a][b]
}

print(String(format: "%0.2f", ans))