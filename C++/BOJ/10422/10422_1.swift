/**
* 메모리: 69100 KB, 시간: 24 ms
* 2022.10.19
* by Alub
*/
let MOD = 1_000_000_007
var memo = (0...5000).map{_ in 0}
memo[0] = 1; memo[2] = 1

for i in stride(from: 4, through: 5000, by: 2) {
    var temp = 0
    for j in stride(from: 2, through: i, by: 2) {
        temp = (temp + memo[j-2]*memo[i-j]) % MOD
    }
    memo[i] = temp
}

for _ in 0..<Int(readLine()!)! {
    print(memo[Int(readLine()!)!])
}