
func gcd(_ y: Int, _ x: Int) -> Int {
    x == 0 ? y : gcd(x, y%x)
}

func lcm(_ y: Int, _ x: Int) -> Int {
    y*x/gcd(y, x)
}

var ans = ""
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (m, n, x, y) = (input[0], input[1], input[2], input[3])
    var limit = lcm(m, n)
    var flag = false
    for i in stride(from: x, through: limit, by: m) {
        var temp = (i%n == 0) ? n : i%n
        if temp == y {
            ans += "\(i)\n"
            flag = true
            break
        }
    }
    if !flag {
        ans += "\(-1)\n"
    }
}

print(ans)