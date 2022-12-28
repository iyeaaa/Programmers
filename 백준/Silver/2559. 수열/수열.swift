
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (ip[0], ip[1])
let L = readLine()!.split{$0==" "}.map{Int(String($0))!}
var sum = L[0..<K].reduce(0, +), ans = sum

for i in stride(from:1,through:N-K,by:1) {
    sum -= L[i-1] - L[i+K-1]
    ans = max(ans, sum)
}

print(ans)