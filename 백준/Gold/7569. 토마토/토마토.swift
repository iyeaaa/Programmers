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
let (M, N, H) = (io.readInt(), io.readInt(), io.readInt())
var queue = [(Int, Int, Int)](), idx = 0
var graph: [[[Int]]] = crtGraph()

while idx < queue.count {
    let (z, y, x) = queue[idx]; idx += 1
    for (nz, ny, nx) in [(z,y+1,x),(z,y-1,x),(z,y,x+1),(z,y,x-1),(z-1,y,x),(z+1,y,x)] {
        if !((0..<H) ~= nz && (0..<N) ~= ny && (0..<M) ~= nx) { continue }
        if graph[nz][ny][nx] != 0 { continue }
        queue.append((nz, ny, nx))
        graph[nz][ny][nx] = graph[z][y][x] + 1
    }
}

var maxValue = -1
for i in 0..<H {
    for j in 0..<N {
        for k in 0..<M {
            if graph[i][j][k] == 0 { print(-1); exit(0) }
            maxValue = max(maxValue, graph[i][j][k])
        }
    }
}
print(maxValue-1)

func crtGraph() -> [[[Int]]] {
    var graph = Array(repeating: Array(repeating: [Int](), count: N), count: H)
    for i in 0..<H {
        for j in 0..<N {
            for k in 0..<M {
                let cur = io.readInt()
                graph[i][j].append(cur)
                if cur == 1 {
                    queue.append((i, j, k))
                }
            }
        }
    }
    return graph
}