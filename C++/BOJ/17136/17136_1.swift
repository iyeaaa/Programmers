/**
* 메모리: 69104 KB, 시간: 112 ms
* 2022.09.11
* by Alub
*/
var G = [[Int]]()
var C = [Int](repeating: 5, count: 6)
var ans = Int.max

for _ in 0..<10 {
    G.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

dfs(0, 0, 0)
print(ans == Int.max ? -1 : ans)

func painting(_ y: Int, _ x: Int, _ len: Int, to n: Int) {
    for i in 0..<len {
        for j in 0..<len {
            G[y+i][x+j] = n
        }
    }
}

func allOne(_ y: Int, _ x: Int, _ len: Int) -> Bool {
    for i in 0..<len {
        for j in 0..<len {
            if G[y+i][x+j] == 0 {
                return false
            }
        }
    }
    return true
}

func dfs(_ y: Int, _ x: Int, _ cnt: Int) {
    if y >= 10 {
        ans = min(ans, cnt); return
    }
    if x >= 10 {
        dfs(y+1, 0, cnt); return
    }
    if G[y][x] == 0 {
        dfs(y, x+1, cnt); return
    }
    for len in stride(from: 5, through: 1, by: -1) {
        if C[len] <= 0  { continue }
        if y+len > 10 || x+len > 10 { continue }
        if !allOne(y, x, len) { continue }
        painting(y, x, len, to: 0)
        C[len] -= 1
        dfs(y, x+len, cnt+1)
        painting(y, x, len, to: 1)
        C[len] += 1
    }
}