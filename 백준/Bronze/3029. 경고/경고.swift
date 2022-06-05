import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile()), idx = 0
@inline(__always) func readByte() -> UInt8 {
    defer {idx += 1}
    return buffer[idx]
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 || byte == 58 { byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte-48); byte = readByte()}
    return number
}

var (ch, cm, cs) = (readInt(), readInt(), readInt())
var t = (readInt(), readInt(), readInt())

if t.0 == ch && t.1 == cm && t.2 == cs {
    print("24:00:00")
    exit(0)
}

var fh = 0, fm = 0, fs = 0
if t.2 < cs {
    fs = 60 + t.2
    t.1 -= 1
} else {
    fs = t.2
}
if t.1 < cm {
    fm = 60 + t.1
    t.0 -= 1
} else {
    fm = t.1
}
if t.0 < ch {
    fh = t.0 + 24
} else {
    fh = t.0
}


print(String(format: "%02d:%02d:%02d", fh-ch, fm-cm, fs-cs))