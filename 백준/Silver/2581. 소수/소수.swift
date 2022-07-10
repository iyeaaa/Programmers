import Foundation

var sum = 0, list = [Int]()
for i in Int(readLine()!)!...Int(readLine()!)! {
    if isPrime(i) {
        sum += i
        list.append(i)
    }
}
if list.isEmpty {
    print(-1)
} else {
    print(sum, list[0], separator: "\n")
}


func isPrime(_ x: Int) -> Bool {
    if x == 1 { return false }
    for i in stride(from: 2, through: Int(sqrt(Double(x))), by: 1) {
        if x % i == 0 {
            return false
        }
    }
    return true
}