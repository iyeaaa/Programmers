import Foundation

var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
var wall = [[Int]]()

for i in 0..<n {
    graph[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for j in 0..<m {
        if graph[i][j] == 1 {
            wall.append([i, j])
        }
    }
}

input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (h, w, sr, sc, fr, fc) = (input[0], input[1], input[2], input[3], input[4], input[5])

var index = 0
var visit = Array(repeating: Array(repeating: -1, count: m), count: n)
visit[sr-1][sc-1] = 0
var queue = [(sr-1, sc-1)]
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
while index < queue.count {
    let (x, y) = queue[index]
    if x == fr-1 && y == fc-1 {
        print(visit[fr-1][fc-1])
        exit(0)
    }
    for i in 0...3 {
        let (nx, ny) = (x+dx[i], y+dy[i])
        if !isCoorPoint(nx, ny) || graph[nx][ny] != 0 || visit[nx][ny] != -1 || existWall(nx, ny)  {
            continue
        }
        queue.append((nx, ny))
        visit[nx][ny] = visit[x][y] + 1
    }
    index += 1
}

print(-1)

func isCoorPoint(_ x: Int, _ y: Int) -> Bool {  // 좌표 범위 검사
    (0...n-h).contains(x) && (0...m-w).contains(y)
}

func existWall(_ x: Int, _ y: Int) -> Bool {    // 테두리검사
    for wa in wall {
        if x..<x+h ~= wa[0] && y..<y+w ~= wa[1] {
            return true
        }
    }
    return false
}



