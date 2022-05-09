var Case = Int(readLine()!)!

while Case > 0 {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m) = (input.max()!, input.min()!)
    print(n*m/gcd(n, m))
    Case -= 1
}

func gcd(_ ta: Int, _ tb: Int) -> Int {
    var (a, b, r) = (ta, tb, ta%tb)
    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}