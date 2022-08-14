var N = Int(readLine()!)!
var cnt = 0
var isMus = false
while N % 5 != 0 {
    N -= 3
    cnt += 1
    if N < 0 {
        isMus = true
        break
    }
}
print(isMus ? -1 : cnt+N/5)