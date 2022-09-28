/**
* 메모리: 71096 KB, 시간: 548 ms
* 2022.09.28
* by Alub
*/
var result = ""

for _ in 0..<Int(readLine()!)! {
    let K = Int(readLine()!)!
    let L = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
    var S = [0]
    var memo = [[Int]](repeating: [Int](repeating: 0, count: K + 1), count: K + 1)

    for i in 1...K {
        S.append(S[i - 1] + L[i])
    }

    for i in 1..<K {
        for tx in 1...K-i {
            let ty = tx + i
            memo[tx][ty] = Int.max
            for mid in tx..<ty {
                memo[tx][ty] = min(memo[tx][ty], memo[tx][mid] + memo[mid+1][ty] + S[ty]-S[tx-1])
            }
        }
    }
    result += "\(memo[1][K])\n"
}

print(result)

