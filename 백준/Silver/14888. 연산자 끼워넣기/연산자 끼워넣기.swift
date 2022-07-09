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
let N = io.readInt()
var A = [Int](repeating: 0, count: N+1)
for i in 0..<N { A[i] = io.readInt() }
var oprtr = [Int](repeating: 0, count: 4)
for i in 0..<4 { oprtr[i] = io.readInt() }

var maxValue = Int.min
var minValue = Int.max

dfs(1, A[0])
print(maxValue, minValue, separator: "\n")

func dfs(_ idx: Int, _ sum: Int) {
    if idx == N {
        maxValue = max(maxValue, sum)
        minValue = min(minValue, sum)
        return
    }
    for (i, v) in [sum+A[idx], sum-A[idx], sum*A[idx], sum/A[idx]].enumerated() {
        if oprtr[i] > 0 {
            oprtr[i] -= 1
            dfs(idx+1, v)
            oprtr[i] += 1
        }
    }
}

