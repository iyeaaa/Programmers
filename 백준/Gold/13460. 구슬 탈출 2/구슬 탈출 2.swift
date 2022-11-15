
import Foundation

func hashCode(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> String {
    "\(a) \(b) \(c) \(d)"
}

let dy = [0, 0, 1, -1], dx = [1, -1, 0, 0]
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var g = [[Character]]()
var q = [(Int, Int, Int, Int, Int)](), idx = 0
var v = Set<String>()
var ry=0,rx=0,by=0,bx=0

for i in 0..<n {
    g.append(Array(readLine()!))
    for j in 0..<m {
        if g[i][j] == "R" {
            ry = i; rx = j;
            g[i][j] = "."
        } else if g[i][j] == "B" {
            by = i; bx = j;
            g[i][j] = "."
        }
    }
}

q.append((ry, rx, by, bx, 0))
v.insert(hashCode(ry, rx, by, bx))

while idx < q.count {
    let (ry, rx, by, bx, cnt) = q[idx]; idx += 1

    if cnt >= 10 { break }

    for i in 0..<4 {
        var (ry, rx, by, bx) = (ry, rx, by, bx)
        var nry=ry+dy[i], nrx=rx+dx[i]
        var nby=by+dy[i], nbx=bx+dx[i]

        while g[nry][nrx] == "." && !(nry==by && nrx==bx) || g[nby][nbx] == "." && !(nby==ry && nbx==rx) {
            if g[nry][nrx] == "." && !(nry==by && nrx==bx) {
                ry = nry; rx = nrx;
                nry += dy[i]; nrx += dx[i]
            }
            if g[nby][nbx] == "." && !(nby==ry && nbx==rx) {
                by = nby; bx = nbx;
                nby += dy[i]; nbx += dx[i]
            }
        }

        if g[nby][nbx] == "O" {
            continue
        }

        if g[nry][nrx] == "O" {
            if nry == nby+dy[i] && nrx == nbx+dx[i] {
                continue
            }
            print(cnt + 1)
            exit(0)
        }

        let hc = hashCode(ry, rx, by, bx)
        if !v.contains(hc) {
            q.append((ry, rx, by, bx, cnt+1))
            v.insert(hc)
        }
    }
}

print(-1)
