let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var sum = 0
for i in 0...4 {
    sum += input[i]*input[i]
}
print(sum%10)