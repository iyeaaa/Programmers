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

struct UnionFind {
    var same: [Int]
    var dfrnt: [Int]

    init(_ n: Int) { same = Array(0...n); dfrnt = Array(repeating: 0, count: n+1) }

    mutating func root(of x: Int) -> Int {
        if x == same[x] { return x }
        same[x] = root(of: same[x])
        return same[x]
    }

    mutating func merge(_ x: Int, with y: Int) {
        let (x, y) = (root(of: x), root(of: y))
        if x == y { return }
        same[y] = x
    }

    mutating func isUnion(_ x: Int, with y: Int) -> Bool {
        root(of: x) == root(of: y)
    }
}


let io = IO()
var result = ""

for _ in 0..<io.readInt() {
    let (V, E) = (io.readInt(), io.readInt())
    var ds = UnionFind(V)
    var isYes = true
    for _ in 0..<E {
        let (u, v) = (ds.root(of: io.readInt()), ds.root(of: io.readInt()))
        if u == v { isYes = false }

        if ds.dfrnt[u] == 0 {
            ds.dfrnt[u] = v
        } else {
            ds.merge(ds.dfrnt[u], with: v)
        }

        if ds.dfrnt[v] == 0 {
            ds.dfrnt[v] = u
        } else {
            ds.merge(ds.dfrnt[v], with: u)
        }
    }
    result += isYes ? "YES\n" : "NO\n"
}

io.writeByString(result)