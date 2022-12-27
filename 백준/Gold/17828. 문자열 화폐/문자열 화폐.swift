
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
var (N, X) = (ip[0], ip[1])
var ans = ""

for i in 1...N {
    var flag = false
    for j in 1...26 {
        if X-j > 26*(N-i) { continue }
        ans += String(UnicodeScalar(j+64)!)
        flag = true
        X -= j
        break
    }
    if !flag || X < 0 {
        ans = "!"; break
    }
}

print(ans)