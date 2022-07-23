let N = Int(readLine()!)!
var graph = Array(repeating: [0], count: N+1)
var time = [Int](repeating: 0, count: N+1)
var dp = [Int](repeating: 0, count: N+1)

for i in 1...N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    time[i] = input[0]
    for j in 1..<input.count {
        graph[i].append(input[j])
    }
}

for i in 1...N {
    for prnt in graph[i] {
        dp[i] = max(dp[prnt] + time[i], dp[i])
    }
}

print(dp.max()!)