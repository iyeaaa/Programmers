
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (ip[0], ip[1])
var B = [(w: -1, p: -1)]
var cmtW = 0, eqlsCnt = 1
var ans = Int.max

for _ in 0..<N {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    B.append((ip[0], ip[1]))
}
B.sort(by:{$0.p != $1.p ? $0.p<$1.p : $0.w>$1.w})

for i in 1...N {
    let (w, p) = B[i]
    cmtW += w
    eqlsCnt = B[i-1].p == p ? eqlsCnt+1 : 1
    if cmtW < M { continue }
    ans = min(ans, p*eqlsCnt)
}

print(ans == Int.max ? -1 : ans)