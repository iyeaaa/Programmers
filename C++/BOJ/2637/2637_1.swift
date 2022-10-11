/**
* 메모리: 69116 KB, 시간: 12 ms
* 2022.10.11
* by Alub
*/
// f(n, m): 중간부품 또는 완제품 n을 만드는데 필요한 기본부품 m의 개수
// f(n, m) = K1 * f(Y1, m) + K2 * f(Y2, m) + ---

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var inDegree = [Int](repeating: 0, count: N+1)
var G = [[Int]](repeating: [], count: N+1)
var C = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)
var memo = [[Int]](repeating : [Int](repeating: 0, count: N+1), count: N+1)
var basic = Set<Int>()
var queue = [Int](), idx = 0

for _ in 0..<M {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (X, Y, K) = (input[0], input[1], input[2])
    G[Y].append(X); C[X][Y] = K
    inDegree[X] += 1
}

for i in 1...N where inDegree[i] == 0 {
    queue.append(i)
    basic.insert(i)
}

for _ in 1...N {
    let cur = queue[idx]; idx += 1
    if basic.contains(cur) {
        memo[cur][cur] = 1
    } else {
        for i in 1...N {
            for j in basic {
                memo[cur][j] += C[cur][i] * memo[i][j]
            }
        }
    }
    for next in G[cur] {
        inDegree[next] -= 1
        if inDegree[next] != 0 { continue }
        queue.append(next)
    }
}

for i in basic.sorted() {
    print(i, memo[N][i])
}