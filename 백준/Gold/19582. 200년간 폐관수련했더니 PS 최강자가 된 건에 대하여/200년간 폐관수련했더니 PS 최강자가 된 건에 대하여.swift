
import Foundation

let N = Int(readLine()!)!
var sum = 0, mx = 0, removed = false, ans = "Kkeo-eok", i = 0
var C = [(x: Int, p: Int)]()

for _ in 0..<N {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    C.append((ip[0], ip[1]))
}

while i < N {
    let (x, p) = C[i]
    if sum <= x {
        sum += p
        i += 1
    } else {
        if removed { ans = "Zzz"; break }
        i += 1
        removed = true
    }
}

if ans == "Kkeo-eok" {
    print(ans); exit(0)
}

i = 0; removed = false; ans = "Kkeo-eok"; sum = 0

while i < N {
    let (x, p) = C[i]
    if sum <= x {
        sum += p
        i += 1
        mx = max(mx, p)
    } else {
        if removed { ans = "Zzz"; break }
        sum -= mx
        removed = true
    }
}

print(ans)