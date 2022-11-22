
import Foundation

let INF = 987654321
let MAX = 16
let N = Int(readLine()!)!
var W = [[Int]]()
var C = [[Int]](repeating: [Int](repeating: -1, count: 1<<MAX), count: MAX)
let all_Visit = (1 << N) - 1

for _ in 0..<N {
    W.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

print(dfs(0, 1))

func dfs(_ cur: Int, _ bit: Int) -> Int {
    if bit == all_Visit {
        return W[cur][0] == 0 ? INF : W[cur][0]
    }
    if C[cur][bit] != -1 {
        return C[cur][bit]
    }

    C[cur][bit] = INF
    for i in 0..<N {
        if W[cur][i] == 0 { continue }
        if bit & (1 << i) == 1 << i { continue }
        C[cur][bit] = min(C[cur][bit], W[cur][i]+dfs(i, bit | 1 << i))
    }
    return C[cur][bit]
}