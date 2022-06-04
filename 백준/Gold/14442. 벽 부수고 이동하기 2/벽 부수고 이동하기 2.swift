import Foundation // wapas님 소스코드 참고

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

@inline(__always) func readCharacter() -> UInt8 {
    var byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    return byte
}

typealias Data = (y: Int, x: Int, k: Int, d: Int)
let dy = [0, 1, 0, -1, 0, 1, 0, -1]
let dx = [1, 0, -1, 0, 1, 0, -1, 0]
let dk = [0, 0, 0, 0, -1, -1, -1, -1]

let (N, M, K) = (readInt(), readInt(), readInt())

let maxSize = N * M * (K + 1)
var array: [Data] = Array(repeating: (-1, -1, -1, -1), count: maxSize)
var dataSize = 0
var frontIdx = 0
var rearIdx = 1

var board = Array(repeating: Array(repeating: false, count: M), count: N)
(0..<N).forEach { y in
    (0..<M).forEach { x in
        board[y][x] = readCharacter() == 49
    }
}

func isValidCoord(_ y: Int, _ x: Int, _ k: Int) -> Bool {
    return 0..<N ~= y && 0..<M ~= x && 0...K ~= k
}

var maxArray = Array(repeating: Array(repeating: -1, count: M), count: N)
maxArray[0][0] = K

array[rearIdx] = (0, 0, K, 1)
rearIdx = (rearIdx + 1) % maxSize
dataSize += 1

while dataSize != 0 {
    let (y, x, k, d) = array[(frontIdx + 1) % maxSize]
    frontIdx = (frontIdx + 1) % maxSize
    dataSize -= 1

    if y == N - 1 && x == M - 1 {
        print(d)
        exit(0)
    }

    for i in 0..<8 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        let nk = k + dk[i]
        let nd = d + 1

        if !isValidCoord(ny, nx, nk) {
            continue
        }

        if nk == k && board[ny][nx] {
            continue
        }

        if nk < k && !board[ny][nx] {
            continue
        }

        if maxArray[ny][nx] >= nk {
            continue
        }

        maxArray[ny][nx] = nk

        array[rearIdx] = (ny, nx, nk, nd)
        rearIdx = (rearIdx + 1) % maxSize
        dataSize += 1
    }
}

print(-1)
