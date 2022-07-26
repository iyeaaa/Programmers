let N = Int(readLine()!)!
let weights = readLine()!.split{$0==" "}.map{Int(String($0))!}
let M = Int(readLine()!)!
let beads = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: 0, count: 55001); dp[0] = 1

for weight in weights {
    for i in stride(from: 15000, through: weight, by: -1) {
        dp[i] += dp[i-weight]
    }
}

var result = ""
var isYes = false
for bead in beads {
    for i in 0...15000 where dp[i] >= 1 && dp[i+bead] >= 1 {
        isYes = true
        break
    }
    result += (isYes ? "Y " : "N ")
    isYes = false
}
print(result)
