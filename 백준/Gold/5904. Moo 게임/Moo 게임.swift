
let N = Int(readLine()!)!
var S = [3]

for i in 1... {
    if S[i-1] >= N { f(i-1, N); break }
    S.append(S[i-1]*2 + (i+3))
}

func f(_ x: Int, _ idx: Int) {
    if x == 0 { print(idx==1 ? "m" : "o"); return }
    if idx <= S[x-1] { f(x-1, idx); return }
    if idx <= S[x-1] + (x+3) { print(S[x-1]+1 == idx ? "m" : "o"); return }
    f(x-1, idx-S[x-1]-(x+3))
}