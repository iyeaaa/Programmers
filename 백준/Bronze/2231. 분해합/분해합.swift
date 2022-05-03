import Foundation

let n = Int(readLine()!)!
var min = Int.max

for i in 0..<n {
    var cons = i
    cons += Array(String(i)).map{Int(String($0))!}.reduce(0){$0+$1}
    if cons == n && i < min {
        min = i
    }
}

if min == Int.max {
    print(0)
} else {
    print(min)
}
