let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var graph: [[Int]] = crtGraph()
let INF = -99999
var up = [[Int]](repeating: [Int](repeating: 0, count: M+2), count: N+2)
var down = [[Int]](repeating: [Int](repeating: 0, count: M+2), count: N+2)

up[N][1] = graph[N][1]; up[N][M] = graph[N][M]
down[N][1] = graph[N][1]; down[N][M] = graph[N][M]
for i in stride(from: N-1, through: 1, by: -1) {
    up[i][1] = graph[i][1] + up[i+1][1]
    up[i][M] = graph[i][M] + up[i+1][M]
    down[i][1] = graph[i][1] + down[i+1][1]
    down[i][M] = graph[i][M] + down[i+1][M]
}

for i in stride(from: 2, through: M, by: 1) {
    up[N][i] = up[N][i-1] + graph[N][i]
    down[N][M-i+1] = down[N][M-i+2] + graph[N][M-i+1]
}

for i in stride(from: N-1, through: 1, by: -1) {
    for j in stride(from: 2, through: M, by: 1) {
        up[i][j] = max(up[i+1][j], up[i][j-1]) + graph[i][j]
    }
}

for i in stride(from: N-1, through: 1, by: -1) {
    for j in stride(from: M-1, through: 1, by: -1) {
        down[i][j] = max(down[i+1][j], down[i][j+1]) + graph[i][j]
    }
}

var maxValue = Int.min
for i in 1...N {
    for j in 1...M {
        maxValue = max(maxValue, up[i][j]+down[i][j])
    }
}
print(maxValue)


func crtGraph() -> [[Int]] {
    var result = [[Int](repeating: 0, count: M+1)]
    for _ in 0..<N {
        result.append([0] + readLine()!.split{$0==" "}.map{Int(String($0))!})
    }
    return result + [[Int](repeating: 0, count: M+1)]
}

