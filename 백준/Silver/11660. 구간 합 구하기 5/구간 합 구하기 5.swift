import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), idx = 0
@inline(__always) func readByte() -> UInt8 {
    defer { idx +=  1 }
    return buffer[idx]
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number
}

let (n, m) = (readInt(), readInt())
var graph = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
for i in 0..<n {
    for j in 0..<n {
        graph[i+1][j+1] = graph[i][j+1] + graph[i+1][j] - graph[i][j] + readInt()
    }
}

var result = ""
for _ in 0..<m {
    let (y1, x1, y2, x2) = (readInt(), readInt(), readInt(), readInt())
    result += "\(graph[y2][x2] - graph[y1-1][x2] - graph[y2][x1-1] + graph[y1-1][x1-1])\n"
}

print(result)