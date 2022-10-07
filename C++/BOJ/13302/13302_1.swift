/**
* 메모리: 69912 KB, 시간: 12 ms
* 2022.10.07
* by Alub
*/
// 쿠폰 개수를 기억해야하는 이유: n일에 비용이 더 최소라도 쿠폰이 더 많다면 (n+a)일에 쿠폰써서 비용 더 낮출 수도 있음
// f(n, m): n일에 쿠폰 m개를 가지고 있을때까지 필요한 최소비용
// f(n, m) = min(f(n-1, m+3), f(n-1, m-1) + 10000, ---- )

let INF = 987654321
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var P = [Bool](repeating: true, count: N+1)
var L = [(1, 10000, 0), (3, 25000, 1), (5, 37000, 2)]
var memo = [[Int]](repeating: [Int](repeating: INF, count: 1000), count: N+1)

if M != 0 {
    for v in readLine()!.split(separator: " ").map({ Int(String($0))! }) {
        P[v] = false
    }
}

memo[0][0] = 0

for i in 1...N {
    for (day, cost, cp) in L {
        if !P[i] {
            for j in stride(from: 0, through: i*2, by: 1) {
                memo[i][j] = min(memo[i][j], memo[i-1][j])
            }
        }
        for j in stride(from: 0, through: i*2, by: 1) {
            memo[i][j] = min(memo[i][j], memo[i-1][j+3])
            if j - cp < 0 || i - day < 0 { continue }
            memo[i][j] = min(memo[i][j], memo[i-day][j-cp] + cost)
        }
    }
}

print(memo[N].min()!)