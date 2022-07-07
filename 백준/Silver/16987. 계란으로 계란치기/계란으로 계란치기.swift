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
typealias egg = (S: Int, W: Int)

let N = io.readInt()
var eggs = [egg]()
for _ in 0..<N {
    eggs.append(egg(S: io.readInt(), W: io.readInt()))
}
var maxValue = Int.min

dfs(0, 0)
print(maxValue)

func dfs(_ cur: Int, _ count: Int) {
    if eggs[cur].S <= 0 {
        if cur == N-1 {
            maxValue = max(maxValue, count)
            return
        }
        dfs(cur+1, count)
        return
    }
    for i in 0..<N {
        if i != cur && eggs[i].S > 0 {
            eggs[i].S -= eggs[cur].W
            eggs[cur].S -= eggs[i].W
            var count = count
            if eggs[i].S <= 0 {
                count += 1
            }
            if eggs[cur].S <= 0 {
                count += 1
            }
            if cur == N-1 {
                maxValue = max(maxValue, count)
                eggs[i].S += eggs[cur].W
                eggs[cur].S += eggs[i].W
                continue
            }
            dfs(cur+1, count)
            eggs[i].S += eggs[cur].W
            eggs[cur].S += eggs[i].W
        }
    }
    if cur == N-1 {
        maxValue = max(maxValue, count)
    }
}
