import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile())+[0], idx = 0;
@inline(__always) func readByte() -> UInt8 {
    defer { idx += 1 }
    return buffer[idx]
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte-48); byte = readByte() }
    return number
}

for _ in 1...readInt() {
    let coinEA = readInt()
    var coin = [Int](); for _ in 0..<coinEA { coin.append(readInt()) }
    let money = readInt()
    var dp = Array(repeating: 0, count: 10001)
    dp[0] = 1
    for c in coin {
        for m in stride(from: c, through: money, by: 1) {
            dp[m] = dp[m] + dp[m-c]
        }
    }
    print(dp[money])
}