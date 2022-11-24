
let n = Int(readLine()!)!, k = Int(readLine()!)!
var (lf, ryt) = (1, k)

while lf <= ryt {
    let mid = (lf + ryt) / 2
    var cnt = 0
    for i in 1...n {
        cnt += min(n, mid/i)
    }
    if cnt < k {
        lf = mid + 1
    } else {
        ryt = mid - 1
    }
}

print(lf)