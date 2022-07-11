import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])

var (lf, ryt) = (0, n/2)
while lf <= ryt {
    let mid = (lf + ryt) / 2
    let total = (mid+1)*(n-mid+1)
    if total == k {
        print("YES"); exit(0)
    } else if total > k {
        ryt = mid - 1
    } else {
        lf = mid + 1
    }
}
print("NO")