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
}

let io = IO()
let INF = 99999999

let (n, m) = (io.readInt(), io.readInt())
var cost = Array(repeating: Array(repeating: INF, count: n+1), count:n+1)
for _ in 0..<m {
    let (a, b, c) = (io.readInt(), io.readInt(), io.readInt())
    cost[a][b] = min(cost[a][b], c)
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            if i != j {
                cost[i][j] = min(cost[i][j], cost[i][k] + cost[k][j])
            }
        }
    }
}

var result = ""
for i in 1...n {
    for j in 1...n {
        result += "\(cost[i][j] == INF ? 0 : cost[i][j]) "
    }
    result += "\n"
}
print(result)