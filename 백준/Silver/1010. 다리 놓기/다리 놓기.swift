let Case = Int(readLine()!)!
var array = [[Int]](repeating: [], count: Case)
var (k, n) = (0, 0)
var result = ""

for i in 0..<Case {
    array[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if k < array[i][0] {
        k = array[i][0]
    }
    if n < array[i][1] {
        n = array[i][1]
    }
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)

for i in 1...n {
    for j in 0...min(i, k) {
        if j == 0 || j == i {
            dp[i][j] = 1
        } else {
            dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
        }
    }
}

for i in 0..<Case {
    result += "\(dp[array[i][1]][array[i][0]])\n"
}

print(result)
