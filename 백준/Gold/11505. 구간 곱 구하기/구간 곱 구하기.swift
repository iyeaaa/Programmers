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
    let mid = (start+end)/2
    tree[node] = start==end ? list[start] : (makeTree(node*2, start, mid)*makeTree(node*2+1, mid+1, end)) % 1_000_000_007
    return tree[node]
}

func multi(_ node: Int, _ start: Int, _ end: Int, _ lf: Int, _ ryt: Int) -> Int {
    if ryt < start || lf > end { return 1 }
    if lf <= start && end <= ryt { return tree[node] }
    let mid = (start+end)/2
    return (multi(node*2, start, mid, lf, ryt)*multi(node*2+1, mid+1, end, lf, ryt)) % 1_000_000_007
}

@discardableResult
func replace(_ node: Int, _ start: Int, _ end: Int, _ idx: Int, of x: Int) -> Int {
    guard (start...end) ~= idx else { return tree[node] }
    if start == end { tree[node] = x; return tree[node] }
    let mid = (start+end)/2
    tree[node] = (replace(node*2, start, mid, idx, of: x)*replace(node*2+1, mid+1, end, idx, of: x)) % 1_000_000_007
    return tree[node]
}


let io = IO()
let (N, M, K) = (io.readInt(), io.readInt(), io.readInt())
var list = [0]; for _ in 0..<N { list.append(io.readInt()) }
var tree = [Int](repeating: 0, count: N*4)

makeTree(1, 1, N)
var result = ""
for _ in 0..<M+K {
    if io.readInt() == 1 {
        replace(1, 1, N, io.readInt(), of: io.readInt())
    } else {
        result += "\(multi(1, 1, N, io.readInt(), io.readInt()) % 1_000_000_007)\n"
    }
}
io.writeByString(result)