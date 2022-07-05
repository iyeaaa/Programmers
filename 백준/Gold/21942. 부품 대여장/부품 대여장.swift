import Foundation

final class FileIO {
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

let monthList = [0,31,28,31,30,31,30,31,31,30,31,30,31]

//대여가능기간을 분으로 convert하는 함수
func getRentalMinute(str: String) -> Int {
    let strList = str.components(separatedBy: ["/",":"]).map{Int($0)!}
    let day = strList[0], hour = strList[1], minute = strList[2]
    return day * 24 * 60 + hour * 60 + minute
}

//날짜를 분으로 convert하는 함수
func convertDateToMinutes(date: String, time: String) -> Int {
    let timeList = time.components(separatedBy: ":").map{Int($0)!}
    let hour = timeList[0], minute = timeList[1]

    let dateList = date.components(separatedBy: "-").dropFirst().map{Int($0)!}
    let month = dateList[0], day = dateList[1]
    
    var daySum = 0
    for i in 1..<month {
        daySum += monthList[i]
    }
    daySum += day
    return daySum * 24 * 60 + hour * 60 + minute
}

//key = 부품이름 닉네임, value = 대여날짜
var rentalList: [String: Int] = [:]
//key = 닉네임, value = 벌금
var personInfo: [String: Int] = [:]

//입력
let fIO = FileIO()
let N = fIO.readInt()
let L = getRentalMinute(str: fIO.readString())
let F = fIO.readInt()

for _ in 0..<N {
    let date = fIO.readString()
    let time = fIO.readString()
    let item = fIO.readString()
    let name = fIO.readString()
    
    let convertedMinutes = convertDateToMinutes(date: date, time: time)
    let key = item + " " + name
    
    if let previousMinutes = rentalList[key] {
        let borrowMinutes = convertedMinutes - previousMinutes
        
        //늦었으면 벌금내야함
        if borrowMinutes > L {
            let penalty = (borrowMinutes - L) * F
            if personInfo[name] == nil {
                personInfo[name] = 0
            }
            personInfo[name]! += penalty
        }
        //반납했으니 랜탈리스트에서 지워줌
        rentalList[key] = nil
    }
    //전에 빌린적 없으면 대출
    else {
        rentalList[key] = convertedMinutes
    }
}
//벌금 낼 사람이 아무도 없으면 -1 출력
if personInfo.isEmpty { print(-1) }

//사전순으로 정렬해서 출력
var ans = ""
for (key, value) in personInfo.sorted(by: {$0.key < $1.key}) {
    ans.write("\(key) \(value)\n")
}
print(ans.dropLast())