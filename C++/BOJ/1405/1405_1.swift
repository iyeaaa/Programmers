/**
* 메모리: 69108 KB, 시간: 268 ms
* 2022.09.14
* by Alub
*/
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let D = input[1...].map{Double($0)/100}
let dy = [0, 0, -1, 1]
let dx = [1, -1, 0, 0]
var ans: Double = 0
var V = [[Bool]](repeating: [Bool](repeating: false, count: 4*n), count: 4*n)

let y = 2*n, x = 2*n
V[y][x] = true
dfs(0, 1, y, x)
print(ans)

func dfs(_ cnt: Int, _ per: Double, _ y: Int, _ x: Int) {
    if cnt == n {
        ans += per
        return
    }
    for i in 0..<4 where D[i] != 0 {
        let ny = y+dy[i], nx = x+dx[i]
        if V[ny][nx] { continue }
        V[ny][nx] = true
        dfs(cnt+1, per*D[i], ny, nx)
        V[ny][nx] = false
    }
}


