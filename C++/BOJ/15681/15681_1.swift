/**
* 메모리: 95716 KB, 시간: 264 ms
* 2022.10.29
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, R, Q) = (input[0], input[1], input[2])
var G = (0...N).map{_ in [Int]()}
var memo = [Int](repeating: -1, count: N+1)
var V = [Bool](repeating: false, count: N+1)
var ans = ""

for _ in 0..<N-1 {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    G[input[0]].append(input[1])
    G[input[1]].append(input[0])
}

V[R] = true
let _ = f(R)

for _ in 0..<Q {
    ans += "\(f(Int(readLine()!)!))\n"
}

print(ans)

func f(_ cur: Int) -> Int {
    if memo[cur] != -1 {
        return memo[cur]
    }
    var temp = 1
    for next in G[cur] where !V[next] {
        V[next] = true
        temp += f(next)
    }
    memo[cur] = temp
    return temp
}