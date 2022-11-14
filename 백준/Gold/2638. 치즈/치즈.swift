
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

struct pair: Hashable {
    let y: Int, x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y;
        self.x = x;
    }
}

func isRange(_ y: Int, _ x: Int) -> Bool {
    (0..<n) ~= y && (0..<m) ~= x
}

func findOutAir(_ y: Int, _ x: Int) {
    if v[y][x] || g[y][x] != 0 { return }
    v[y][x] = true; g[y][x] = 2
    for i in 0..<4 {
        let ny = y+dy[i], nx = x+dx[i]
        if !isRange(ny, nx) { continue }
        findOutAir(ny, nx)
    }
}

let io = IO()
let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]
let (n, m) = (io.readInt(), io.readInt())
var g = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var s = Set<pair>()
var v = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for i in 0..<n {
    for j in 0..<m {
        g[i][j] = io.readInt()
        if g[i][j] == 1 {
            s.insert(pair(i, j))
        }
    }
}

findOutAir(0, 0)

for time in 0... {
    if s.isEmpty {
        print(time)
        break
    }

    var rmvd = [pair]()
    for c in s {
        var cnt = 0
        for i in 0..<4 {
            let ny = c.y+dy[i], nx = c.x+dx[i]
            if g[ny][nx] == 2 {
                cnt += 1
            }
        }
        if cnt >= 2 {
            rmvd.append(c)
        }
    }

    for c in rmvd {
        s.remove(c)
        g[c.y][c.x] = 0
    }

    for c in rmvd {
        findOutAir(c.y, c.x)
    }
}
