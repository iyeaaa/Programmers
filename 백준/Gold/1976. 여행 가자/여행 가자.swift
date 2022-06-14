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

for i in 1...n {
    for j in 1...n {
        if readInt() == 1 {
            merge(i, j)
        }
    }
}

let start = readInt()
for _ in 1..<m {
    if !isUnion(start, readInt()) {
        print("NO"); exit(0)
    }
}

print("YES")

func find(_ x: Int) -> Int {
    x == parent[x] ? x : find(parent[x])
}

func merge(_ x: Int, _ y: Int) {
    let x = find(x)
    let y = find(y)
    if x == y { return }
    parent[y] = x
}

func isUnion(_ x: Int, _ y: Int) -> Bool {
    find(x) == find(y)
}
