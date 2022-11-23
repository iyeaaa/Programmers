
let dy = [-1, 0, 1, 0], dx = [0, -1, 0, 1]
let NOT = 0, WALL = 1, CLIENT = 2
var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var (n, m) = (input[0], input[1])
var goal = Array(repeating: Array(repeating: (0, 0), count: n), count: n)
var oil = input[2]
var g = [[Int]]()

for _ in 0..<n {
    g.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

input = readLine()!.split{$0==" "}.map{Int(String($0))!-1}
var (sy, sx) = (input[0], input[1])

for _ in 0..<m {
    input = readLine()!.split{$0==" "}.map{Int(String($0))!-1}
    g[input[0]][input[1]] = CLIENT
    goal[input[0]][input[1]] = (input[2], input[3])
}

while (true) {
    var clients = [(Int, Int)]()
    var use = pickUp(sy, sx, &clients)

    if oil - use < 0 || clients.isEmpty { print(-1); break }

    clients.sort{$0.0 != $1.0 ? $0.0 < $1.0 : $0.1 < $1.1}
    (sy, sx) = clients.first!
    g[sy][sx] = NOT
    oil -= use

    use = moveToGoal(sy, sx, goal[sy][sx])

    if oil - use < 0 { print(-1); break }
    oil += use
    m -= 1
    (sy, sx) = goal[sy][sx]

    if m == 0 { print(oil); break }
}

func moveToGoal(_ y: Int, _ x: Int, _ goal: (Int, Int)) -> Int {
    var q = [(y, x, 0)], idx = 0
    var v = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    v[y][x] = true
    while idx < q.count {
        let (y, x, cnt) = q[idx]; idx += 1
        if (y, x) == goal { return cnt }
        for i in 0..<4 {
            let ny = y+dy[i], nx = x+dx[i]
            if ny<0 || ny>=n || nx<0 || nx>=n { continue }
            if g[ny][nx] == WALL { continue }
            if v[ny][nx] { continue }
            q.append((ny, nx, cnt+1))
            v[ny][nx] = true
        }
    }
    return 999999
}

func pickUp(_ y: Int, _ x: Int, _ clients: inout [(Int, Int)]) -> Int {
    var q = [(y, x, 0)], idx = 0, first = false
    var v = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    v[y][x] = true
    var rtn = 999999
    while idx < q.count {
        let (y, x, cnt) = q[idx]; idx += 1
        if g[y][x] == CLIENT {
            clients.append((y, x))
            first = true
            rtn = cnt
            while q.last!.2 > cnt { q.removeLast() }
        }
        for i in 0..<4 {
            let ny = y+dy[i], nx = x+dx[i]
            if ny<0 || ny>=n || nx<0 || nx>=n { continue }
            if g[ny][nx] == WALL { continue }
            if v[ny][nx] { continue }
            if !first {
                q.append((ny, nx, cnt + 1))
                v[ny][nx] = true
            }
        }
    }
    return rtn
}