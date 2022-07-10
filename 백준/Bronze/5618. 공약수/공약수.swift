import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    a == 0 ? b : gcd(b%a, a)
}

let n = Int(readLine()!)!
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
let g: Int
if n == 2 {
    g = gcd(list[0], list[1])
} else {
    g = gcd(list[0], gcd(list[1], list[2]))
}

var result = ""
for i in stride(from: 1, through: g/2, by: 1) {
    if g%i == 0 {
        result += "\(i)\n"
    }
}
print(result + "\(g)")