let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (R, C) = (input[0], input[1])
let graph: [[Character]] = crtGraph()
var fireStart = [[Int]]()
var fireSecond = [[Int]](repeating: [Int](repeating: Int.max, count: C), count: R)
var jihun = [Int]()

for i in 0..<R {
    for j in 0..<C {
        if graph[i][j] == "F" {
            fireStart.append([i, j])
            continue
        }
        if graph[i][j] == "J" {
            jihun = [i, j]
            continue
        }
    }
}

var result: Any = "IMPOSSIBLE"
if !fireStart.isEmpty {
    fireSpread()
}
print(canEscape())


func canEscape() -> Any {
    var visit = [[Int]](repeating: [Int](repeating: -1, count: C), count: R)
    var queue = [jihun], idx = 0; visit[jihun[0]][jihun[1]] = 0

    while idx < queue.count {
        let (y, x) = (queue[idx][0], queue[idx][1]); idx += 1
        if y == R-1 || x == C-1 || y == 0 || x == 0 { return visit[y][x]+1 }
        for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
            if visit[ny][nx] != -1 { continue }
            if graph[ny][nx] == "#" { continue }
            if fireSecond[ny][nx] <= visit[y][x]+1 { continue }
            queue.append([ny, nx])
            visit[ny][nx] = visit[y][x] + 1
        }
    }

    return "IMPOSSIBLE"
}

func fireSpread() {
    var queue = fireStart, idx = 0
    for q in fireStart { fireSecond[q[0]][q[1]] = 0 }

    while idx < queue.count {
        let (y, x) = (queue[idx][0], queue[idx][1]); idx += 1
        for (ny, nx) in [(y-1,x),(y+1,x),(y,x+1),(y,x-1)] {
            if !((0..<R) ~= ny && (0..<C) ~= nx) { continue }
            if fireSecond[ny][nx] != Int.max { continue }
            if graph[ny][nx] == "#" { continue }
            queue.append([ny, nx])
            fireSecond[ny][nx] = fireSecond[y][x] + 1
        }
    }
}

func crtGraph() -> [[Character]] {
    var result = [[Character]]()
    for _ in 0..<R {
        result.append(Array(readLine()!))
    }
    return result
}

