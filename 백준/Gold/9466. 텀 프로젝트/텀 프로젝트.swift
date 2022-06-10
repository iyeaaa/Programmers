import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], idx = 0
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
let NOT_VISIT = 0
let CYCLE_IN = -1

var result = ""
for _ in 0..<readInt() {
    let n = readInt()
    var count = 0
    var graph = [0]; for _ in 0..<n { graph.append(readInt()) }
    var state = [Int](repeating: 0, count: n+1)
    for i in 1...n {
        if state[i] == NOT_VISIT { run(i) }
    }
    for i in 1...n {
        if state[i] != CYCLE_IN { count += 1 }
    }
    result += "\(count)\n"

    func run(_ x: Int) {
        var cur = x
        while true {
            state[cur] = x
            cur = graph[cur]
            if state[cur] == x {
                while state[cur] != CYCLE_IN {
                    state[cur] = CYCLE_IN
                    cur = graph[cur]
                }
                return
            } else if state[cur] != 0 {
                return
            }
        }
    }
}

print(result)