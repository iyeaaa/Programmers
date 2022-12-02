
// T.C: O(V+E) = O(2500*5*2^6) < 1e8*2

extension Character {
    var code: Int {
        Int(unicodeScalars.first!.value) - (isUppercase ? 65 : 97)
    }
}

let dy = [-1, 0, 1, 0], dx = [0, -1, 0, 1]
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M, INF) = (ip[0], ip[1], 99999999)
var v = (0..<N).map{_ in (0..<M).map{_ in (0...1<<7-1).map{_ in INF}}}
var q = [(Int, Int, Int)](), idx = 0
var g = [[Character]]()
var ans = -1

for i in 0..<N {
    g.append(Array(readLine()!))
    for j in 0..<M where g[i][j] == "0" {
        q.append((i, j, 0))
        v[i][j][0] = 0
    }
}

while idx < q.count {
    let (y, x, key) = q[idx]; idx += 1
    if g[y][x] == "1" {ans = v[y][x][key]; break}
    for i in 0..<4 {
        let ny = y+dy[i], nx = x+dx[i]
        if ny<0 || ny>=N || nx<0 || nx>=M {continue}
        let next = g[ny][nx], code = next.code
        if next == "#" {continue}
        if next.isUppercase && (key&(1<<code)) == 0 {continue}
        let nkey = next.isLowercase ? key | 1<<code : key
        if v[ny][nx][nkey] != INF {continue}
        q.append((ny, nx, nkey))
        v[ny][nx][nkey] = v[y][x][key] + 1
    }
}

print(ans)