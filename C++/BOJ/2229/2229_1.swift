/**
* 메모리: 69104 KB, 시간: 20 ms
* 2022.10.12
* by Alub
*/
// f(n): n까지의 학생 중 전체적으로 조가 잘 짜여진 정도의 최댓값
// f(n) = max(f(0 ~ n-1) + max - min)

let N = Int(readLine()!)!
let L = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var memo = Array(repeating: 0, count: N+1)
var ans = 0

for i in 1...N {
    var big = L[i]
    var small = L[i]
    for j in stride(from: i-1, through: 0, by: -1) {
        memo[i] = max(memo[i], memo[j] + big - small)
        big = max(big, L[j])
        small = min(small, L[j])
    }
}

print(memo[N])