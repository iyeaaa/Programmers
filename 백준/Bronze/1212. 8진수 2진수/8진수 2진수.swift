import Foundation

var input = readLine()!.map { String($0) }

var binaryArray: [String] = [String(Int(input.first!)!, radix: 2)]
for number in input[1...] {
    let binaryNumber = String(Int(number)!, radix: 2)
    let string = String(format: "%03d", Int(binaryNumber)!)
    binaryArray.append(string)
}

print(binaryArray.joined())