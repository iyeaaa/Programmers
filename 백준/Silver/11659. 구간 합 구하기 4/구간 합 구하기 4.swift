var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let array = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: 0, count: n+1); for i in 1...n { dp[i] = dp[i-1] + array[i] }
for _ in 0..<m {
    input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    print(dp[input[1]]-dp[input[0]-1])
}