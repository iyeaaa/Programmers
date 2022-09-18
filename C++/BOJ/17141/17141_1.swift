/**
* 메모리: 69296 KB, 시간: 64 ms
* 2022.09.18
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var G = [[Int]]()
var psb = [(Int, Int)]()
var nothing = 0
var virus = [(Int, Int)]()
var ans = Int.max

for i in 0..<N {
    G.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    for j in 0..<N {
        if G[i][j] == 2 {
            psb.append((i, j))
        }
        if G[i][j] != 1 {
            nothing += 1
        }
    }
}

C(0, 0)
print(ans == Int.max ? -1 : ans)

func spread() -> Int {
    var time = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    var maxTime = 0
    var infected_cnt = M
    var V = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    var queue = virus, idx = 0

    for (y, x) in virus { V[y][x] = true }

    while idx < queue.count {
        let (y, x) = queue[idx]; idx += 1
        for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
            guard (0..<N) ~= ny && (0..<N) ~= nx else { continue }
            if V[ny][nx] || G[ny][nx] == 1 { continue }
            queue.append((ny, nx))
            V[ny][nx] = true
            infected_cnt += 1
            time[ny][nx] = time[y][x] + 1
            maxTime = max(maxTime, time[ny][nx])
        }
    }

    return infected_cnt == nothing ? maxTime : Int.max
}

func C(_ idx: Int, _ cnt: Int) {
    if cnt == M {
        ans = min(ans, spread())
        return
    }
    for i in stride(from: idx, to: psb.count, by: 1) {
        virus.append(psb[i])
        C(i+1, cnt+1)
        virus.removeLast()
    }
}