func gcd(_ x: Int, _ y: Int) -> Int {
    y == 0 ? x : gcd(y, x%y)
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let n = list[0]
    var sum = 0
    for i in 1...n {
        for j in stride(from: i+1, through: n, by: 1) {
            sum += gcd(list[i], list[j])
        }
    }
    result += "\(sum)\n"
}
print(result)