/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.09.07
* by Alub
*/

typealias food = (S: Int, B: Int)
let N = Int(readLine()!)!
var foods = [food](repeating: (0, 0), count: N)
var answer = Int.max

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    foods[i] = (input[0], input[1])
}

for i in 0..<N {
    dfs(1, foods[i].S, foods[i].B, i+1)
}

print(answer)

func dfs(_ cnt: Int, _ S: Int, _ B: Int, _ idx: Int) {
    answer = min(answer, abs(S-B))

    if (N == cnt) {
        return
    }

    for i in idx..<N {
        dfs(cnt+1, S*foods[i].S, B+foods[i].B, i+1)
    }
}