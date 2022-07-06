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
let x = io.readInt()
var alpabet = Array(repeating: Array(repeating: false, count: 58), count: 58)


for _ in 0..<x {
    let (a, _ , b) = (io.readString(), io.readString(), io.readString())
    let (ascA, ascB) = (asc(a), asc(b))
    if a == b { continue }
    alpabet[ascA][ascB] = true
}

for k in 0..<58 {
    for i in 0..<58 {
        for j in 0..<58 {
            if i != j && alpabet[i][k] && alpabet[k][j]  {
                alpabet[i][j] = true
            }
        }
    }
}



var result = ""
var count = 0
for i in 0..<58 {
    for j in 0..<58 {
        if alpabet[i][j] {
            result += "\(apb(i)) => \(apb(j))\n"
            count += 1
        }
    }
}
print(count, result, separator: "\n")

func asc(_ strn: String) -> Int {
    Int(Character(strn).unicodeScalars.first!.value) - 65
}

func apb(_ i: Int) -> String {
    String(UnicodeScalar(65+i)!)
}