
let n = Int(readLine()!)!
var h = [(Int, Int)]()
var end = Int.max

for _ in 0..<n {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    h.append((ip[0], ip[1]))
}

for (d, t) in h.sorted{$0.1 > $1.1} {
    end = min(end, t) - d
}

print(end)