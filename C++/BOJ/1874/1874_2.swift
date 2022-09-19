/**
* 메모리: 83176 KB, 시간: 40 ms
* 2022.09.20
* by Alub
*/
import Foundation

// 라이노님의 FileIO
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
var number = [Int]()
for i in 0..<n {
    number.append(n-i)
}
var result = ""
var stack = [Int]()
var save = 0

for _ in 0..<n {
    let p = file.readInt()
    if save < p {
        while true {
            let temp = number.popLast()!
            stack.append(temp)
            result += "+\n"
            if temp == p {
                break
            }
        }
        stack.popLast()
        result += "-\n"
        save = p
    }
    else if stack.last! == p {
        result += "-\n"
        stack.popLast()
    }
    else {
        result = "NO"
        break
    }
}

print(result)
