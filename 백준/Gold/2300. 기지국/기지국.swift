
let n = Int(readLine()!)!
var b = [(x: -9999999, y: 0)]
var dp = [Int](repeating: 0, count: n+1)

for _ in 0..<n {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    b.append((input[0], input[1]))
}
b.sort{$0.x<$1.x}

dp[1] = 2*abs(b[1].y)
for i in stride(from: 2, through: n, by: 1) {
    var maxHeight = abs(b[i].y)*2
    var temp = Int.max
    for j in stride(from: i-1, through: 0, by: -1) {
        temp = min(temp, dp[j] + max(b[i].x-b[j+1].x, maxHeight))
        maxHeight = max(maxHeight, abs(b[j].y)*2)
    }
    dp[i] = temp
}

print(dp.last!)