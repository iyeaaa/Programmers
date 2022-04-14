import Foundation

let N = Int(readLine()!)!
var array = readLine()!.split{$0==" "}.map{Int(String($0))!}
var stack = [Int]()

for i in 0..<N {
    while !stack.isEmpty && array[stack.last!] < array[i] {
        array[stack.popLast()!] = array[i]
    }
    stack.append(i)
}

for i in stack {
    array[i] = -1
}

print(array.map{String($0)}.joined(separator: " "))


