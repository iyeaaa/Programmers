import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                      || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                      || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                      && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

let file = FileIO()

let n = file.readInt()
var array = [Int]()

for _ in 0..<n {
    array.append(file.readInt())
}

array.sort()

var first = array[1]-array[0]
for i in 2..<array.count {
    first = gcd(first, array[i]-array[i-1])
}

var result = [first]
for i in stride(from: 2, through: Int(sqrt(Double(first))), by: 1) {
    if first % i == 0 {
        result.append(i)
        if i != first/i {
            result.append(first/i)
        }
    }
}

print(result.sorted().map{String($0)}.joined(separator: " "))

func gcd(_ ta: Int, _ tb: Int) -> Int {
    var (a, b, r) = (ta, tb, ta%tb)
    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}