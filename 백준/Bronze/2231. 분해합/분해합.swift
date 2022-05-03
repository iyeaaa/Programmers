import Foundation

let n = Int(readLine()!)!
var min = 0

for i in 0..<n {
    var cons = i
    for c in String(i) {
        cons += Int(String(c))!
    }
    if cons == n {
        min = i
        break
    }
}

print(min)
