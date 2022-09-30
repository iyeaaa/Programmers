/**
* 메모리: 69104 KB, 시간: 24 ms
* 2022.09.30
* by Alub
*/
let N = Int(readLine()!)!
let C = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = [Int](repeating: 100000000, count: N+1); memo[0] = 0

for i in 1...N {
    for j in i...N {
        memo[j] = min(memo[j], memo[j-i]+C[i])
    }
}

print(memo[N])