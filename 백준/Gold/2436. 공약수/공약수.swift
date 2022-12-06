
import Foundation

let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (gcd, lcm, mt) = (ip[0], ip[1], ip[0]*ip[1])
var ans1 = 0, ans2 = 0

f: for i in stride(from: gcd, through: Int(sqrt(Double(mt))+0.5), by: gcd) {
    if mt % i != 0 { continue }
    let a = i, b = mt/i
    if b % gcd != 0 { continue }
    for mod in stride(from: gcd+1, through: a, by: 1) {
        if a%mod == 0 && b%mod == 0 {
            continue f
        }
    }
    ans1 = a; ans2 = b
}

print(ans1, ans2, separator: " ")