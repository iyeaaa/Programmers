
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M, K) = (ip[0], ip[1], ip[2])
var beer = [(v:Int,c:Int)]()

for _ in 0..<K {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    beer.append((ip[0], ip[1]))
}
beer.sort{$0.v>$1.v}

var lo = 0, hi=1<<31
while lo+1 < hi {
    let mid = (lo+hi)>>1
    var sum=M, cnt=N
    for (v, c) in beer {
        if c <= mid { sum-=v; cnt-=1 }
        if cnt <= 0 { break }
    }
    if sum<=0&&cnt==0 {hi=mid} else {lo=mid}
}
print(hi==1<<31 ? -1 : hi)