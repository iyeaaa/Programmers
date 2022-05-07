import Foundation

var n = Int(readLine()!)!

while !isFalin(Array(String(n)).map{Int(String($0))!}) || !isPrime(n) {
    n += 1
}

print(n)

func isFalin(_ n: [Int]) -> Bool {
    var new_n = n
    for i in 0..<n.count/2 {
        new_n.swapAt(i, n.count-i-1)
    }
    return new_n == n
}

func isPrime(_ n: Int) -> Bool {
    if n == 1 {
        return false
    }
    for i in stride(from: 2, through: n-1, by: 1) {
        if n % i == 0 {
            return false
        }
    }
    return true
}