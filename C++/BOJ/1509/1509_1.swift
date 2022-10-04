/**
* 메모리: 69100 KB, 시간: 1796 ms
* 2022.10.04
* by Alub
*/
func isPalin(_ S: inout [Character], _ s: Int, _ e: Int) -> Bool {
    var i = s, j = e
    while i < j {
        if S[i] != S[j] {
            return false
        }
        i += 1; j -= 1
    }
    return true
}

var S = Array(readLine()!), N = S.count
var memo = Array(0...N)

for i in 1...N {
    for j in 0...i-1 where isPalin(&S, j, i-1) {
        memo[i] = min(memo[i], memo[j]+1)
    }
}

print(memo[N])