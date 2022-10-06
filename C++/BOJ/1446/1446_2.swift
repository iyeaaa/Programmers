/**
* 메모리: 69108 KB, 시간: 8 ms
* 2022.10.06
* by Alub
*/
let INF = 9876534321
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var (N, D) = (input[0], input[1])
typealias shortcut = (s: Int, e: Int, d: Int)
var sc = [shortcut]()
var memo = Array(0...D)

for _ in 0..<N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if input[1] > D { continue }
    if input[1] - input[0] <= input[2] { continue }
    sc.append((input[0], input[1], input[2]))
}

sc.sort{$0.e < $1.e}

for (s, e, d) in sc {
    for i in e...D {
        memo[i] = min(memo[i], memo[s] + d + (i-e))
    }
}

print(memo[D])

