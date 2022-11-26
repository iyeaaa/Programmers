
import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let g = readLine()!.split{$0==" "}.map{Int(String($0))!}
var temp = 0

var lf = 0, ryt = 30*2_000_000_000
while lf < ryt {
    let mid = (lf+ryt) / 2
    if N <= M + g.reduce(0){$0+mid/$1} { ryt = mid }
    else { lf = mid + 1 }
}

if ryt == 0 { print(N); exit(0) }

var cnt = g.reduce(0){$0+(ryt-1)/$1}+M
for i in 0..<M where ryt%g[i] == 0 {
    cnt += 1
    if cnt == N { print(i+1); break }
}