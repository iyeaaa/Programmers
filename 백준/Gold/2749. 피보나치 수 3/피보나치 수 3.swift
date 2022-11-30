
let n = Int(readLine()!)!
var f = [Int](repeating: 0, count: 1500001)
f[1] = 1

for i in 2...1500000 {
    f[i] = (f[i-1] + f[i-2]) % 1_000_000
}

print(f[n%1500000])