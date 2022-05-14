let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var set1 = Set<String>()
var set2 = Set<String>()
var count = 0

for _ in 0..<n {
    set1.insert(readLine()!)
}

for _ in 0..<m {
    let data = readLine()!
    if set1.contains(data) {
        count += 1
    }
}

print(count)