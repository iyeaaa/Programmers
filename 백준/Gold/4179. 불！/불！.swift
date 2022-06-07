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
    while 48...57 ~= byte { number = number * 10 + Int(byte-48); byte = readByte()}
    return number
}
@inline(__always) func readChar() -> Character {
    var byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    return Character(UnicodeScalar(byte))
}

let (r, c) = (readInt(), readInt())
var graph = Array(repeating: Array(repeating: Character("."), count: c), count: r)
var visit = Array(repeating: Array(repeating: -1, count: c), count: r)
var fire = Array(repeating: Array(repeating: -1, count: c), count: r)
var jihun = [Int](), firstFire = [[Int]]()
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]
var fireEA = 0
(0..<r).forEach { i in
    (0..<c).forEach { j in
        graph[i][j] = readChar()
        if graph[i][j] == "F" {
            firstFire.append([i, j])
            fireEA += 1
        }
        if graph[i][j] == "J" {
            jihun = [i, j]
        }
    }
}

if fireEA != 0 {
    moveFire()
}
moveJihun()

print("IMPOSSIBLE")

func isIn(_ y: Int, _ x: Int) -> Bool {
    0..<r ~= y && 0..<c ~= x
}

func moveFire() {
    var index = 0, queue = firstFire
    fire[firstFire[0][0]][firstFire[0][1]] = 0
    while index < queue.count {
        let (y, x) = (queue[index][0], queue[index][1])
        for d in direction {
            let (ny, nx) = (y+d[0], x+d[1])
            if !isIn(ny, nx) || fire[ny][nx] != -1 {
                continue
            }
            if graph[ny][nx] == "#" {
                continue
            }
            fire[ny][nx] = fire[y][x] + 1
            queue.append([ny, nx])
        }
        index += 1
    }
}

func moveJihun() {
    var index = 0, queue = [jihun]
    visit[jihun[0]][jihun[1]] = 0
    while index < queue.count {
        let (y, x) = (queue[index][0], queue[index][1])
        if fire[y][x] != -1 && visit[y][x] >= fire[y][x] {
            index += 1
            continue
        }
        for d in direction {
            let (ny, nx) = (y+d[0], x+d[1])
            if !isIn(ny, nx) {
                print(visit[y][x] + 1); exit(0)
            }
            if visit[ny][nx] != -1 || graph[ny][nx] == "#" {
                continue
            }
            visit[ny][nx] = visit[y][x] + 1
            queue.append([ny, nx])
        }
        index += 1
    }
}