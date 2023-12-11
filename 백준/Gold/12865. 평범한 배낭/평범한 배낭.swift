func solve() {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (N, K) = (input[0], input[1])
    typealias Object = (W: Int, V: Int)
    let list: [Object] = crtList()
    var dp = [Int](repeating: 0, count: K+1)

    for object in list {
        for i in stride(from: K, through: object.W, by: -1) {
            dp[i] = max(dp[i], dp[i-object.W] + object.V)
        }
    }

    print(dp[K])

    func crtList() -> [Object] {
        var result = [Object]()
        for _ in 0..<N {
            let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
            result.append((input[0], input[1]))
        }
        return result
    }

}
solve()

