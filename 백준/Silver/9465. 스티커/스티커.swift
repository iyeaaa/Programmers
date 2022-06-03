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

for _ in 0..<readInt() {
    let n = readInt()
    var graph = Array(repeating: Array(repeating: 0, count: 100001), count: 2)
    var dp = Array(repeating: Array(repeating: 0, count: 100001), count: 2)
    for i in 0..<2 {
        for j in 0..<n {
            graph[i][j] = readInt()
        }
    }
    dp[0][0] = graph[0][0]; dp[1][0] = graph[1][0]
    dp[0][1] = graph[1][0] + graph[0][1]; dp[1][1] = graph[0][0] + graph[1][1]
    for i in stride(from: 2, to: n, by: 1) {
        for j in 0...1 {
            dp[j][i] = max(dp[1-j][i-2]+graph[j][i], dp[1-j][i-1]+graph[j][i])
        }
    }
    print(max(dp[0][n-1], dp[1][n-1]))
}