import Foundation

let input = readLine()!.split{$0==" "}.map{String($0)}
print(Int(input[0], radix: Int(input[1])!)!)