
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, X) = (ip[0], ip[1])
var menu = [(Int, Int)]()
var taste = 0
var use = 1000*N

for _ in 0..<N {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    menu.append((ip[0], ip[1])); taste += ip[1]
}

for (A, B) in menu.sorted(by:{$0.0-$0.1 > $1.0-$1.1}) {
    if use + 4000 > X || A - B <= 0 { break }
    taste += A - B
    use += 4000
}

print(taste)