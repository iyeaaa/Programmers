let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m, r) = (input[0], input[1], input[2])
var graph = Array(repeating: [Int](), count: n+1)
var list = Array(repeating: 0, count: n+1)
var count = 1
var result = ""

for _ in 0..<m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

for i in 1...n {
    graph[i].sort() {$0 < $1}
}

dfs(x: r)

for i in 1...n {
    result += "\(list[i])\n"
}

print(result)

func dfs(x: Int) {
    list[x] = count
    count += 1
    for i in graph[x] {
        if list[i] == 0 {
            dfs(x: i)
        }
    }
}