let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (a_ea, b_ea) = (input[0], input[1])
var a = Set(readLine()!.split{$0==" "}.map{Int(String($0))!})
var b = Set(readLine()!.split{$0==" "}.map{Int(String($0))!})
print(a.union(b).subtracting(a.intersection(b)).count)