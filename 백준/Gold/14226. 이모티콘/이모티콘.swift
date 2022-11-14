
// T.C = O(N*N*3 + N*N) = O(N^2) < 1e8

var s = Int(readLine()!)!
var v = [[Bool]](repeating: [Bool](repeating: false, count: 1501), count: 1501)
var q = [(1, 0, 0)], idx = 0

while idx < q.count {
    let (cur, clip, cnt) = q[idx]; idx += 1
    if cur == s {
        print(cnt)
        break
    }
    if !v[cur][cur] {
        q.append((cur, cur, cnt+1))
        v[cur][cur] = true
    }
    if cur+clip <= 1500 && !v[cur+clip][clip] {
        q.append((cur+clip, clip, cnt+1))
        v[cur+clip][clip] = true
    }
    if cur > 1 && !v[cur-1][clip] {
        q.append((cur-1, clip, cnt+1))
        v[cur-1][clip] = true
    }
}