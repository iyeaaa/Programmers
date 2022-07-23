typealias Pipe = (L: Int, C: Int)
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (D, P) = (input[0], input[1])
let pipes: [Pipe] = crtPipes()
var dp = [Int](repeating: 0, count: D+1); dp[0] = Int.max

for (L, C) in pipes {
    for i in stride(from: D, through: L, by: -1) {
        dp[i] = max(dp[i], min(dp[i-L], C))
    }
}
print(dp[D])

func crtPipes() -> [Pipe] {
    var result = [Pipe]()
    for _ in 0..<P {
        let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
        result.append(Pipe(L: input[0], C: input[1]))
    }
    return result
}

