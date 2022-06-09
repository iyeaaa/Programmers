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

let (n, m) = (readInt(), readInt())
var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
for i in 1...n {
    for j in 1...m {
        dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + readInt()
    }
}
let k = readInt()
for _ in 0..<k {
    let (y1, x1, y2, x2) = (readInt(), readInt(), readInt(), readInt())
    print(dp[y2][x2]-dp[y2][x1-1]-dp[y1-1][x2]+dp[y1-1][x1-1])
}

