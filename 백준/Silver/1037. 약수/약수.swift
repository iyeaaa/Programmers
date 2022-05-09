let n = Int(readLine()!)!
let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
print(temp.max()!*temp.min()!)