
func C(_ x: inout [Int], _ idx: Int, _ stk: [Int]) {
    if stk.count == 6 {
        ans += stk.map{String($0)}.joined(separator: " ") + "\n"
        return
    }
    if idx >= x.count { return }
    C(&x, idx+1, stk+[x[idx]])
    C(&x, idx+1, stk)
}

var ans = ""
while true {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if ip == [0] { break }

    var x = ip[1...].map{Int($0)}
    C(&x, 0, [])
    ans += "\n"
}
print(ans)