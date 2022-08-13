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

func crtTree(_ n: Int, _ s: Int, _ e: Int) -> Int {
    if s == e {
        tree[n] = list[s]
        return tree[n]
    }
    tree[n] = crtTree(n*2, s, (s+e)/2) + crtTree(n*2+1, (s+e)/2+1, e)
    return tree[n]
}

func sum(_ n: Int, _ s: Int, _ e: Int, _ lf: Int, _ ryt: Int) -> Int {
    if ryt < s || e < lf {
        return 0
    }
    if lf <= s && e <= ryt {
        return tree[n]
    }
    return sum(n*2, s, (s+e)/2, lf, ryt) + sum(n*2+1, (s+e)/2+1, e, lf, ryt)
}

func replace(_ n: Int, _ s: Int, _ e: Int, _ i: Int, _ d: Int) -> Int {
    guard (s...e) ~= i else { return tree[n] }
    if s == e { tree[n] = d; return tree[n] }
    tree[n] = replace(n*2, s, (s+e)/2, i, d) + replace(n*2+1, (s+e)/2+1, e, i, d)
    return tree[n]
}


let io = IO()
let (N, Q) = (io.readInt(), io.readInt())
var list = [Int](); for _ in 0..<N { list.append(io.readInt()) }
var tree = [Int](repeating: 0, count: N*4)

_ = crtTree(1, 0, N-1)

var result = ""
for _ in 0..<Q {
    var (x, y) = (io.readInt()-1, io.readInt()-1)
    let (a, b) = (io.readInt()-1, io.readInt())
    if x > y { (x, y) = (y, x) }
    result += "\(sum(1, 0, N-1, x, y))\n"
    _ = replace(1, 0, N-1, a, b)
}
print(result)