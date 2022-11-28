
var ans = 0
var cur = 0
for _ in 0..<4 {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    cur -= input[0]; ans = max(ans, cur); cur += input[1]; ans = max(ans,cur)
}
print(ans)