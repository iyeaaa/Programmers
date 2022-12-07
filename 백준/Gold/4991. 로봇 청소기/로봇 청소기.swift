
// T.C: O(400*10*5) < 1e8

let INF = 9999, dy=[-1,0,1,0], dx=[0,1,0,-1]
var ans = ""

while true {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if ip == [0, 0] { break }
    let (m, n) = (ip[0], ip[1]), ALL_VISIT: Int
    var g = [[Character]]()
    var v = (0..<n).map{_ in (0..<m).map{_ in (0..<1<<10).map{_ in INF}}}
    var dust = (0..<n).map{_ in (0..<m).map{_ in 0}}
    var q = [(Int, Int, Int)](), idx = 0
    var rtn = -1

    var numbering = 1
    for i in 0..<n {
        g.append(Array(readLine()!))
        for j in 0..<m {
            if g[i][j] == "o" {q.append((i, j, 0)); v[i][j][0]=0;}
            else if g[i][j] == "*" {dust[i][j]=numbering; numbering+=1}
        }
    }
    ALL_VISIT = 1<<numbering - 1

    while idx < q.count {
        let (y, x, bit) = q[idx]; idx += 1
        if bit == ALL_VISIT {rtn = v[y][x][bit]; break }
        for i in 0..<4 {
            let ny=y+dy[i], nx=x+dx[i]
            if ny<0 || ny>=n || nx<0 || nx>=m {continue}
            if g[ny][nx]=="x" {continue}
            let nxt_cnt = bit | 1<<dust[ny][nx]
            if v[ny][nx][nxt_cnt] != INF {continue}
            q.append((ny, nx, nxt_cnt))
            v[ny][nx][nxt_cnt] = v[y][x][bit]+1
        }
    }

    ans += "\(rtn)\n"
}

print(ans)

// 36장까지 시험범위