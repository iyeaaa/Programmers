/**
* 메모리: 69112 KB, 시간: 36 ms
* 2022.09.03
* by Alub
*/
let N = Int(readLine()!)!
var G = [[Int]]()
var set = Set<[[Int]]>()
var ans = 0

for _ in 0..<N {
    G.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

dfs(0, G)
print(ans)

func findMV(_ G: [[Int]]) -> Int {
    var MV = 0
    for i in 0..<N {
        for j in 0..<N {
            MV = max(MV, G[i][j])
        }
    }
    return MV
}

func dfs(_ cnt: Int, _ graph: [[Int]]) {
    if set.contains(graph) {
        return
    }

    let MV = findMV(graph)
    ans = max(ans, MV)

    if cnt == 5 {
        return
    }

    dfs(cnt+1, moveLf(graph))
    dfs(cnt+1, moveRyt(graph))
    dfs(cnt+1, moveUp(graph))
    dfs(cnt+1, moveDown(graph))
}

func moveDown(_ G: [[Int]]) -> [[Int]] {
    var G = G
    var M = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    for j in 0..<N {
        for i in stride(from: N-2, through: 0, by: -1) {
            if G[i][j] == 0 { continue }

            var mvx = -1, change = false
            for k in i+1..<N {
                if G[k][j] == 0 {
                    mvx = k
                } else if G[k][j] == G[i][j] {
                    if change || M[k][j] { break }
                    G[k][j] = 0
                    G[i][j] *= 2
                    mvx = k
                    change = true
                } else {
                    break
                }
            }

            if mvx != -1 {
                G[mvx][j] = G[i][j]
                G[i][j] = 0
                M[mvx][j] = change
            }
        }
    }
    return G
}

func moveUp(_ G: [[Int]]) -> [[Int]] {
    var G = G
    var M = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    for j in 0..<N {
        for i in 1..<N {
            if G[i][j] == 0 { continue }

            var mvx = -1, change = false
            for k in stride(from: i-1, through: 0, by: -1) {
                if G[k][j] == 0 {
                    mvx = k
                } else if G[k][j] == G[i][j] {
                    if change || M[k][j] { break }
                    G[k][j] = 0
                    G[i][j] *= 2
                    mvx = k
                    change = true
                } else {
                    break
                }
            }

            if mvx != -1 {
                G[mvx][j] = G[i][j]
                G[i][j] = 0
                M[mvx][j] = change
            }
        }
    }
    return G
}

func moveRyt(_ G: [[Int]]) -> [[Int]] {
    var G = G
    var M = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    for i in 0..<N {
        for j in stride(from: N-1, through: 0, by: -1) {
            if G[i][j] == 0 { continue }

            var mvx = -1, change = false
            for k in j+1..<N {
                if G[i][k] == 0 {
                    mvx = k
                } else if G[i][k] == G[i][j] {
                    if change || M[i][k] { break }
                    G[i][k] = 0
                    G[i][j] *= 2
                    mvx = k
                    change = true
                } else {
                    break
                }
            }

            if mvx != -1 {
                G[i][mvx] = G[i][j]
                G[i][j] = 0
                M[i][mvx] = change
            }
        }
    }
    return G
}

func moveLf(_ G: [[Int]]) -> [[Int]] {
    var G = G
    var M = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    for i in 0..<N {
        for j in 1..<N {
            if G[i][j] == 0 { continue }

            var mvx = -1, change = false
            for k in stride(from: j-1, through: 0, by: -1) {
                if G[i][k] == 0 {
                    mvx = k
                } else if G[i][k] == G[i][j] {
                    if change || M[i][k] { break }
                    G[i][k] = 0
                    G[i][j] *= 2
                    mvx = k
                    change = true
                } else {
                    break
                }
            }

            if mvx != -1 {
                G[i][mvx] = G[i][j]
                G[i][j] = 0
                M[i][mvx] = change
            }
        }
    }
    return G
}