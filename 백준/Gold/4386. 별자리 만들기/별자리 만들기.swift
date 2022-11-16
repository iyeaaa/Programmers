
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

func dist(_ a: (Double, Double), _ b: (Double, Double)) -> Double {
    sqrt((a.0-b.0)*(a.0-b.0) + (a.1-b.1)*(a.1-b.1))
}

let n = Int(readLine()!)!
var g = [(0.0, 0.0)]
var edge = [(Int, Int, Double)]()
var uf = Disjoint_Set(n+1)
var ans = 0.0

for i in 1...n {
    let input = readLine()!.split{$0==" "}.map{Double(String($0))!}
    g.append((input[0], input[1]))
    for j in 1..<i {
        edge.append((i, j, dist(g[i], g[j])))
    }
}

for (a, b, cost) in edge.sorted(by: {$0.2 < $1.2}) where !uf.isUni(a, b) {
    ans += cost; uf.uni(a, b)
}

print(ans)