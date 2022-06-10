import Foundation

var buffer = Array(FileHandle.standardInput.readDataToEndOfFile())+[0], idx = 0
@inline(__always) func readByte() -> UInt8 {
    defer { idx += 1 }
    return buffer[idx]
}
@inline(__always) func readString() -> String {
    var result = "", byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while byte != 10 && byte != 32 && byte != 0 {
        result += String(bytes: [byte], encoding: .ascii)!
        byte = readByte()
    }
    return result
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    while 48...57 ~= byte { number = number*10 + Int(byte-48); byte = readByte() }
    return number
}

let n = readInt()
var stack = [Double]()
var dict = [Character: Double]()
for s in readString() {
    if 65...90 ~= s.unicodeScalars.first!.value {
        if let d = dict[s] {
            stack.append(d)
        } else {
            let temp = Double(readInt())
            stack.append(temp)
            dict[s] = temp
        }
    } else {
        var push = 0.0
        if s == "+" {
            push = stack.popLast()! + stack.popLast()!
        } else if s == "-" {
            push = -1*(stack.popLast()! - stack.popLast()!)
        } else if s == "*" {
            push = stack.popLast()! * stack.popLast()!
        } else {
            let temp = stack.popLast()!
            push = stack.popLast()! / temp
        }
        stack.append(push)
    }
}

print(String(format: "%.2f", stack.popLast()!))