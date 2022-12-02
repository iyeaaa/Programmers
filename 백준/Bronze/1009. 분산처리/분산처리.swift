
for _ in 0..<Int(readLine()!)! {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var rtn = 1
    for _ in 0..<ip[1] {
        rtn = (rtn*ip[0]) % 10
    }
    print(rtn == 0 ? 10 : rtn)
}