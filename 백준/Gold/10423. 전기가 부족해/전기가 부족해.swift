
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

let io = IO()
let n = io.readInt(), m = io.readInt(), k = io.readInt()
var uf = DisjointSet(n+1)
var edge = [(Int, Int, Int)]()
var ans = 0

var prev = io.readInt()
for _ in 1..<k {
    let cur = io.readInt()
    uf.uni(prev, cur); prev = cur
}

for _ in 0..<m {
    edge.append((io.readInt(), io.readInt(), io.readInt()))
}

for (u, v, cost) in edge.sorted(by:{$0.2<$1.2}) {
    if (uf.isUni(u, v)) { continue }
    ans += cost; uf.uni(u, v)
}

print(ans)