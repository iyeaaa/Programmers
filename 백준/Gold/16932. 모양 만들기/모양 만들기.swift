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
var one = [(Int, Int)](), zero = [(Int, Int)]()
var graph = crtGraph()
var cntNum = [0]

numbering()
var maxValue = Int.min
for (y, x) in zero {
    var sum = 1, overlap = Set<Int>()
    for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
        if !((0..<N) ~= ny && (0..<M) ~= nx) { continue }
        let nextNum = graph[ny][nx]
        if nextNum == 0 { continue }
        if overlap.contains(nextNum) { continue }
        sum += cntNum[nextNum]
        overlap.insert(nextNum)
    }
    maxValue = max(sum, maxValue)
}
print(maxValue)


func numbering() {
    var isVisit = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var number = 1
    for (i, j) in one {
        if isVisit[i][j] { continue }
        var count = 1
        var queue = [(i, j)], idx = 0; isVisit[i][j] = true
        while idx < queue.count {
            let (y, x) = queue[idx]; idx += 1
            for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
                if !((0..<N) ~= ny && (0..<M) ~= nx) { continue }
                if isVisit[ny][nx] || graph[ny][nx] == 0 { continue }
                queue.append((ny, nx))
                isVisit[ny][nx] = true
                count += 1
            }
        }
        for (y, x) in queue {
            graph[y][x] = number
        }
        cntNum.append(count)
        number += 1
    }
}

func crtGraph() -> [[Int]] {
    var result = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    for i in 0..<N {
        for j in 0..<M {
            result[i][j] = io.readInt()
            if result[i][j] == 1 {
                one.append((i, j))
                continue
            }
            if result[i][j] == 0 {
                zero.append((i, j))
            }
        }
    }
    return result
}

