
import Foundation

let N = Int(readLine()!)!
var sum = 0, mx = 0, removed = false, ans = "Kkeo-eok"
var C = [(x: Int, p: Int)]()

for _ in 0..<N {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    C.append((ip[0], ip[1]))
}

for (x, p) in C {
    if sum <= x {
        sum += p
        mx = max(mx, p)
    } else if sum - mx > x {
        if removed { ans = "Zzz"; break }
        removed = true
    } else {
        if removed { ans = "Zzz"; break }
        sum = min(sum - mx + p, sum)
        removed = true
    }
}

print(ans)