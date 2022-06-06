@inline(__always) func readCharacter() -> Character {
    var byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    return Character(UnicodeScalar(byte))
}
// 빠른 방법인가??
