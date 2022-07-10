import Foundation

func isPrime(_ x: Int) -> Bool {
    if x <= 1 { return false }
    for i in stride(from: 2, through: Int(sqrt(Double(x))), by: 1) {
        if x % i == 0 {
            return false
        }
    }
    return true
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    var n = Int(readLine()!)!
    while !isPrime(n) {
        n += 1
    }
    result += "\(n)\n"
}
print(result)

