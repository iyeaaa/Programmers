
import Foundation

// bfs T.C: O(1000+1000*999) = O(1_000_000)
// search T.C: O(log(sqrt(2 * 10000^2))) = O(4)
// 4000000 < 1e8

func dist(_ y1: Int, _ x1: Int, _ y2: Int, _ x2: Int) -> Int {
    let rtn = Int(ceil(sqrt(Double((y2-y1)*(y2-y1) + (x2-x1)*(x2-x1)))))
    return rtn%10 == 0 ? rtn/10 : rtn/10+1
}

let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (ip[0], ip[1])
var g = [(x:0, y:0)]
let ey = 10000, ex = 10000

for _ in 0..<n {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    g.append((ip[0], ip[1]))
}

var lo=0, hi=Int(sqrt(200000000))+1
while lo+1 < hi {
    let mid = (lo + hi) / 2
    if !psb(mid) {lo=mid} else {hi=mid}
}
print(hi)

func psb(_ mxOil: Int) -> Bool {
    var v = [Int](repeating: 99999, count: n+1)
    var q = [0], idx = 0; v[0] = 0

    while idx < q.count {
        let cur = q[idx]
        let (y, x) = g[cur]; idx += 1
        if dist(y, x, ey, ex) <= mxOil { return true }
        if v[cur] > k { continue }
        for next in 1...n where v[next] == 99999 {
            let (ny, nx) = g[next]
            if dist(y, x, ny, nx) > mxOil { continue }
            q.append(next)
            v[next] = v[cur] + 1
        }
    }

    return false
}
