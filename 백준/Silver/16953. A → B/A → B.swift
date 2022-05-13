let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let a = input[0]
var b = input[1]
var count = 1

while a < b {
    if b % 2 == 0 {
        count += 1
        b /= 2
    } else if b % 10 == 1 {
        count += 1
        b /= 10
    } else {
        break
    }
}

print( a == b ? count : -1 )