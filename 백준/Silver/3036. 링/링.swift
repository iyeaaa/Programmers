import Foundation

let n = Int(readLine()!)!
let r = readLine()!.split{$0==" "}.map{Int(String($0))!}

for i in 1..<r.count {
    let gcd = gcd(r[0], r[i])
    print("\(r[0]/gcd)/\(r[i]/gcd)")
}

func gcd(_ ta: Int, _ tb: Int) -> Int {
    var (a, b, r) = ta > tb ? (ta, tb, ta%tb) : (tb, ta, tb%ta)
    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}