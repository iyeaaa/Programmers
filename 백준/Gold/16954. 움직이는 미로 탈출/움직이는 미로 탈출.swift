import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), idx = 0
buffer.append(0)
@inline(__always) func readByte() -> UInt8 {
    defer { idx += 1 }
    return buffer[idx]
}
@inline(__always) func readChar() -> Character {
    var byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    return Character(UnicodeScalar(byte))
}

var graph = Array(repeating: Array(repeating: Character("."), count: 8), count: 8)
var visit = [[Int]:Int]()
var wall = Set<[Int]>()
var index = 0, queue = [(7, 0, -1)]; visit[[7, 0], default: 0] += 1

(0..<8).forEach { i in
    (0..<8).forEach { j in
        graph[i][j] = readChar()
        if graph[i][j] == "#" {
            wall.insert([i, j])
        }
    }
}

while index < queue.count {
    let cur = (queue[index].0, queue[index].1, queue[index].2+1)
    if isWall(cur.0, cur.1, cur.2) {
        index += 1
        continue
    }
    if cur.0 == 0 && cur.1 == 7 {
        print(1); exit(0)
    }
    for d in [[-1, 0], [0, -1], [1, 0], [0, 1], [1, 1], [-1, 1], [1, -1], [-1, -1]] {
        let next = (cur.0+d[0], cur.1+d[1], cur.2)
        if !((0..<8) ~= next.0 && (0..<8) ~= next.1) {
            continue
        }
        if isWall(next.0, next.1, next.2) {
            continue
        }
        if let v = visit[[next.0, next.1]] {
            if v > 8 {
                continue
            }
        }
        queue.append((next.0, next.1, next.2))
        visit[[next.0, next.1], default: 0] += 1
    }
    queue.append((cur.0, cur.1, cur.2))
    index += 1
}

print(0)

func isWall(_ y: Int, _ x: Int, _ s: Int) -> Bool {
    for w in wall {
        if y == w[0]+s && x == w[1] {
            return true
        }
    }
    return false
}
