
var S = Array(readLine()!)
let N = S.count

for i in 0..<N-1 where S[i] < S[i+1] {
    S.insert(S.remove(at: i+1), at: 0)
}

print(String(S.reversed()))