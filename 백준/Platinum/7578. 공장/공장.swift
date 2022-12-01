
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

func sum(_ x: Int, _ s: Int, _ e: Int, _ lo: Int, _ hi: Int) -> Int {
    if hi < s || e < lo { return 0 }
    if lo <= s && e <= hi { return tree[x] }
    return sum(x*2, s, (s+e)/2, lo, hi)+sum(x*2+1, (s+e)/2+1, e, lo, hi)
}

func update(_ x: Int, _ s: Int, _ e: Int, _ idx: Int) {
    if s == e { tree[x] = 1; return }
    if idx <= (s+e)/2 { update(x*2, s, (s+e)/2, idx) }
    else { update(x*2+1, (s+e)/2+1, e, idx) }
    tree[x] = tree[x*2] + tree[x*2+1]
}

let io = IO()
let N = io.readInt()
var tree = [Int](repeating: 0, count: N*4)
var A = [Int](); for _ in 0..<N { A.append(io.readInt()) }
var B = [Int](); for _ in 0..<N { B.append(io.readInt()) }
var idx = [Int](repeating: 0, count: 1_000_001); for i in 0..<N {idx[B[i]] = i}
var L = Array(0..<N)
var ans = 0

for v in L.sorted(by: {idx[A[$0]] < idx[A[$1]]}) {
    ans += sum(1, 1, N, v+2, N)
    update(1, 1, N, v+1)
}

print(ans)
