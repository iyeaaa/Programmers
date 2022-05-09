let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var (n, m) = (input[0], input[1])

if n < m {
    swap(&n, &m)
}

var gcd = 1
var lcm = n

for i in stride(from: 1, through: m, by: 1) {
    if n % i == 0 && m % i == 0 {
        gcd = i
    }
}

while true {
    if lcm % n == 0 && lcm % m == 0 {
        break
    } else {
        lcm += 1
    }
}

print(gcd)
print(lcm)