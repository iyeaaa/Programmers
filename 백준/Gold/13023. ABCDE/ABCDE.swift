import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0
buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer[byteIdx]
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while 48...57 ~= byte { number = 10 * number + Int(byte-48); byte = readByte() }
    return number
}

let (n, m) = (readInt(), readInt())
var graph = [[Int]](repeating: [], count: n)
var visit = [Bool](repeating: false, count: n)
for _ in 0..<m {
    let (a, b) = (readInt(), readInt())
    graph[a].append(b)
    graph[b].append(a)
}

for i in 0..<n {
    dfs(i, 0)
}

print(0)

func dfs(_ x: Int, _ digit: Int) {
    visit[x] = true
    if digit == 4 {
        print(1)
        exit(0)
    }
    for i in graph[x] {
        if !visit[i] {
            dfs(i, digit + 1)
        }
    }
    visit[x] = false
}