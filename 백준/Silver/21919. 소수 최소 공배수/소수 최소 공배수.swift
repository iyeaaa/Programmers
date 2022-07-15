import Foundation

func isPrime(_ x: Int) -> Bool {
    if x <= 1 { return false }
    for i in stride(from: 2, through: Int(sqrt(Double(x))), by: 1) {
        if x%i == 0 {
            return false
        }
    }
    return true
}


let N = Int(readLine()!)!
let primeA = Set(readLine()!.split{$0==" "}.map{Int(String($0))!}.filter{isPrime($0)})

print(primeA.isEmpty ? -1 : primeA.reduce(1, *))