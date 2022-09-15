/**
* 메모리: 69100 KB, 시간: 336 ms
* 2022.09.15
* by Alub
*/
var G = [[Character]]()
var isPa = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
var ans = 0
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

for _ in 0..<5 {
    G.append(Array(readLine()!))
}

dfs(0, 0)
print(ans)

func isConnected(_ idx: Int) -> Bool {
    let y = idx/5, x = idx%5
    var V = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
    var queue = [(y, x)], idx = 0; V[y][x] = true

    var cnt = 1, dasom = G[y][x] == "S" ? 1 : 0

    while idx < queue.count {
        let (y, x) = queue[idx]; idx += 1
        for (ny, nx) in [(y-1,x),(y,x-1),(y+1,x),(y,x+1)] {
            if !((0..<5) ~= ny && (0..<5) ~= nx) { continue }
            if !isPa[ny][nx] || V[ny][nx] { continue }
            if G[ny][nx] == "S" { dasom += 1 }
            cnt += 1; V[ny][nx] = true
            queue.append((ny, nx))
        }
    }

    return cnt == 7 && dasom >= 4
}

func dfs(_ idx: Int, _ cnt: Int) {
    if cnt == 7 {
        if isConnected(idx-1) {
            ans += 1
        }
        return
    }
    for i in stride(from: idx, to: 25, by: 1) {
        let y = i / 5
        let x = i % 5
        isPa[y][x] = true
        dfs(i+1, cnt+1)
        isPa[y][x] = false
    }
}