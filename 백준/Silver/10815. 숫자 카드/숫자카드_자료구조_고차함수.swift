var set = Set<Substring>()
let _ = readLine()
let _ = readLine()!.split{$0==" "}.map{set.insert($0)}
let _ = readLine()
print(readLine()!.split{$0==" "}.map{ String(set.contains($0) ? 1 : 0) }.joined(separator: " "))
