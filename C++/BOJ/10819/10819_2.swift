/**
* 메모리: 69104 KB, 시간: 32 ms
* 2022.09.03
* by Alub
*/
let N = Int(readLine()!)!
let L = readLine()!.split(separator: " ").map{Int(String($0))!}
var V = [Bool](repeating: false, count: 10)
var ans = Int.min

func perm(_ cnt: Int, _ A: [Int]) {
    if cnt == N {
        var sum = 0
        for i in 1..<A.count {
            sum += abs(A[i] - A[i-1])
        }
        ans = max(ans, sum)
        return
    }
    for i in 0..<N where !V[i] {
        V[i] = true
        perm(cnt+1, A + [L[i]])
        V[i] = false
    }
}

for i in 0..<N {
    V[i] = true
    perm(1, [L[i]])
    V[i] = false
}

print(ans)