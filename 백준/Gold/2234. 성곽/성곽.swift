
// T.C: O((V+E)*V) < 2*1e8

let dy = [0, -1, 0, 1], dx = [-1, 0, 1, 0], dir = [1, 2, 4, 8]
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var v = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
var g = [[Int]]()
var roomCnt = 0
var bigRoomArea = 0
var rmvRoomArea = 0

for _ in 0..<m {
    g.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

for i in 0..<m {
    for j in 0..<n where !v[i][j] {
        roomCnt += 1
        bigRoomArea = max(bigRoomArea, f(i, j))
    }
}

for i in 0..<m { for j in 0..<n {
    for k in 0..<4 where g[i][j] & dir[k] != 0 {
        v = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        g[i][j] ^= dir[k]
        rmvRoomArea = max(rmvRoomArea, f(i, j))
        g[i][j] |= dir[k]
    }
}}

print(roomCnt)
print(bigRoomArea)
print(rmvRoomArea)

func f(_ y: Int, _ x: Int) -> Int {
    var q = [(y, x)], idx = 0; v[y][x] = true
    while idx < q.count {
        let (y, x) = q[idx]; idx += 1
        for i in 0..<4 where g[y][x] & dir[i] == 0 {
            let ny = y+dy[i], nx = x+dx[i]
            if ny<0||ny>=m||nx<0||nx>=n { return -99999 }
            if v[ny][nx] { continue }
            q.append((ny,nx)); v[ny][nx] = true
        }
    }
    return q.count
}