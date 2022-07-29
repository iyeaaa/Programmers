let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, L, R) = (input[0], input[1], input[2])
var graph: [[Int]] = crtGraph()
var isVisit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

var time = 0
var preGraph = graph
while true {
    for i in 0..<N {
        for j in 0..<N {
            if isVisit[i][j] { continue }
            mergeNation(i, j)
        }
    }
    if preGraph == graph {
        break
    }
    preGraph = graph
    time += 1
    isVisit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
}
print(time)

func mergeNation(_ y: Int, _ x: Int) {
    var nationCnt = 1
    var pplCntSum = graph[y][x]
    var queue = [(y, x)], idx = 0; isVisit[y][x] = true

    while idx < queue.count {
        let (y, x) = queue[idx]; idx += 1
        for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
            if !((0..<N) ~= ny && (0..<N) ~= nx) { continue }
            if !((L...R) ~= abs(graph[ny][nx] - graph[y][x])) { continue }
            if isVisit[ny][nx] { continue }
            queue.append((ny, nx))
            isVisit[ny][nx] = true
            nationCnt += 1
            pplCntSum += graph[ny][nx]
        }
    }

    for (y, x) in queue {
        let person = pplCntSum/nationCnt
        graph[y][x] = person
    }
}

func crtGraph() -> [[Int]] {
    var result = [[Int]]()
    for _ in 0..<N {
        result.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    return result
}

