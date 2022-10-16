/**
* 메모리: 70148 KB, 시간: 24 ms
* 2022.10.16
* by Alub
*/
// f(m, n): 기업 m까지 있을 때, n원을 이용해 얻을 수 있는 가장 큰 이익
// f(m, n) = max(f(m-1, 0 ~ n) + C[m][n ~ 0])
// f(1, n) = C[1][n]

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = input[0], M = input[1]
var C = (0...M).map{_ in (0...N).map{_ in 0}}
var memo = C
var stack = (0...M).map{_ in (0...N).map{_ in [Int]()}}
var ans = (0, 0)

for _ in 1...N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for j in 1...M {
        C[j][input[0]] = input[j]
    }
}

for i in 0...N {
    stack[1][i] = [i]
    memo[1][i] = C[1][i]
}

for i in 2...M {
    for j in 0...N {
        for k in 0...j {
            if memo[i][j] < memo[i-1][k] + C[i][j-k] {
                memo[i][j] = memo[i-1][k] + C[i][j-k]
                stack[i][j] = stack[i-1][k] + [j-k]
                ans = (i, j)
            }
        }
    }
}

print(memo[ans.0][ans.1])
print(stack[ans.0][ans.1].map{String($0)}.joined(separator: " "))