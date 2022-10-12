/**
* 메모리: 94784 KB, 시간: 64 ms
* 2022.10.12
* by Alub
*/
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
let INF = 98765432123456
var ans = ""

for T in 1... {
    let N = io.readInt(); if N == 0 { break }
    var G = [[Int]](repeating: [0, 0, 0], count: N+1)
    var memo = [[Int]](repeating: [INF, INF, INF], count: N+1)

    for i in 1...N { for j in 0..<3 {
        G[i][j] = io.readInt()
    }}
    memo[1][1] = G[1][1]
    memo[1][2] = memo[1][1] + G[1][2]

    for i in 2...N {
        for j in 0..<3 {
            for k in [j-1, j, j+1] where (0..<3) ~= k {
                memo[i][j] = min(memo[i][j], memo[i-1][k] + G[i][j])
            }
        }
        memo[i][1] = min(memo[i][1], memo[i][0]+G[i][1])
        memo[i][2] = min(memo[i][2], memo[i][1]+G[i][2])
    }

    ans += "\(T). \(memo[N][1])\n"
}

print(ans)