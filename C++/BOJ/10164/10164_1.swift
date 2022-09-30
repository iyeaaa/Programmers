/**
* 메모리: 69104 KB, 시간: 12 ms
* 2022.09.30
* by Alub
*/
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, K) = (input[0], input[1], input[2])
var memo = [Int](repeating: -1, count: N*M+1)
memo[N*M] = 1

if K == 0 {
    print(f(1, N*M))
} else {
    let _ = f(K, N*M)
    print(f(1, K))
}

func f(_ cur: Int, _ END: Int) -> Int {
    if cur == END {
        return memo[END]
    }
    if cur > END {
        return 0
    }
    if memo[cur] != -1 {
        return memo[cur]
    }
    memo[cur] = 0
    if cur % M != 0  {
        memo[cur] += f(cur+1, END)
    }
    memo[cur] += f(cur+M, END)
    return memo[cur]
}