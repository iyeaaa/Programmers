/**
* 메모리: 94248 KB, 시간: 116 ms
* 2022.10.11
* by Alub
*/
// f(n): n번 건물까지 짓는데 걸리는 시간
// f(n) = max(f(c1), f(c2), ... ,) + D(n)

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

func Topological_Sort(_ N: Int, _ W: Int, _ D: inout [Int], _ G: inout [[Int]], _ pre: inout [Int]) -> Int {
    var memo = [Int](repeating: 0, count: N+1)
    var queue = [Int](), idx = 0

    for i in 1...N where pre[i] == 0 {
        queue.append(i)
        memo[i] = D[i]
    }

    while idx < queue.count {
        let cur = queue[idx]; idx += 1
        for next in G[cur] {
            memo[next] = max(memo[next], memo[cur]+D[next])
            pre[next] -= 1
            if pre[next] == 0 {
                queue.append(next)
            }
        }
    }

    return memo[W]
}

var result = ""
let io = IO()

for _ in 0..<io.readInt() {
    let (N, K) = (io.readInt(), io.readInt())
    var D = [0]; for _ in 0..<N { D.append(io.readInt()) }
    var G = [[Int]](repeating: [], count: N+1)
    var pre = [Int](repeating: 0, count: N+1)

    for _ in 0..<K {
        let (X, Y) = (io.readInt(), io.readInt())
        G[X].append(Y)
        pre[Y] += 1
    }

    result += "\(Topological_Sort(N, io.readInt(), &D, &G, &pre))\n"
}

print(result)