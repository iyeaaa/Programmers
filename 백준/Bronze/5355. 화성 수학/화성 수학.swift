import Foundation

let CASE = Int(readLine()!)!

for _ in 0..<CASE {
    let input = readLine()!.split{$0==" "}.map{String($0)}
    var num = Double(input[0])!
    for i in 1..<input.count {
        if input[i] == "@" {
            num *= 3
        } else if input[i] == "%" {
            num += 5
        } else if input[i] == "#" {
            num -= 7
        }
    }
    print(String(format: "%.2f", num))
}