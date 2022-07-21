let S = ["0"] + readLine()!.map{String($0)}, lenS = S.count
let M = Int(readLine()!)!
let AX: [(A: String, X: Int)] = crtAX()
var dp = Array(0..<lenS)

for i in 1..<lenS {
    dp[i] = max(dp[i], dp[i - 1] + 1)
    let strnS = S[i..<lenS].joined()
    for (A, X) in AX {
        let cntA = A.count
        if strnS.hasPrefix(A) {
            dp[i-1+cntA] = max(dp[i-1+cntA], dp[i-1] + X)
        }
    }
}

print(dp.last!)

func crtAX() -> [(A: String, X: Int)] {
    var result = [(String, Int)]()
    for _ in 0..<M {
        let input = readLine()!.split{$0==" "}.map{String($0)}
        result.append((input[0], Int(input[1])!))
    }
    return result
}


