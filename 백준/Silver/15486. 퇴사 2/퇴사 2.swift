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
typealias Consulting = (T: Int, P: Int)

let N = io.readInt()
var cst = crtCst()
var dp = [Int](repeating: 0, count: N)
dp[N-1] = cst[N-1].T <= 1 ? cst[N-1].P : 0

for i in stride(from: N-2, through: 0, by: -1) {
    if i+cst[i].T <= N {
        if i+cst[i].T == N {
            dp[i] = max(cst[i].P, dp[i+1])
        } else {
            dp[i] = max(dp[i+cst[i].T]+cst[i].P, dp[i+1])
        }
    } else {
        dp[i] = dp[i+1]
    }
}

print(dp.max()!)

func crtCst() -> [Consulting] {
    var cst = [Consulting]()
    for _ in 0..<N {
        cst.append(Consulting(T: io.readInt(), P: io.readInt()))
    }
    return cst
}