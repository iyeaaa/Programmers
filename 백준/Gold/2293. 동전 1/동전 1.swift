import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
let coins = crtCoins()
let UPPERLIMIT = Int(pow(2, 31.0))
var dp = [Int](repeating: 0, count: 10001); dp[0] = 1

for coin in coins {
    for i in stride(from: coin, through: k, by: 1) {
        dp[i] &+= dp[i-coin]
    }
}

print(dp[k])


func crtCoins() -> [Int] {
    var result = [Int]()
    for _ in 0..<n {
        result.append(Int(readLine()!)!)
    }
    return result
}