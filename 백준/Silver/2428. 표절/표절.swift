
import Foundation

let N = Int(readLine()!)!
let F = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var ans = 0

for i in 1..<N {
    var lo = -1, hi = i
    while lo+1 < hi {
        let mid = (lo + hi) / 2
        let s = Int(ceil(Double(F[i])*0.9))
        if F[mid] >= s {hi=mid} else {lo=mid}
    }
    ans += i-hi
}

print(ans)