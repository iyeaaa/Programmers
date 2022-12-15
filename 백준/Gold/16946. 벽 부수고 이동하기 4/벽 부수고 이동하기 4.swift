
func numbering(_ y: Int, _ x: Int, _ color: Int, _ cnt: inout Int) {
    g[y][x] = color
    cnt += 1
    for dir in 0..<4 {
        let ny = y+dy[dir], nx = x+dx[dir]
        if ny<0 || ny>=N || nx<0 || nx>=M {continue}
        if g[ny][nx] != 0 {continue}
        numbering(ny, nx, color, &cnt)
    }
}

let dy = [-1,0,1,0], dx = [0,-1,0,1]
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (ip[0], ip[1])
var g = [[Int]]()
var color = 2
var cnt = [0, 0]
var ans = ""

for _ in 0..<N {
    g.append(Array(readLine()!).map{Int(String($0))!})
}

for i in 0..<N {
    for j in 0..<M where g[i][j] == 0 {
        var temp = 0
        numbering(i, j, color, &temp)
        cnt.append(temp)
        color += 1
    }
}

for y in 0..<N {
    for x in 0..<M {
        if g[y][x] != 1 { ans += "\(0)"; continue }
        var can = 1
        var save = [Int]()
        for dir in 0..<4 {
            let ny = y+dy[dir], nx = x+dx[dir]
            if ny<0 || ny>=N || nx<0 || nx>=M {continue}
            let nc = g[ny][nx]
            if nc == 1 {continue}
            if save.contains(nc) {continue}
            save.append(nc)
            can += cnt[nc]
        }
        ans += "\(can%10)"
    }
    ans += "\n"
}

print(ans)