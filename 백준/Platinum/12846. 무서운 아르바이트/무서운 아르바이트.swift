
func crtG(_ x: Int, _ s: Int, _ e: Int) {
    if s == e { g[x] = s; return }
    crtG(x*2, s, (s+e)>>1)
    crtG(x*2+1, (s+e)>>1+1, e)
    g[x] = T[g[x*2]] < T[g[x*2+1]] ? g[x*2] : g[x*2+1]
}

func minT(_ x: Int, _ s: Int, _ e: Int, _ lo: Int, _ hi: Int) -> Int {
    if hi < s || e < lo { return 0 }
    if lo <= s && e <= hi { return g[x] }
    let lf = minT(x*2,s,(s+e)>>1,lo,hi), ryt = minT(x*2+1,(s+e)>>1+1,e,lo,hi)
    return T[lf] < T[ryt] ? lf : ryt
}

func f(_ s: Int, _ e: Int) {
    let mnIdx = minT(1, 1, n, s, e)
    ans = max(ans, T[mnIdx]*(e-s+1))
    if mnIdx > s { f(s, mnIdx-1) }
    if mnIdx < e { f(mnIdx+1, e) }
}

let n = Int(readLine()!)!
let T = [9999999]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var g = [Int](repeating: 0, count: n*4)
var ans = 0

crtG(1, 1, n)
f(1, n)

print(ans)