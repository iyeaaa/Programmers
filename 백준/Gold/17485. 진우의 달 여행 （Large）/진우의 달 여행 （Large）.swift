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
let INF = 100001
let (N, M) = (io.readInt(), io.readInt())
let fuels: [[Int]] = crtFuels
var dp = [[[Int]]](repeating: [[Int]](repeating: [INF, INF, INF], count: M+2), count: N+1)

for i in 1...M {
    for j in 0...2 {
        dp[1][i][j] = fuels[1][i]
    }
}

for i in stride(from: 2, through: N, by: 1) {
    for j in 1...M {
        dp[i][j][0] = min(dp[i-1][j][1], dp[i-1][j][2]) + fuels[i][j]
        dp[i][j][1] = min(dp[i-1][j-1][0], dp[i-1][j-1][2]) + fuels[i][j]
        dp[i][j][2] = min(dp[i-1][j+1][0], dp[i-1][j+1][1]) + fuels[i][j]
    }
}

var minValue = INF
for i in 1...M {
    for j in 0...2 {
        if minValue > dp[N][i][j] {
            minValue = dp[N][i][j]
        }
    }
}
print(minValue)



var crtFuels: [[Int]] {
    var result = [[Int]](repeating: [Int](repeating: INF, count: M+2), count: N+2)
    for i in 1...N {
        for j in 1...M {
            result[i][j] = io.readInt()
        }
    }
    return result
}