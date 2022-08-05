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
}

let io = IO()
let N = io.readInt()
let L = io.readString().components(separatedBy: ["/", ":"]).map{Int(String($0))!}
let F = io.readInt()
let fineTime = cvtToMnt([1]+L)
var imfo = [String: [Int]]()
var nickToMny = [String: Int]()

for _ in 0..<N {
    var input = io.readString().split(separator: "-").map{Int(String($0))!}
    let (MM, dd) = (input[1], input[2])
    input = io.readString().split(separator: ":").map{Int(String($0))!}
    let (hh, mm) = (input[0], input[1])
    let (P, M) = (io.readString(), io.readString())
    let key = M+" "+P

    if let time = imfo[key] {
        imfo[key] = nil
        let fine = timeClct(time, [MM, dd, hh, mm])
        if fine == 0 { continue }
        nickToMny[M, default: 0] += fine
    } else {
        imfo[key] = [MM, dd, hh, mm]
    }
}

if nickToMny.isEmpty { print(-1) }
else {print(nickToMny.sorted{$0.key<$1.key}.map{$0.key+" \($0.value)\n"}.joined())}

func cvtToMnt(_ time: [Int]) -> Int {
    let (MM, dd, hh, mm) = (time[0], time[1], time[2], time[3])
    let monthToDay = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return (dd + monthToDay[1..<MM].reduce(0, +))*24*60 + hh*60 + mm
}

func timeClct(_ start: [Int], _ end: [Int]) -> Int {
    let brwTime = cvtToMnt(end) - cvtToMnt(start)
    let haveToFine = brwTime > fineTime
    return haveToFine ? (brwTime-fineTime)*F : 0
}