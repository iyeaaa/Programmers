/**
* 메모리: 79648 KB, 시간: 12 ms
* 2022.09.29
* by Alub
*/
import Foundation

var S = [0]+Array(readLine()!).map{Int(String($0))!}
let N = S.count-1
S += [Int](repeating: 0, count: 5000)
var memo = [Int](repeating: 1, count: 5001)

if S[1] == 0 { memo[1] = 0; memo[2] = 0 }
else if S[2] == 0 { memo[2] = S[1] > 2 ? 0 : 1 }
else {
    memo[2] = S[1]*10 + S[2] > 26 ? 1 : 2
}

for i in stride(from: 3, through: N, by: 1) {
    if S[i-1] == 0 && S[i] == 0 {
        print(0); exit(0)
    } else if S[i-1] == 0 {
        memo[i] = memo[i-1]
    } else if S[i] == 0 && S[i-1] > 2 {
        print(0); exit(0)
    } else if S[i] == 0 {
        memo[i] = memo[i-2]
    } else {
        memo[i] = (S[i-1]*10 + S[i] > 26 ? memo[i-1] : memo[i-1] + memo[i-2]) % 1000000
    }
}

print(memo[N])