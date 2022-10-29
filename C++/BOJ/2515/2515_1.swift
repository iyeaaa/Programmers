/**
* 메모리: 103828 KB, 시간: 116 ms
* 2022.10.29
* by Alub
*/
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
let (N, S) = (io.readInt(), io.readInt())
var P = [(H: 0, C: 0)]
var memo = [Int](repeating: 0, count: N+1)

for _ in 0..<N {
    P.append((io.readInt(), io.readInt()))
}
P.sort{$0.H < $1.H}

for i in 1...N {
    let j = findIdx(i)
    memo[i] = memo[i-1]
    if j == -1 { continue }
    memo[i] = max(memo[i], memo[j] + P[i].C)
}

func findIdx(_ cur: Int) -> Int {
    var s = 0, e = cur
    while s <= e {
        let mid = (s + e) >> 1
        if P[cur].H - P[mid].H >= S {
            s = mid + 1
        } else {
            e = mid - 1
        }
    }
    return e
}

print(memo[N])