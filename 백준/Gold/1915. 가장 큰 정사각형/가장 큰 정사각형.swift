
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var list: [[Int]] = crtGraph()
var maxValue = 0

for i in 1...N {
    for j in 1...M {
        if list[i][j] == 0 { continue }
        list[i][j] = min(list[i-1][j-1], list[i-1][j], list[i][j-1]) + 1
        maxValue = max(list[i][j], maxValue)
    }
}
print(maxValue*maxValue)


func crtGraph() -> [[Int]] {
    var result = [[Int](repeating: 0, count: M+1)]
    for _ in 0..<N {
        result.append([0]+readLine()!.map{Int(String($0))!})
    }
    return result
}

