
let n = Int(readLine()!)!
var stk = [Int]()
var ans = 0

for _ in 0..<n {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (x, y) = (input[0], input[1])
    while let l = stk.last, l > y {
        stk.removeLast()
        ans += 1
    }
    if (stk.isEmpty || stk.last! < y) && y != 0 {
        stk.append(y)
    }
}

print(ans + stk.count)