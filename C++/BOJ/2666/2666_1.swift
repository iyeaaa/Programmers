/**
* 메모리: 69108 KB, 시간: 8 ms
* 2022.10.07
* by Alub
*/
let INF = 987654321
let M = Int(readLine()!)!
let O = readLine()!.split{$0==" "}.map{Int(String($0))!}
var L = [0], N = Int(readLine()!)!
var memo = [[Int]](repeating: [Int](repeating: INF, count: M+1), count: N+1)

for _ in 0..<N {
    L.append(Int(readLine()!)!)
}

for i in 1...M where L[1] != i {
    memo[1][i] = min(abs(O[0]-i)+abs(O[1]-L[1]), abs(O[1]-i)+abs(O[0]-L[1]))
}

for i in stride(from: 2, through: N, by: 1) {
    for j in 1...M where j != L[i] {
        for k in 1...M where k != L[i-1] {
            let cur = (j, L[i])
            let pre = (k, L[i-1])
            memo[i][j] = min(memo[i][j], abs(cur.0-pre.0)+abs(cur.1-pre.1)+memo[i-1][k]
                    , abs(cur.1-pre.0)+abs(cur.0-pre.1)+memo[i-1][k])
        }
    }
}

print(memo[N].min()!)