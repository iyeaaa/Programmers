
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, T) = (ip[0], ip[1])
var C = [(w:Int, p:Int)]()
var ans = 0

for _ in 0..<N {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    C.append((ip[0], ip[1]))
}
C.sort{$0.p < $1.p}

for day in T-N..<T {
    let (w, p) = C[day-T+N]
    ans += w + p*day
}

print(ans)