func gcd(_ x: Int, _ y: Int) -> Int {
    y == 0 ? x : gcd(y, x%y)
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    result += "\(input[0]*input[1]/gcd(input[0], input[1]))\n"
}
print(result)
