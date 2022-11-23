
let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]
var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var g = [[Int]]()
var start = Array(repeating: [(Int, Int, Int)](), count: k+1)
var q = [(Int, Int, Int)](), idx = 0

for i in 0..<n {
    g.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    for j in 0..<n where g[i][j] != 0 {
        start[g[i][j]].append((i, j, 0))
    }
}
input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (s, x, y) = (input[0], input[1], input[2])

for i in 1...k {
    q += start[i]
}

while idx < q.count {
    let (y, x, second) = q[idx]; idx += 1
    for i in 0..<4 {
        let ny = y+dy[i], nx = x+dx[i]
        if ny<0 || ny>=n || nx<0 || nx>=n { continue }
        if g[ny][nx] != 0 { continue }
        if second >= s { continue }
        q.append((ny, nx, second+1))
        g[ny][nx] = g[y][x]
    }
}

print(g[x-1][y-1])