import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), idx = 0
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
var graph = Array(repeating: Array(repeating: [0, 0], count: m), count: n)
var visit = Array(repeating: Array(repeating: false, count: m), count: n)
var zero = Set<[Int]>(), one = Set<[Int]>()
var dict: [Int:Int] = [0: 0]
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]
(0..<n).forEach { i in
    (0..<m).forEach { j in
        graph[i][j][0] = readInt()
        if graph[i][j][0] == 0 {
            zero.insert([i, j])
        } else {
            one.insert([i, j])
        }
    }
}

var number = 1
for o in one {
    if !visit[o[0]][o[1]] {
        dict[number] = bfs(o[0], o[1], number)
        number += 1
    }
}

var max = Int.min
for z in zero {
    var temp = 1
    var visit = Set([0])
    for d in direction {
        let cur = (z[0]+d[0], z[1]+d[1])
        if (0..<n) ~= cur.0 && (0..<m) ~= cur.1 {
            let n = graph[cur.0][cur.1][1]
            if visit.contains(n) {
                continue
            }
            temp += dict[n]!
            visit.insert(n)
        }
    }
    if max < temp {
        max = temp
    }
}
print(max)

func bfs(_ y: Int, _ x: Int, _ number: Int) -> Int {
    var count = 1
    var queue = [(y, x)]
    var index = 0
    visit[y][x] = true
    while index < queue.count {
        let cur = queue[index]
        graph[cur.0][cur.1][1] = number
        for d in direction {
            let next = (cur.0+d[0], cur.1+d[1])
            if !((0..<n) ~= next.0 && (0..<m) ~= next.1) {
                continue
            }
            if visit[next.0][next.1] {
                continue
            }
            if graph[next.0][next.1][0] != 1 {
                continue
            }
            queue.append(next)
            visit[next.0][next.1] = true
            count += 1
        }
        index += 1
    }
    return count
}