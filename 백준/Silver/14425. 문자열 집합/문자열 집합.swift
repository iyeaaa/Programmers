let input = readLine()!.split{$0==" "}.map{Int(String($0))!}

var set = Set<String>()

for _ in 0..<input[0] {
    set.insert(readLine()!)
}

var count = 0

for _ in 0..<input[1] {
    if set.contains(readLine()!) { count += 1 }
}

print(count)