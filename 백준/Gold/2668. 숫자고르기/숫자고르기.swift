import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0
buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer[byteIdx]
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

let n = readInt()
var graph = Array(repeating: [Int](), count: n+1)
var visit = Array(repeating: false, count: n+1)
var list = [Int]()

for i in 1...n {
    let input = readInt()
    graph[i].append(input)
}

for i in 1...n {
    if !visit[i] {
        visit[i] = true
        if !dfs(start: i, current: i) {
            visit[i] = false
        }
    }
}

for i in 1...n {
    if visit[i] {
        list.append(i)
    }
}

print(list.count)
print(list.sorted().map{String($0)}.joined(separator: "\n"))

func dfs(start: Int, current: Int) -> Bool {
    for i in graph[current] {
        if i == start {
            return true
        }
        if !visit[i] {
            visit[i] = true
            if dfs(start: start, current: i) {
                return true
            } else {
                visit[i] = false
                return false
            }
        }
    }
    return false
}

// 노드 순환을 발견한 노드들만 방문체크가 되도록..