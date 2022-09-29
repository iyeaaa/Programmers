/**
* 메모리: 73504 KB, 시간: 148 ms
* 2022.09.29
* by Alub
*/
let dy = [-1, 0, 1, 0]
let dx = [0, -1, 0, 1]
let n = Int(readLine()!)!
var G = [[Int]]()
var memo = [[Int]](repeating: [Int](repeating: 1, count: n), count: n)
var ans = -1

for _ in 0..<n {
    G.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func f(_ y: Int, _ x: Int) -> Int {
    if memo[y][x] != 1 {
        return memo[y][x]
    }

    for i in 0..<4 {
        let ny = y+dy[i], nx = x+dx[i]
        guard (0..<n) ~= ny && (0..<n) ~= nx else { continue }
        if G[ny][nx] <= G[y][x] { continue }
        memo[y][x] = max(memo[y][x], f(ny, nx)+1)
    }
    
    return memo[y][x]
}

for i in 0..<n {
    for j in 0..<n {
        ans = max(ans, f(i, j))
    }
}

print(ans)
