var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0
buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer[byteIdx]
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }    // 공백문자 10->줄바꿈문자, 32->공백문자
    if byte == 45 { byte = readByte(); isNegative = true }  // 45 -> '-'
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() } // 48~57 -> 0~9 숫자들
    return number * (isNegative ? -1 : 1)
}
