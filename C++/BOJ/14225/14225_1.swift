/**
* 메모리: 71060 KB, 시간: 36 ms
* 2022.09.14
* by Alub
*/
let N = Int(readLine()!)!
let S = readLine()!.split{$0==" "}.map{Int(String($0))!}
var V = [Bool](repeating: false, count: 2000001)

dfs(0, 0)

for i in 1...2000001 {
    if !V[i] {
        print(i)
        break
    }
}

func dfs(_ idx: Int, _ cur: Int) {
    V[cur] = true

    for i in stride(from: idx, to: N, by: 1) {
        dfs(i+1, cur+S[i])
    }
}