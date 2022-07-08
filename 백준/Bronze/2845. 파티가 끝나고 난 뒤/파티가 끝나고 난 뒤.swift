let input = readLine()!.split{$0==" "}.map{Int($0)!}
let n = input[0]*input[1]
let input2 = readLine()!.split{$0==" "}.map{Int($0)!}
print(input2.map{String($0-n)}.joined(separator: " "))