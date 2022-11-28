
func lower(_ l: inout [Int], _ x: Int) -> Int {
    var lo = -1, hi = l.count
    while lo+1 < hi {
        let mid = (lo+hi) / 2
        if l[mid]>=x{hi=mid}else{lo=mid}
    }
    return hi
}

var ans = ""
for _ in 0..<Int(readLine()!)! {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (k, n) = (ip[0], ip[1])
    let a = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let b = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let c = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let d = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var ab = [Int](), cd = [Int]()
    var rtn = -90999999999999

    a.forEach{v1 in b.forEach{v2 in ab.append(v1+v2)}}; ab.sort()
    c.forEach{v1 in d.forEach{v2 in cd.append(v1+v2)}}; cd.sort()
    ab.forEach{
        let idx = lower(&cd, k-$0)
        if idx<cd.count && abs(rtn-k) > abs(cd[idx]+$0-k) {
            rtn = cd[idx]+$0
        }
        if idx>0 && abs(rtn-k) >= abs(cd[idx-1]+$0-k) {
            rtn = cd[idx-1]+$0
        }
    }
    ans += "\(rtn)\n"
}
print(ans)
