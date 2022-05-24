_ = readLine()
let set1 = Set(readLine()!.split{$0==" "}.map{Int(String($0))!})
let set2 = Set(readLine()!.split{$0==" "}.map{Int(String($0))!})
let set3 = set1.subtracting(set2)

print(set3.count)
print(set3.sorted().map{String($0)}.joined(separator: " "))