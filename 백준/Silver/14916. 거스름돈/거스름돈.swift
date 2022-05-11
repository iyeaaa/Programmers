var n = Int(readLine()!)!
var count = 0
while n > 0 {
    if n % 5 != 0 {
        n -= 2
        count += 1
    } else {
        count += n/5
        n = 0
        break
    }
}

print(n == 0 ? count : -1)