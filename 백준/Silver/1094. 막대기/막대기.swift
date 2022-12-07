
let X = Int(readLine()!)!
var cnt = 1
var sum = 64
var cur = 64

while sum != X {
    sum -= cur; cnt -= 1
    if sum + cur/2 >= X {
        cur /= 2
        sum += cur
        cnt += 1
    } else {
        sum += cur
        cur /= 2
        cnt += 2
    }
}

print(cnt)