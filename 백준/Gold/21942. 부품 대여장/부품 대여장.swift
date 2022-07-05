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

let (N, L, F) = (io.readInt(), io.readString(), io.readInt())
let LList = L.components(separatedBy: ["/", ":"]).map{Int($0)!}
let L_minutes = LList[0]*24*60 + LList[1]*60 + LList[2]

var dict = [String: Int]()
var nameToCost = [String: Int]()

for _ in 0..<N {
    let ymd = io.readString()
    let hm = io.readString()
    let object = io.readString()
    let name = io.readString()
    let key = name + " " + object
    let cvtedMnt = cvtToMinutes(ymd, hm)

    if let preMnt = dict[key] {
        let differ = cvtedMnt - preMnt
        if differ > L_minutes {
            nameToCost[name, default: 0] += (differ - L_minutes)*F
        }
        dict[key] = nil
    } else {
        dict[key] = cvtedMnt
    }
}

if nameToCost.isEmpty { print(-1) }
else {
    var answer = ""
    for (k, v) in nameToCost.sorted(by: {$0.key < $1.key}) {
        answer += "\(k) \(v)\n"
    }
    print(answer)
}

func cvtToMinutes(_ md: String, _ hm: String) -> Int {
    let month = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let mdList = md.components(separatedBy: "-").map{Int($0)!}
    let hmList = hm.components(separatedBy: ":").map{Int($0)!}
    return (month[1..<mdList[1]].reduce(0, +) + mdList[2])*60*24 +
            hmList[0]*60 + hmList[1]
}



