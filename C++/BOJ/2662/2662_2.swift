/**
* 메모리: 69240 KB, 시간: 16 ms
* 2022.10.16
* by Alub
*/
// f(m, n): 기업 m까지 있을 때, n원을 이용해 얻을 수 있는 가장 큰 이익
// f(m, n) = max(f(m-1, 0 ~ n) + C[m][n ~ 0])
// f(1, n) = C[1][n]

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var N = input[0], M = input[1]
var C = (0...M).map{_ in (0...N).map{_ in 0}}
var memo = C
var path = C
var ansPath = [Int]()
var ans = 0

for _ in 1...N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for j in 1...M {
        C[j][input[0]] = input[j]
    }
}

for i in 1...M {
    for j in 0...N {
        for k in 0...j {
            if memo[i][j] < memo[i-1][k] + C[i][j-k] {
                memo[i][j] = memo[i-1][k] + C[i][j-k]
                path[i][j] = j-k
            }
        }
    }
}

print(memo[M][N])

for i in stride(from: M, to: 0, by: -1) {
    ansPath.append(path[i][N])
    N -= path[i][N]
}

print(ansPath.reversed().map{String($0)}.joined(separator: " "))