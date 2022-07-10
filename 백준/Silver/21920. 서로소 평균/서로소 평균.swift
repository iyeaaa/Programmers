import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}
let X = Int(readLine()!)!
let roso = A.filter{gcd($0, X) == 1}
print(Double(roso.reduce(0, +))/Double(roso.count))

func gcd(_ x: Int, _ y: Int) -> Int {
    y == 0 ? x : gcd(y, x%y)
}