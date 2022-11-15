
let dz = [0, 0, 1, -1, 0, 0]
let dy = [0, 0, 0, 0, 1, -1]
let dx = [1, -1, 0, 0, 0, 0]
var ans = ""

while true {
    func isRange(_ z: Int, _ y: Int, _ x: Int) -> Bool {
        (0..<L) ~= z && (0..<R) ~= y && (0..<C) ~= x
    }

    var flag = false
    let input = readLine()!.split {$0 == " "}.map {Int(String($0))!}
    let (L, R, C) = (input[0], input[1], input[2])
    var g = [[[Character]]](repeating: [], count: L)
    var q = [(Int, Int, Int)](), idx = 0
    var v = (0..<L).map{_ in (0..<R).map{_ in (0..<C).map{_ in 9999}}}

    if L==0 && R==0 && C==0 { break }

    for i in 0..<L {
        for j in 0..<R {
            g[i].append(Array(readLine()!))
            for k in 0..<C where g[i][j][k] == "S" {
                q.append((i, j, k))
                v[i][j][k] = 0
            }
        }
        let _ = readLine()
    }

    while idx < q.count {
        let (z, y, x) = q[idx]; idx += 1
        if g[z][y][x] == "E" {
            ans += "Escaped in \(v[z][y][x]) minute(s).\n"
            flag = true
            break
        }
        for i in 0..<6 {
            let nz = z+dz[i], ny = y+dy[i], nx = x+dx[i]
            if !isRange(nz, ny, nx) { continue }
            if g[nz][ny][nx] == "#" { continue }
            if v[nz][ny][nx] != 9999 { continue }
            q.append((nz, ny, nx))
            v[nz][ny][nx] = v[z][y][x] + 1
        }
    }

    if !flag { ans += "Trapped!\n" }
}

print(ans)