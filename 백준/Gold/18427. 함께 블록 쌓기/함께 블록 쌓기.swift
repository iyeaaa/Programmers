let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M, H) = (input[0], input[1], input[2])
let student: [[Int]] = crtStudent()
var dp = Array(repeating: Array(repeating: 0, count: H+1), count: N+1)
dp[0][0] = 1

for i in 1...N {
    dp[i] = dp[i-1]
    for block in student[i] {
        for j in stride(from: H, through: block, by: -1) {
            dp[i][j] = (dp[i-1][j-block]+dp[i][j]) % 10007
        }
    }
}

print(dp[N][H])

func crtStudent() -> [[Int]] {
    var student = [[Int]](repeating: [], count: N+1)
    for i in 1...N {
        student[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
    }
    return student
}