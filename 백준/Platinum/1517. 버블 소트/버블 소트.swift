
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

func merge(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var rtn = [Int](), arr1 = arr1, arr2 = arr2
    while !arr1.isEmpty && !arr2.isEmpty {
        if arr1.last! > arr2.last! {
            rtn.append(arr1.popLast()!); ans += arr2.count
        } else {
            rtn.append(arr2.popLast()!)
        }
    }
    while !arr1.isEmpty {rtn.append(arr1.popLast()!)}
    while !arr2.isEmpty {rtn.append(arr2.popLast()!)}
    return rtn.reversed()
}

func f(_ lo: Int, _ hi: Int) -> [Int] {
    if lo == hi { return [A[lo]] }
    return merge(f(lo,(lo+hi)>>1), f((lo+hi)>>1+1,hi))
}

let N = Int(readLine()!)!
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}
var ans = 0

f(0, N-1)
print(ans)