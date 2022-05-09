let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input.max()!, input.min()!)
print(gcd(n, m))
print(lcm(n, m))

func gcd(_ t_a: Int, _ t_b: Int) -> Int {
    var (a, b, c) = (t_a, t_b, t_a%t_b)
    while c != 0 {
        a = b
        b = c
        c = a % b
    }
    return b
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b)/gcd(a, b)
}