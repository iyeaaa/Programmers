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
let (M, N) = (io.readInt(), io.readInt())
var queue = [(Int, Int)](), idx = 0;
var graph: [[Int]] = crtGraph()

while idx < queue.count {
    let (y, x) = queue[idx]; idx += 1
    for (ny, nx) in [(y+1,x), (y-1,x), (y,x+1), (y,x-1)] {
        if !((0..<N) ~= ny && (0..<M) ~= nx) { continue }
        if graph[ny][nx] != 0  { continue }
        queue.append((ny, nx))
        graph[ny][nx] = graph[y][x] + 1
    }
}

var maxValue = -1
for i in 0..<N {
    for j in 0..<M {
        if graph[i][j] == 0 { print(-1); exit(0) }
        maxValue = max(maxValue, graph[i][j])
    }
}
print(maxValue-1)

func crtGraph() -> [[Int]] {
    var result = [[Int]](repeating: [], count: N)
    for i in 0..<N {
        for j in 0..<M {
            let cur = io.readInt()
            result[i].append(cur)
            if cur == 1 {
                queue.append((i, j))
            }
        }
    }
    return result
}

