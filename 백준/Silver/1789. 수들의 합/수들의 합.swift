var s = Int(readLine()!)!

var n = 1
while s >= 0 {
    s -= n
    n += 1
}

print(n-2)