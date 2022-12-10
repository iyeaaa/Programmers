
let S = Array(readLine()!), N = S.count
var P = [[Bool]](repeating: [Bool](repeating: true, count: N), count: N)
var memo = Array(0...N)

for i in 1..<N where S[i-1] != S[i] { P[i-1][i] = false }

for len in 2..<N {
    for e in len..<N {
        let s = e - len
        P[s][e] = P[s+1][e-1] && S[s] == S[e]
    }
}

for i in 2...N {
    for j in 0..<i where P[j][i-1] {
        memo[i] = min(memo[i], memo[j]+1)
    }
}

print(memo[N])