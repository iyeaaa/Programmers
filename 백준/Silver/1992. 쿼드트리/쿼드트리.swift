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
let graph: [[Character]] = crtGraph()
var result = ""

quadTree(0, 0, N)
print(result)

func quadTree(_ y: Int, _ x: Int, _ N: Int) {
    if isSame(y, x, N) {
        result.append(graph[y][x])
        return
    }
    result += "("
    for i in stride(from: 0, to: N, by: N/2) {
        for j in stride(from: 0, to: N, by: N/2) {
            quadTree(y+i, x+j, N/2)
        }
    }
    result += ")"
}

func isSame(_ y: Int, _ x: Int, _ N: Int) -> Bool {
    let first = graph[y][x]
    for i in 0..<N {
        for j in 0..<N {
            if first != graph[y+i][x+j] {
                return false
            }
        }
    }
    return true
}

func crtGraph() -> [[Character]] {
    var result = [[Character]]()
    for _ in 0..<N {
        result.append(Array(io.readString()))
    }
    return result
}