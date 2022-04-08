let size = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = size[0]
let n = size[1]
let h = size[2]
let dz = [-1, 1, 0, 0, 0, 0]
let dx = [0, 0, 0, -1, 0, 1]
let dy = [0, 0, -1, 0, 1, 0]
var map = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: m), count: n), count: h)
var queue = [[Int]]()
var zeroNum = 0

for i in 0..<h {
    for j in 0..<n {
        let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
        for k in 0..<m {
            map[i][j][k] = temp[k]
            if temp[k] == 1 {
                queue.append([i, j, k])
            }
            else if temp[k] == 0 {
                zeroNum += 1
            }
        }
    }
}

bfs()

func bfs() {
    var index = 0
    var count = 0
    var day = 1
    while index < queue.count {
        let z = queue[index][0]
        let x = queue[index][1]
        let y = queue[index][2]
        for i in 0...5 {
            let nz = z + dz[i]
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nz < 0 || nz > h-1 || nx < 0 || nx > n-1 || ny < 0 || ny > m-1 {
                continue
            }

            if map[nz][nx][ny] != 0 {
                continue
            }

            map[nz][nx][ny] = map[z][x][y] + 1
            queue.append([nz, nx, ny])
            count += 1
            day = map[nz][nx][ny]
        }
        index += 1
    }
    if zeroNum == count {
        print(day-1)
    } else {
        print(-1)
    }
}
