
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

func lower_bound(_ arr: inout [Int], _ key: Int) -> Int {
    var lf = 0, ryt = arr.count
    while lf < ryt {
        let mid = (lf + ryt) / 2
        if arr[mid] >= key { ryt = mid }
        else { lf = mid + 1 }
    }
    return ryt
}

let io = IO()
let n = io.readInt(), h = io.readInt()
var d = [Int](), u = [Int]()
var destory = [Int]()
let mv: Int

for _ in 1...n/2 {
    d.append(io.readInt())
    u.append(io.readInt())
}
d.sort(); u.sort()

for i in 1...h {
    destory.append(n/2-lower_bound(&d, i) + n/2-lower_bound(&u, h+1-i))
}
mv = destory.min()!

print(mv, destory.filter{$0==mv}.count, separator: " ")