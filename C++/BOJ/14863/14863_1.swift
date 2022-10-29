/**
* 메모리: 148292 KB, 시간: 772 ms
* 2022.10.29
* by Alub
*/
// f(n, m): n번째 구간을 지났을때 j시간이 걸렸을 때의 최대 모금액
// f(n, m) = max(

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
let INF = Int.min
var memo = [[Int]](repeating: [Int](repeating: INF, count: K+1), count: N+1)

memo[0][0] = 0

for i in 1...N {
    let ipt = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (wt, wm, bt, bm) = (ipt[0], ipt[1], ipt[2], ipt[3])
    for j in wt...K {
        memo[i][j] = memo[i-1][j-wt] + wm
    }
    for j in bt...K {
        memo[i][j] = max(memo[i][j], memo[i-1][j-bt] + bm)
    }
}

print(memo[N].max()!)