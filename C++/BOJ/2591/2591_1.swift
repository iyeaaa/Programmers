/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.10.16
* by Alub
*/
let C = [0]+Array(readLine()!).map{Int(String($0))!}
let N = C.count-1
var memo = [Int](repeating: 0, count: 41)

memo[1] = C[1]==0 ? 0 : 1

if C[1] == 0 {
    memo[2] = 0
} else if C[2] == 0 && C[1] > 3 {
    memo[2] = 0
} else if C[2] == 0 || C[1]*10 + C[2] > 34 {
    memo[2] = 1
} else {
    memo[2] = 2
}

for i in stride(from: 3, through: N, by: 1) {
    memo[i] = C[i]==0 ? 0 : memo[i-1]
    if C[i-1] == 0 {continue}
    if C[i] == 0 && C[i-1] > 3 {continue}
    if C[i-1]*10 + C[i] > 34 {continue}
    memo[i] += memo[i-2]
}

print(memo[N])
