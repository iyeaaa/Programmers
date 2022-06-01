import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer[byteIdx]
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

var dp: [(two: Int, five: Int, result: Int)] = Array(repeating: (0, 0, 0), count: 501)

for i in 2...500 {
    var cur = i
    dp[i].two = dp[i-1].two
    dp[i].five = dp[i-1].five
    while cur % 2 == 0 {
        dp[i].two += 1
        cur /= 2
    }
    while cur % 5 == 0 {
        dp[i].five += 1
        cur /= 5
    }
    dp[i].result = min(dp[i].two, dp[i].five)
}

print(dp[readInt()].result)