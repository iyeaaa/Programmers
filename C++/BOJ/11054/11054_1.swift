/**
* 메모리: 69104 KB, 시간: 20 ms
* 2022.09.27
* by Alub
*/
let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{Int(String($0))!}
var LIS = [Int](repeating: 1, count: N)
var LDS = [Int](repeating: 1, count: N)
var ans = 1

for i in 1..<N {
    for j in 0..<i where A[j] < A[i] {
        LIS[i] = max(LIS[i], LIS[j] + 1)
        ans = max(LIS[i], ans)
    }
}

for i in 1..<N {
    for j in 0..<i where A[j] > A[i] {
        LDS[i] = max(LIS[j]+1, LDS[j]+1, LDS[i])
        ans = max(LDS[i], ans)
    }
}

print(ans)