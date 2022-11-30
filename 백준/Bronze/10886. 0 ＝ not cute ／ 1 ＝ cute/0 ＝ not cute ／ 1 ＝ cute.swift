
var cnt = 0
for _ in 0..<Int(readLine()!)! {
    cnt += Int(readLine()!)! == 0 ? -1 : 1
}
print(cnt < 0 ? "Junhee is not cute!" : "Junhee is cute!")