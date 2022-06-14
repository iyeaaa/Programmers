import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], idx = 0
@inline(__always) func readByte() -> UInt8 {
    defer { idx += 1 }
    return buffer[idx]
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while 48...57 ~= byte { number = 10*number + Int(byte-48); byte = readByte()}
    return number
}

let (n, m) = (readInt(), readInt())
var parent = Array(0...n)

for _ in 0..<m {
    let u = readInt()
    if u == 0 { merge(readInt(), readInt()); continue }
    print(isUnion(readInt(), readInt()) ? "yes" : "no")
}

func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    parent[x] = find(parent[x])
    return parent[x]
}

func merge(_ x: Int, _ y: Int) {
    let x = find(x)
    let y = find(y)
    if x == y { return }
    parent[y] = x
}

func isUnion(_ x: Int, _ y: Int) -> Bool {
    let x = find(x)
    let y = find(y)
    if x == y { return true }
    return false
}