
// T.C: O(V+E) = 100*100*4 + 100*100*4*5 < 2*1e8

let INF = 99999
let dy = [0, 0, 0, 1, -1], dx = [0, 1, -1, 0, 0]
var ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (M, N) = (ip[0], ip[1])
var g = [[0]]
var q = [(Int, Int, Int)](), idx = 0
var v = Array(repeating: Array(repeating: Array(repeating: INF, count: 5), count: N+1), count: M+1)
let ey: Int, ex: Int, ed: Int

for _ in 0..<M {
    g.append([0]+readLine()!.split{$0==" "}.map{Int(String($0))!})
}

ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
q.append((ip[0], ip[1], ip[2]))
v[ip[0]][ip[1]][ip[2]] = 0

ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
ey = ip[0]; ex = ip[1]; ed = ip[2]

while idx < q.count {
    let (y, x, d) = q[idx]; idx += 1
    if ey == y && ex == x && ed == d { print(v[y][x][d]); break }
    for i in 1...3 {
        let ny = y + dy[d]*i, nx = x + dx[d]*i
        if ny<1 || ny>M || nx<1 || nx>N {break}
        if g[ny][nx] == 1 {break}
        if v[ny][nx][d] != INF {continue}
        q.append((ny, nx, d))
        v[ny][nx][d] = v[y][x][d] + 1
    }
    if d == 1 || d == 2 {
        for nd in 3...4 where v[y][x][nd] == INF {
            q.append((y, x, nd))
            v[y][x][nd] = v[y][x][d] + 1
        }
    } else {
        for nd in 1...2 where v[y][x][nd] == INF {
            q.append((y, x, nd))
            v[y][x][nd] = v[y][x][d] + 1
        }
    }
}
