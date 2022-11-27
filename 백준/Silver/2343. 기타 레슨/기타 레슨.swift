
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let g = readLine()!.split{$0==" "}.map{Int(String($0))!}
var lo = 0, hi = 10000*100000+1

while lo+1 < hi {
    let mid = (lo+hi) / 2
    var sum = 0, cnt=M-1
    g.forEach{
        if $0>mid { cnt = -1; return }
        if sum+$0 <= mid {sum+=$0}
        else {cnt-=1; sum=$0}
    }
    if cnt<0 {lo=mid} else {hi=mid}
}

print(hi)

