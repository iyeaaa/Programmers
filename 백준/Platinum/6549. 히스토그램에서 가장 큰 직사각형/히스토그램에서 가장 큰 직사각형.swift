
var ans = ""
while true {
    let h = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let n = h[0]; if n == 0 { break }

    ans += "\(f(1, n))\n"

    func midArea(_ x: Int, _ s: Int, _ e: Int) -> Int {
        func loMove() {
            lo -= 1
            mnH = min(mnH, h[lo])
            rtn = max(rtn, (hi-lo+1)*mnH)
        }
        func hiMove() {
            hi += 1
            mnH = min(mnH, h[hi])
            rtn = max(rtn, (hi-lo+1)*mnH)
        }
        var rtn = h[x]
        var lo=x, hi=x
        var mnH = h[x]
        while true {
            if lo == s && hi == e { break }
            if lo > s && hi < e {
                if h[lo-1] > h[hi+1] {loMove()}
                else {hiMove()}
            }
            else if lo > s {loMove()}
            else {hiMove()}
        }
        return rtn
    }

    func f(_ s: Int, _ e: Int) -> Int {
        if s == e { return h[s] }
        let mid = (s+e)/2
        return max(midArea(mid, s, e), f(s, mid), f(mid+1,e))
    }
}
print(ans)