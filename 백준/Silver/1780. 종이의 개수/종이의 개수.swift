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
let graph: [[Int]] = crtGraph()
var count = [Int](repeating: 0, count: 3)

paper(0, 0, N)
print(count[0], count[1], count[2], separator: "\n")

func paper(_ y: Int, _ x: Int, _ n: Int) {
    if isSame(y, x, n) {
        count[graph[y][x]+1] += 1
        return
    }
    for i in stride(from: 0, to: n, by: n/3) {
        for j in stride(from: 0, to: n, by: n/3) {
            paper(y+i, x+j, n/3)
        }
    }
}

func crtGraph() -> [[Int]] {
    var result = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    for i in 0..<N {
        for j in 0..<N {
            result[i][j] = io.readInt()
        }
    }
    return result
}

func isSame(_ y: Int, _ x: Int, _ k: Int) -> Bool {
    let f = graph[y][x]
    for i in 0..<k {
        for j in 0..<k {
            if f != graph[y+i][x+j] {
                return false
            }
        }
    }
    return true
}