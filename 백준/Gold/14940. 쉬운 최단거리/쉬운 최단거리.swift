import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), bI = 0
buffer.append(0)

@inline(__always) func rb() -> UInt8 {
    defer { bI +=  1 }
    return buffer[bI]
}

@inline(__always) func readInt() -> Int {
    var n = 0, b = rb(), ne = false
    while b == 10 || b == 32 { b = rb() }
    if b == 45 { ne = true; b = rb() }
    while 48...57 ~= b { n = n * 10 + Int(b - 48); b = rb()}
    return n * (ne ? -1 : 1)
}

let (n, m) = (readInt(), readInt())
var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
typealias point = (x: Int, y: Int)
var start: point = (x: 0, y: 0)
var impossible = Set<[Int]>()
(0..<n).forEach { i in
    (0..<m).forEach { j in
        graph[i][j] = readInt()
        if graph[i][j] == 2 {
            start = (i, j)
        }
        if graph[i][j] == 0 {
            impossible.insert([i, j])
        }
    }
}


var visit = Array(repeating: Array(repeating: -1, count: m), count: n)
visit[start.x][start.y] = 0
var queue = [start]
var index = 0
while index < queue.count {
    let cur = queue[index]
    for d in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
        let next: point = (cur.x+d[0], cur.y+d[1])
        if !(0..<n ~= next.x && 0..<m ~= next.y) {
            continue
        }
        if visit[next.x][next.y] != -1 {
            continue
        }
        if graph[next.x][next.y] == 0 {
            continue
        }
        queue.append(next)
        visit[next.x][next.y] = visit[cur.x][cur.y] + 1
    }
    index += 1
}

var result = ""
for i in 0..<n {
    for j in 0..<m {
        if visit[i][j] == -1 && impossible.contains([i, j]) {
            visit[i][j] = 0
        }
        result += "\(visit[i][j]) "
    }
    result += "\n"
}
print(result)