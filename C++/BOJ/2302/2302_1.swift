/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.10.01
* by Alub
*/
let N = Int(readLine()!)!
let M = Int(readLine()!)!
var memo = [Int](repeating: 1, count: 41); memo[2] = 2
var VIP = [Bool](repeating: false, count: N+1)
var cnt = 0
var ans = 1

for i in stride(from: 2, through: N, by: 1) {
    memo[i] = memo[i-1] + memo[i-2]
}

for _ in 0..<M {
    VIP[Int(readLine()!)!] = true
}

for i in 1...N {
    if VIP[i] {
        ans *= memo[cnt]
        cnt = 0
        continue
    }
    cnt += 1
}

print(ans * memo[cnt])