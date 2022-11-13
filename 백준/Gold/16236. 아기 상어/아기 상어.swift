
import Foundation

func hunt(_ sy: Int, _ sx: Int, _ rank: Int) -> (Int, [(Int, Int)]) {
    func isRange(_ y: Int, _ x: Int) -> Bool {
        (0..<n) ~= y && (0..<n) ~= x
    }

    let baby_rank = rank
    var v = [[Int]](repeating: [Int](repeating: 9999, count: n), count: n)
    var q = [(sy, sx)], idx = 0; v[sy][sx] = 0
    var rtnArr = [(Int, Int)](), rtn_cnt = -1
    var flag = false

    while idx < q.count {
        let (y, x) = q[idx]; idx += 1
        for i in 0..<4 {
            let ny = y+dy[i], nx = x+dx[i]
            if !isRange(ny, nx) { continue }
            if v[ny][nx] != 9999 { continue }
            if g[ny][nx] > baby_rank { continue }
            if (1..<baby_rank) ~= g[ny][nx] {
                rtn_cnt = v[y][x] + 1
                rtnArr.append((ny, nx))
                flag = true
                while !q.isEmpty {
                    var (ly, lx) = q.last!
                    if v[ly][lx] == v[y][x] { break }
                    q.removeLast()
                }
            } else if !flag {
                q.append((ny, nx))
                v[ny][nx] = v[y][x] + 1
            }
        }
    }

    return (rtn_cnt, rtnArr)
}

let n = Int(readLine()!)!
var g = [[Int]]()
let dy = [-1, 0, 0, 1], dx = [0, -1, 1, 0]
var sy = 0, sx = 0
var ans = 0
var rank = 2

for i in 0..<n {
    g.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    for j in 0..<n {
        if g[i][j] == 9 {
            sy = i; sx = j
        }
    }
}

for i in 2... {
    for _ in 0..<i {
        var (cnt, arr) = hunt(sy, sx, i)
        if cnt == -1 {
            print(ans)
            exit(0)
        }
        g[sy][sx] = 0
        ans += cnt
        arr.sort{$0.0 != $1.0 ? $0.0 < $1.0 : $0.1 < $1.1}
        sy = arr.first!.0
        sx = arr.first!.1
        g[sy][sx] = 9
    }
}
