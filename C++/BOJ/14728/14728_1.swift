/**
* 메모리: 69104 KB, 시간: 28 ms
* 2022.10.07
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, T) = (input[0], input[1])
var memo = [Int](repeating: 0, count: T+1)
var U = [(Int, Int)]()

for _ in 0..<N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    U.append((input[0], input[1]))
}

for (K, S) in U {
    for i in stride(from: T, through: K, by: -1) {
        memo[i] = max(memo[i], memo[i-K] + S)
    }
}

print(memo.max()!)