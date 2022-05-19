let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var (h, m, s) = (input[0], input[1], input[2])
let cho = Int(readLine()!)!
var arr = [0, 0, 0]

arr[0] = cho/60/60
arr[1] = (cho/60)%60
arr[2] = cho%60

s = (s + arr[2])
m = s / 60 + m + arr[1]
h = m / 60 + h + arr[0]

s %= 60
m %= 60
h %= 24

print(h, m, s)

