import Foundation

// wapas님 IO
var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0
buffer.append(0)

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

let (n, m) = (readInt(), readInt())
let b = readInt()
var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

var max = 0
var min = Int.max
for i in 0..<n {
    for j in 0..<m {
        graph[i][j] = readInt()
        if max < graph[i][j] {
            max = graph[i][j]
        }
        if min > graph[i][j] {
            min = graph[i][j]
        }
    }
}

var result = Int.max
var result_h = 0
f: for h in min...max {
    var temp = 0
    var inven = b
    for i in 0..<n {
        for j in 0..<m {
            if h < graph[i][j] {
                temp += 2 * (graph[i][j] - h)
                inven += (graph[i][j] - h)
            } else if (h > graph[i][j]) {
                temp += h - graph[i][j]
                inven -= h - graph[i][j]
            }
        }
    }
    if result >= temp && inven >= 0 {
        result = temp
        result_h = h
    }
}

print(result, result_h)
