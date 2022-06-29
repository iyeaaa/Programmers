let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, s) = (input[0], input[1])
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var count = 0

func dfs(_ start: Int, _ sum: Int, _ digit: Int) {
    if sum == s && digit != 0 { count += 1 }
    for i in start..<n {
        dfs(i+1, sum + list[i], digit+1)
    }
}

dfs(0, 0, 0)
print(count)