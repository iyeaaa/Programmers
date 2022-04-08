let size = readLine()!.split{$0==" "}.map{Int(String($0))!}
var graph = [[Int]](repeating: [Int](repeating: 0, count: size[0]), count: size[1])
let dx = [0, -1, 0, 1]
let dy = [-1, 0, 1, 0]
var queue: [[Int]] = []
var zeroNum = 0

for i in 0..<size[1] {
    let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for j in 0..<size[0] {
        graph[i][j] = temp[j]
        if temp[j] == 1 {
            queue.append([i, j])
        }
        if temp[j] == 0 {
            zeroNum += 1
        }
    }
}

bfs()

func bfs() {
    var count = 0
    var nx: Int = 0
    var ny: Int = 0
    var i = 0
    var max = 1

    while i < queue.count {
        for j in 0...3 {
            nx = queue[i][0] + dx[j]
            ny = queue[i][1] + dy[j]

            if nx < 0 || nx > size[1]-1 || ny < 0 || ny > size[0]-1 {
                continue
            }

            if graph[nx][ny] != 0 {
                continue
            }

            queue.append([nx, ny])
            graph[nx][ny] = graph[nx-dx[j]][ny-dy[j]] + 1
            count += 1
            max = graph[nx][ny]
        }
        i += 1
    }

    if zeroNum == count {
        print(max-1)
    } else {
        print(-1)
    }
}