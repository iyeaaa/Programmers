
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

func update(_ x: Int, _ lo: Int, _ hi: Int, _ idx: Int, _ to: Int) {
    if lo == hi { g[x] += to; return }
    if (lo+hi)/2 >= idx {update(x*2, lo, (lo+hi)/2, idx, to)}
    else {update(x*2+1, (lo+hi)/2+1, hi, idx, to)}
    g[x] = g[x*2] + g[x*2+1]
}

func sum(_ x: Int, _ lo: Int, _ hi: Int, _ s: Int, _ e: Int) -> Int {
    if e < lo || hi < s { return 0 }
    if s <= lo && hi <= e { return g[x] }
    return sum(x*2, lo, (lo+hi)/2, s, e) + sum(x*2+1, (lo+hi)/2+1, hi, s, e)
}

let io = IO()
var ans = ""
let (N, Q) = (io.readInt(), io.readInt())
var g = [Int](repeating: 0, count: N*4)

for _ in 0..<Q {
    let (n, p, q) = (io.readInt(), io.readInt(), io.readInt())
    if n == 1 {
        update(1, 1, N, p, q)
    } else {
        ans += "\(sum(1, 1, N, p, q))\n"
    }
}

print(ans)