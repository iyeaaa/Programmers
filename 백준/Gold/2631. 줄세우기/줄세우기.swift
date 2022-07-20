let N = Int(readLine()!)!
let list: [Int] = crtList()
var dp = [Int](repeating: 1, count: N)

for i in 1..<N {
    for j in 0..<i {
        dp[i] = list[i] >= list[j] ? max(dp[i], dp[j]+1) : dp[i]
    }
}

print(N-dp.max()!)

func crtList() -> [Int] {
    var result = [Int]()
    for _ in 0..<N {
        result.append(Int(readLine()!)!)
    }
    return result
}


