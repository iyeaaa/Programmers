/**
* 메모리: 69108 KB, 시간: 100 ms
* 2022.09.19
* by Alub
*/
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var G = [[Int]]()
var ryt = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
var ans = Int.min

for _ in 0..<N {
    G.append(Array(readLine()!).map{Int(String($0))!})
}

C(0, 0)
print(ans)

func calculate() -> Int {
    var V = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var L = [Int]()
    for i in 0..<N {
        for j in 0..<M {
            if V[i][j] { continue }
            V[i][j] = true
            var connect = G[i][j]
            if ryt[i][j] {
                var x = j+1
                while x < M && ryt[i][x] {
                    connect = connect*10 + G[i][x]
                    V[i][x] = true
                    x += 1
                }
            } else {
                var y = i+1
                while y < N && !ryt[y][j] {
                    connect = connect*10 + G[y][j]
                    V[y][j] = true
                    y += 1
                }
            }
            L.append(connect)
        }
    }
    return L.reduce(0, +)
}

func C(_ y: Int, _ x: Int) {
    if y >= N {
        ans = max(ans, calculate())
        return
    }
    if x >= M {
        C(y+1, 0)
        return
    }
    ryt[y][x] = false
    C(y, x+1)
    ryt[y][x] = true
    C(y, x+1)
}