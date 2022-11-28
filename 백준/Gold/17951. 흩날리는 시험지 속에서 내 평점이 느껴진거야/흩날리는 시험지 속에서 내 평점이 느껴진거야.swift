let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
let x = readLine()!.split{$0==" "}.map{Int(String($0))!}
var lo = -1, hi = 20*N+1
while lo+1 < hi {
    let mid = (lo+hi)/2
    var cnt = 0, sum = 0
    x.forEach{if sum+$0<mid {sum+=$0} else {sum=0;cnt+=1}}
    if cnt>=K {lo=mid} else {hi=mid}
}
print(lo)