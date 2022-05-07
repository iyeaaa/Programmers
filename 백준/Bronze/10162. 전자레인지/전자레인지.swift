let time = [300, 60, 10]
let num = [0, 0, 0]
var n = Int(readLine()!)!
var result = ""

for t in time {
    result += "\(n/t) "
    n %= t
}

if n == 0 {
    print(result)
} else {
    print(-1)
}

