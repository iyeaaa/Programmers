import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0
buffer.append(0)
@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer[byteIdx]
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 {
        byte = readByte()
    }
    while 48...57 ~= byte {
        number = number * 10 + Int(byte-48)
        byte = readByte()
    }
    return number
}

let (n, k) = (readInt(), readInt())
var cost = [0], weight = [0]
var dp = Array(repeating: 0, count: k+1)

for _ in 0..<n {
    weight.append(readInt())
    cost.append(readInt())
}

for i in stride(from: 1, through: n, by: 1) {
    for j in stride(from: k, to: 0, by: -1) {
        if j >= weight[i] {
            dp[j] = max(dp[j], dp[j-weight[i]] + cost[i])
        }
    }
}

print(dp[k])