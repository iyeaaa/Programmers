import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), bufIdx = 0
buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { bufIdx += 1 }
    return buffer[bufIdx]
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 {byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

struct C {
    let x: Int
    let y: Int
    let weapon: Int
}

let (n, m, t) = (readInt(), readInt(), readInt())
var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
var visit = Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: m), count: n)
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]

(0..<n).forEach { i in
    (0..<m).forEach { j in
        graph[i][j] = readInt()
    }
}

var queue = [C(x: 0, y: 0, weapon: 0)]
visit[0][0][0] = 0
var index = 0
var result = -1
while index < queue.count {
    let cur = queue[index]
    if cur.x == n-1 && cur.y == m-1 {
        let temp = visit[n-1][m-1][cur.weapon]
        result = temp <= t ? temp : -1
        break
    }
    for d in direction {
        let nx = (x: cur.x + d[0], y: cur.y + d[1])
        if !(0..<n).contains(nx.x) || !(0..<m).contains(nx.y) {
            continue
        }
        if visit[nx.x][nx.y][cur.weapon] != -1 {
            continue
        }
        if (graph[nx.x][nx.y] == 1 && cur.weapon == 1)
                || graph[nx.x][nx.y] == 2 {
            queue.append(C(x: nx.x, y: nx.y, weapon: 1))
            visit[nx.x][nx.y][1] = visit[cur.x][cur.y][cur.weapon] + 1
        }

        if graph[nx.x][nx.y] == 0 {
            queue.append(C(x: nx.x, y: nx.y, weapon: cur.weapon))
            visit[nx.x][nx.y][cur.weapon] = visit[cur.x][cur.y][cur.weapon] + 1
        }
    }
    index += 1
}

print(result == -1 ? "Fail" : result)