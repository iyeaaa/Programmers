import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0
@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer[byteIdx]
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte()}
    return number
}

func main() {
    let (c, n) = (readInt(),readInt())
    var dp = [Int](repeating: Int.max-100, count: c + 101); dp[0] = 0
    var price = [0], person = [0]
    for i in 0..<n {
        price.append(readInt())
        person.append(readInt())
    }

    for i in stride(from: 1, through: n, by: 1) {
        for j in stride(from: person[i], through: c+100, by: 1) {
            dp[j] = min(dp[j-person[i]] + price[i], dp[j])
        }
    }

    print(dp[c...c+100].min()!)
}

main()