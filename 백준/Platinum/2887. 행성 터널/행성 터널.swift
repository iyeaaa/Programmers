
import Foundation

final class IO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {

        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                      || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }

    @inline(__always) func writeByString(_ output: String) { // wapas
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

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

    mutating func uni(_ y: Int, _ x: Int) {
        let y = root(y), x = root(x)
        if rank[y] > rank[x] { parent[x] = y }
        else { parent[y] = x }
        if rank[y] == rank[x] { rank[x] += 1 }
    }

    mutating func isUni(_ y: Int, _ x: Int) -> Bool {
        root(y) == root(x)
    }
}

let io = IO()
let n = io.readInt()
var edge = [(Int, Int, Int)]()
var g = [(Int, Int, Int, Int)]()
var uf = Disjoint_Set(n)
var ans = 0

for i in 0..<n {
    g.append((i, io.readInt(), io.readInt(), io.readInt()))
}

g.sort{$0.1 < $1.1}
for i in 1..<n {
    edge.append((g[i-1].0, g[i].0, g[i].1-g[i-1].1))
}

g.sort{$0.2 < $1.2}
for i in 1..<n {
    edge.append((g[i-1].0, g[i].0, g[i].2-g[i-1].2))
}

g.sort{$0.3 < $1.3}
for i in 1..<n {
    edge.append((g[i-1].0, g[i].0, g[i].3-g[i-1].3))
}

for (u, v, cost) in edge.sorted(by:{$0.2<$1.2}) {
    if uf.isUni(u, v) { continue }
    ans += cost; uf.uni(u, v)
}

print(ans)