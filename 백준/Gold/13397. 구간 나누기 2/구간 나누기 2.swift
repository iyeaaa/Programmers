
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let l = readLine()!.split{$0==" "}.map{Int(String($0))!}

var lo = -1, hi = 10001
while lo + 1 < hi {
    let mid = (lo + hi) / 2
    if psb(mid) {hi=mid} else {lo=mid}
}
print(hi)

func psb(_ x: Int) -> Bool {
    var mn = l.first!, mx = l.first!, cnt = m-1
    l.forEach{
        mx = max(mx, $0); mn = min(mn, $0)
        if mx - mn > x {
            cnt-=1; mx=$0; mn=$0
        }
    }
    return cnt >= 0
}