func isBig(_ n: Int) -> Bool { n*(n+1)/2 > s }

let s = Int(readLine()!)!
var (lt, ryt) = (0, 93000)
while lt <= ryt {
    let mid = (lt+ryt)/2
    if isBig(mid) {
        ryt = mid - 1
    } else {
        lt = mid + 1
    }
}
print(ryt)
