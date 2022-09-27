/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.09.27
* by Alub
*/
let N = Int(readLine()!)!
var T = [Int](repeating: 0, count: N+1)
var P = [Int](repeating: 0, count: N+1)
var ans = Int.min

for i in 1...N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    T[i] = input[0]; P[i] = input[1]
}

C(1, 0)
print(ans)

func C(_ idx: Int, _ money: Int) {
    ans = max(ans, money)

    for i in stride(from: idx, through: N, by: 1) where i+T[i] <= N+1 {
        C(i+T[i], money+P[i])
    }
}