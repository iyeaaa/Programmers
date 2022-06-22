let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0..<n { graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!}) }

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

var result = ""
for _ in 0..<m {
    let abc = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (a, b, c) = (abc[0], abc[1], abc[2])
    result += "\(graph[a-1][b-1] <= c ? "Enjoy other party" : "Stay here")\n"
}
print(result)