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
let (N, M) = (io.readInt(), io.readInt())
var graph = [[(Int, Int)]](repeating: [(Int, Int)](), count: N+1)
var maxCost = Int.min

for _ in 0..<M {
    let (A, B, C) = (io.readInt(), io.readInt(), io.readInt())
    graph[A].append((B, C))
    graph[B].append((A, C))
    maxCost = max(maxCost, C)
}

let (start, target) = (io.readInt(), io.readInt())
var (lf, ryt) = (0, maxCost)
while lf <= ryt {
    let mid = (lf + ryt) / 2
    if isPsb(mid) {
        lf = mid + 1
    } else {
        ryt = mid - 1
    }

}
print(ryt)

func isPsb(_ weight: Int) -> Bool {
    var visit = [Bool](repeating: false, count: N+1)
    var queue = [start], idx = 0; visit[start] = true
    while idx < queue.count {
        let cur = queue[idx]; idx += 1
        if cur == target { return true }
        for (next, cost) in graph[cur] where !visit[next] && weight <= cost {
            queue.append(next)
            visit[next] = true
        }
    }
    return false
}