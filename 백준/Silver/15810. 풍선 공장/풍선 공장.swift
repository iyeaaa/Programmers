
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (ip[0], ip[1])
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}
var lo=0, hi=100000000001
while lo+1<hi {
    let mid = (lo+hi)/2
    if (A.reduce(0){$0+mid/$1}<M) {lo=mid} else {hi=mid}
}
print(hi)