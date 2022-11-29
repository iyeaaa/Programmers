var ans = ""
for _ in 0..<Int(readLine()!)! {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (x, y) = (ip[0], ip[1]), diff = y-x
    var e = 0
    for i in 1... {
        if i*i >= diff { e = i-1; break }
    }
    ans += "\(e*e+e>=diff ? e*2 : e*2+1)\n"
}
print(ans)