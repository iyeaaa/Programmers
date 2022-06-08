import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while !(48...57 ~= byte) { byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number
}

@inline(__always) func readCharacter() -> UInt8 {
    var byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    return byte
}

@inline(__always) func readCharacters() -> [UInt8] {
    var byte = readByte(), characters = [UInt8]()
    while !(68...82 ~= byte) { byte = readByte() }
    while 68...82 ~= byte { characters.append(byte); byte = readByte() }
    return characters
}

@inline(__always) func writeByString(_ output: String) {
    FileHandle.standardOutput.write(output.data(using: .utf8)!)
}
