import Foundation

var bytes: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return bytes.withUnsafeBufferPointer { $0[byteIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number
}
