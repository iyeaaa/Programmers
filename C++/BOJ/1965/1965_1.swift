/**
* 메모리: 69104 KB, 시간: 20 ms
* 2022.09.29
* by Alub
*/
let n = Int(readLine()!)!
let B = readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = [Int](repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i where B[j] < B[i] {
        memo[i] = max(memo[i], memo[j]+1)
    }
}

print(memo.max()!)