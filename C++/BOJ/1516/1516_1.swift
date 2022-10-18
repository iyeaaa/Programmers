/**
* 메모리: 69720 KB, 시간: 32 ms
* 2022.10.18
* by Alub
*/
let N = Int(readLine()!)!
var G = (0...N).map{_ in [Int]()}
var T = (0...N).map{_ in 0}
var memo = T
var edge = T
var queue = [Int](), idx = 0

for i in 1...N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    T[i] = input[0]
    for v in input[1..<input.count-1] {
        G[v].append(i)
        edge[i] += 1
    }
}

for i in 1...N where edge[i] == 0 {
    queue.append(i)
    memo[i] = T[i]
}

while idx < queue.count {
    let cur = queue[idx]; idx += 1
    for next in G[cur] {
        memo[next] = max(memo[next], memo[cur]+T[next])
        edge[next] -= 1
        if edge[next] == 0 { queue.append(next) }
    }
}

print(memo[1...].map{String($0)}.joined(separator: "\n"))
