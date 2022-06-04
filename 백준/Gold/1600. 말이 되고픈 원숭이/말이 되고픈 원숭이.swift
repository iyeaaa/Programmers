import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), idx = 0
buffer.append(0)
@inline(__always) func readByte() -> UInt8 {
    defer { idx += 1 }
    return buffer[idx]
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number
}
struct Element {
    let x: Int
    let y: Int
    let c: Int
}

let k = readInt()
let (w, h) = (readInt(), readInt())
let jump = [[-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, -2], [2, -1], [2, 1], [1, 2]]
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]
var graph = Array(repeating: Array(repeating: 0, count: w), count: h)
var visit = Array(repeating: Array(repeating: Array(repeating: -1, count: k+1), count: w), count: h)
for i in 0..<h {
    for j in 0..<w {
        graph[i][j] = readInt()
    }
}

var index = 0
var queue = [Element(x: 0, y: 0, c: 0)]
visit[0][0][0] = 0

while index < queue.count {
    let cur = queue[index]
    if cur.x == h-1 && cur.y == w-1 {
        print(visit[cur.x][cur.y][cur.c])
        exit(0)
    }
    if cur.c < k {
        for j in jump {
            let next = (cur.x+j[0], cur.y+j[1], cur.c+1)
            if isRightPoint(next.0, next.1, next.2) {
                queue.append(Element(x: next.0, y: next.1, c: next.2))
                visit[next.0][next.1][next.2] = visit[cur.x][cur.y][cur.c] + 1
            }
        }
    }
    for d in direction {
        let next = (cur.x+d[0], cur.y+d[1], cur.c)
        if isRightPoint(next.0, next.1, next.2) {
            queue.append(Element(x: next.0, y: next.1, c: next.2))
            visit[next.0][next.1][next.2] = visit[cur.x][cur.y][cur.c] + 1
        }
    }
    index += 1
}

print(-1)

func isRightPoint(_ x: Int, _ y: Int, _ z: Int) -> Bool {
    if !(0..<h ~= x && 0..<w ~= y) {
        return false
    }
    if visit[x][y][z] != -1 {
        return false
    }
    if graph[x][y] == 1 {
        return false
    }
    return true
}

