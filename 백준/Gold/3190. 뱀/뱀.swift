let (N, K) = (Int(readLine()!)!, Int(readLine()!)!)
var graph = crtGraph()
let L = Int(readLine()!)!
let dirImfo = crtCvtDir(); var dirIdx = 0;

let (NORTH, EAST, SOUTH, WEST) = (0, 1, 2, 3)
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

var curDir = EAST
var (y, x) = (1, 1)
var isSnake = [(1, 1)], snakeIdx = 0

var time = 0
while true {

    time += 1

    let (ny, nx) = (y+dy[curDir], x+dx[curDir])
    if !((1...N) ~= ny && (1...N) ~= nx) || graph[ny][nx] == 2 {
        break
    }
    (y, x) = (ny, nx)
    isSnake.append((ny, nx))

    if graph[y][x] == 0 {
        let tail = isSnake[snakeIdx]
        snakeIdx += 1
        graph[tail.0][tail.1] = 0
    }
    graph[y][x] = 2

    if dirIdx < dirImfo.count && dirImfo[dirIdx].X == time {
        if dirImfo[dirIdx].C == "L" {
            curDir -= 1
            if curDir < 0 { curDir += 4 }
        } else {
            curDir += 1
            if curDir > 3 { curDir -= 4 }
        }
        dirIdx += 1
    }
}

print(time)

func crtGraph() -> [[Int]] {
    var graph = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)
    for _ in 0..<K {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph[input[0]][input[1]] = 1
    }
    graph[1][1] = 2
    return graph
}

func crtCvtDir() -> [(X: Int, C: String)] {
    var result = [(Int, String)]()
    for _ in 0..<L {
        let input = readLine()!.split{$0==" "}.map{String($0)}
        result.append((Int(input[0])!, input[1]))
    }
    return result
}