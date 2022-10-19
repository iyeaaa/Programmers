/**
* 메모리: 71080 KB, 시간: 72 ms
* 2022.10.19
* by Alub
*/
let S = [Character("0")]+Array(readLine()!)
let N = S.count-1
var memo = (0...N).map{_ in (0...N).map{_ in 0}}

for i in 2...N where koi(i-1,i) {
    memo[i-1][i] = 2
}

for len in 3...N {
    for e in len...N {
        let s = e - len + 1
        var temp = 0
        if koi(s, e) {
            temp = max(temp, memo[s+1][e-1]+2)
        }
        for m in s..<e {
            temp = max(temp, memo[s][m] + memo[m+1][e])
        }
        memo[s][e] = temp
    }
}

print(memo[1][N])

func koi(_ i: Int, _ j: Int) -> Bool {
    S[i]=="a" && S[j]=="t" || S[i]=="g" && S[j]=="c"
}