/**
* 메모리: 76876 KB, 시간: 52 ms
* 2022.10.01
* by Alub
*/
let N = Int(readLine()!)!
let S = readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = [[Int]](repeating: [Int](repeating: 1, count: 2), count: N)
var ans = 1

for i in 1..<N {
    memo[i][0] = S[i-1] <= S[i] ? memo[i-1][0]+1 : 1
    memo[i][1] = S[i-1] >= S[i] ? memo[i-1][1]+1 : 1
    ans = max(ans, memo[i].max()!)
}

print(ans)
