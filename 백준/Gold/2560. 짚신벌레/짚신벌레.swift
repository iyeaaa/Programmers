

let MOD = 1000
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (a, b, d, n) = (input[0], input[1], input[2], input[3])
var P = [Int](repeating: 0, count: n+1); P[0]=1

for i in 1...n {
    P[i] = P[i-1]
    if i >= a { P[i] = (P[i]+P[i-a]+MOD) % MOD }
    if i >= b { P[i] = (P[i]-P[i-b]+MOD) % MOD }
}

var sum = P[n]
if n >= d { sum = (sum - P[n-d] + MOD) % MOD }
print(sum)