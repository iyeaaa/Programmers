/**
* 메모리: 69104 KB, 시간: 24 ms
* 2022.09.15
* by Alub
*/
let N = Int(readLine()!)!
let L = readLine()!.split(separator: " ").map{Int(String($0))!}
let J = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = 0

dfs(0, 0, 0)
print(ans)

func dfs(_ idx: Int, _ happy: Int, _ energy: Int) {
    ans = max(ans, happy)

    for i in stride(from: idx, to: N, by: 1) {
        if energy + L[i] >= 100 { continue }
        dfs(i+1, happy+J[i], energy+L[i])
    }
}