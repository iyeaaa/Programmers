/**
* 메모리: 69104 KB, 시간: 12 ms
* 2022.10.02
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M, K) = (input[0], input[1], input[2])
var memo = [[Int]](repeating: [Int](repeating: 1, count: M+1), count: N+1)
var ans = ""

for i in 1...N {
    for j in 1...M {
        memo[i][j] = min(memo[i-1][j] + memo[i][j-1], 1_000_000_001)
    }
}

findAns(N, M, K)
print(memo[N][M] < K ? -1 : ans)

func findAns(_ a: Int, _ z: Int, _ k: Int) {
    if a == 0 {
        for _ in 0..<z { ans.append("z") }
        return
    }
    if z == 0 {
        for _ in 0..<a { ans.append("a") }
        return
    }

    let chk = memo[a-1][z]

    if k > chk {
        ans.append("z")
        findAns(a, z-1, k-chk)
    } else {
        ans.append("a")
        findAns(a-1, z, k)
    }
}