/**
* 메모리: 82476 KB, 시간: 272 ms
* 2022.10.19
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
let INF = Int.min
let (N, M, K) = (io.readInt(), io.readInt(), io.readInt())
var G = (0...N).map{_ in [Int]()}
var C = (0...N).map{_ in (0...N).map{_ in 0}}
var memo = (0...N).map{_ in (0...M).map{_ in INF}}
var ans = 0
memo[1][1] = 0

for _ in 0..<K {
    let (a, b, c) = (io.readInt(), io.readInt(), io.readInt())
    if a > b { continue }
    G[b].append(a)
    C[a][b] = max(C[a][b], c)
}

for i in 1...M {
    ans = max(ans, f(N, i))
}

print(ans)

func f(_ cur: Int, _ w: Int) -> Int {
    if w <= 0 { return INF }
    if cur == 1 { return memo[cur][w] }
    if memo[cur][w] != INF { return memo[cur][w] }
    var temp = INF
    for prev in G[cur] {
        temp = max(temp, f(prev, w-1) + C[prev][cur])
    }
    memo[cur][w] = temp
    return temp
}