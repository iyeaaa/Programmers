
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

let io = IO()
let n = io.readInt(), m = io.readInt()
let distY = abs(io.readInt() - io.readInt())
var P = [Int](); for _ in 0..<n {P.append(io.readInt())}; P.sort()
var Q = [Int](); for _ in 0..<m {Q.append(io.readInt())}; Q.sort()
var md = Int.max
var cnt = 0

P.forEach{ x1 in
    var lo = -1, hi = m
    while lo + 1 < hi {
        let mid = (lo + hi) / 2
        if Q[mid]<x1 {lo=mid} else {hi=mid}
    }
    [lo, hi].forEach{ idx in
        guard (0..<m) ~= idx else {return}
        let x2 = Q[idx]
        let dist = distY + abs(x1-x2)
        if dist == md {
            cnt += 1
        }
        if dist < md {
            cnt = 1; md = dist
        }
    }
}

print(md, cnt, separator: " ")