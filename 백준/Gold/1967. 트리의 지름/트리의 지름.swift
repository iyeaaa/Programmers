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
let n = io.readInt()
var graph = [[(Int, Int)]](repeating: [], count: n+1)

for _ in 0..<n-1 {
    let (prnt, chl, cost) = (io.readInt(), io.readInt(), io.readInt())
    graph[prnt].append((chl, cost))
    graph[chl].append((prnt, cost))
}

var visit = [Bool](repeating: false, count: n+1); visit[1] = true
var maxValue = Int.min
var node = 0
findNodeAndMaxDistance(1, 0)
visit = [Bool](repeating: false, count: n+1); visit[node] = true
findNodeAndMaxDistance(node, 0)
print(maxValue)

func findNodeAndMaxDistance(_ cur: Int, _ dist: Int) {
    var isSuccess = false
    for (next, cost) in graph[cur] where !visit[next] {
        visit[next] = true
        isSuccess = true
        findNodeAndMaxDistance(next, dist+cost)
        visit[next] = false
    }
    if !isSuccess && maxValue < dist {
        node = cur
        maxValue = dist
    }
}