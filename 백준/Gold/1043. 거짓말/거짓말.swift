import Foundation

struct unionFind {
    var parent: [Int]
    var rank: [Int]

    init(_ n: Int) {
        parent = Array(0...n)
        rank = [Int](repeating: 0, count: n+1)
    }

    mutating func root(of x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = root(of: parent[x])
        return parent[x]
    }

    mutating func merge(_ x: Int, with y: Int) {
        let (x, y) = (root(of: x), root(of: y))
        if x == y { return }
        if rank[x] < rank[y] {
            parent[x] = y
        } else {
            parent[y] = x
        }
        if rank[x] == rank[y] { rank[x] += 1 }
    }

    mutating func isUnion(_ x: Int, with y: Int) -> Bool {
        root(of: x) == root(of: y)
    }
}


var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var party = [[Int]](repeating: [Int](), count: M)
var uf = unionFind(N)
var know = 0

input = readLine()!.split(separator: " ").map{Int(String($0))!}
if input[0] == 0 { print(M); exit(0) }
for i in stride(from: 1, through: input[0], by: 1) {
    uf.merge(input[1], with: input[i])
    know = input[i]
}

for i in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in stride(from: 1, through: input[0], by: 1) {
        uf.merge(input[1], with: input[j])
        party[i].append(input[j])
    }
}

var count = 0
for i in 0..<M {
    var success = true
    for j in party[i] {
        if uf.isUnion(know, with: j) {
            success = false
        }
    }
    if success {
        count += 1
    }
}

print(count)
