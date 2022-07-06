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

let (n, m) = (io.readInt(), io.readInt())
let INF = 9999999
var dist = Array(repeating: Array(repeating: (INF, INF), count: n+1), count: n+1)

for _ in 0..<m {
    let (a, b, c) = (io.readInt(), io.readInt(), io.readInt())
    dist[a][b] = (c, b); dist[b][a] = (c, a)
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            if i == j { continue }
            let cur = dist[i][k].0 + dist[k][j].0
            if dist[i][j].0 > cur {
                dist[i][j] = (cur, dist[i][k].1)
            }
        }
    }
}

var result = ""
for i in 1...n {
    for j in 1...n {
        result += (i == j ? "- " : "\(dist[i][j].1) ")
    }
    result += "\n"
}
print(result)