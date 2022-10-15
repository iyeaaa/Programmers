/**
* 메모리: 69104 KB, 시간: 28 ms
* 2022.10.16
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var G = [Int](repeating: 0, count: 305)

for _ in 1...N {
    let x = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
    for i in 1...M {
        G[i] = max(G[i], G[i-1])
        G[i] += x[i]
    }
}

print(G[M])