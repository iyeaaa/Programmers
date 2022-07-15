var n = Int(readLine()!)!
var count = 0

if n == 1 || n == 3 {
    print(-1)
} else {
    while n % 5 != 0 {
        n -= 2
        count += 1
    }
    print(count + n/5)
}

