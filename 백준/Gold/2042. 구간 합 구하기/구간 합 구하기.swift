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


@discardableResult
func makeTree(_ node: Int, _ start: Int, _ end: Int) -> Int {
    if start == end {
        tree[node] = a[start]
    } else {
        let mid = (start+end)/2
        tree[node] = makeTree(node*2, start, mid) + makeTree(node*2+1, mid+1, end)
    }
    return tree[node]
}

func sum(_ node: Int, _ start: Int, _ end: Int, _ lf: Int, _ ryt: Int) -> Int {
    if lf > end || ryt < start {
        return 0
    }
    if lf <= start && end <= ryt {
        return tree[node]
    }
    let mid = (start + end) / 2
    return sum(node*2, start, mid, lf, ryt) + sum(node*2+1, mid+1, end, lf, ryt)
}

func updata(_ node: Int, _ start: Int, _ end: Int, _ index: Int, _ diff: Int) {
    if index < start || index > end { return }
    tree[node] += diff
    let mid = (start+end)/2
    if start != end {
        updata(node*2, start, mid, index, diff)
        updata(node*2+1, mid+1, end, index, diff)
    }
}


let io = IO()
let (N, M, K) = (io.readInt(), io.readInt(), io.readInt())
var a = [Int](repeating: 0, count: N)
var tree = [Int](repeating: 0, count: N*4)

for i in 0..<N { a[i] = io.readInt() }

makeTree(1, 0, N-1)

var result = ""
for _ in 0..<M+K {
    let x = io.readInt()
    if x == 1 {
        let (y, z) = (io.readInt()-1, io.readInt())
        let diff = z - a[y]
        a[y] = z
        updata(1, 0, N-1, y, diff)
    } else {
        result += "\(sum(1, 0, N-1, io.readInt()-1, io.readInt()-1))\n"
    }
}
print(result)