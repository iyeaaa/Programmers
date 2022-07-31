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
let graph: [[Int]] = crtGraph()
let (H, W) = (io.readInt(), io.readInt())
let (Sr, Sc, Fr, Fc) =  (io.readInt(), io.readInt(), io.readInt(), io.readInt())
let (EAST, WEST, SOUTH, NORTH) = (0, 1, 2, 3)

var visit = (0...N).map{ _ in (0...M).map{ _ in -1 } }
var queue = [(Sr, Sc)], idx = 0; visit[Sr][Sc] = 0
var result = -1

while idx < queue.count {
    let (y, x) = queue[idx]; idx += 1
    if y == Fr && x == Fc { result = visit[y][x]; break }
    for (ny, nx, nd) in [(y+1,x,SOUTH),(y-1,x,NORTH),(y,x-1,WEST),(y,x+1,EAST)] {
        if !(ny >= 1 && nx >= 1 && ny+H-1 <= N && nx+W-1 <= M) { continue }
        if visit[ny][nx] != -1 { continue }
        if thereIsWall(ny, nx, nd) { continue }
        queue.append((ny, nx))
        visit[ny][nx] = visit[y][x] + 1
    }
}
print(result)

func thereIsWall(_ sr: Int, _ sc: Int, _ Direction: Int) -> Bool {
    switch Direction {
    case EAST:
        for i in sr...sr+H-1 {
            if graph[i][sc+W-1] == 1 {
                return true
            }
        }
    case WEST:
        for i in sr...sr+H-1 {
            if graph[i][sc] == 1 {
                return true
            }
        }
    case SOUTH:
        for i in sc...sc+W-1 {
            if graph[sr+H-1][i] == 1 {
                return true
            }
        }
    case NORTH:
        for i in sc...sc+W-1 {
            if graph[sr][i] == 1 {
                return true
            }
        }
    default: break
    }
    return false
}

func crtGraph() -> [[Int]] {
    var graph = (0...N).map{ _ in (0...M).map{ _ in 0 } }
    for i in 1...N {
        for j in 1...M {
            graph[i][j] = io.readInt()
        }
    }
    return graph
}

