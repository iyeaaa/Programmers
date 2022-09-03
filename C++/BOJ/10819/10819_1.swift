/**
* 메모리: 69104 KB, 시간: 32 ms
* 2022.09.03
* by Alub
*/
let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{Int(String($0))!}
var V = [Bool](repeating: false, count: 10)
var ans = Int.min

func perm(_ cnt: Int, _ L: [Int]) {
    if cnt == N {
        var sum = 0
        for i in 1..<L.count {
            let f = L[i-1]
            let l = L[i]
            sum += abs(A[f] - A[l])
        }
        ans = max(ans, sum)
        return
    }
    for i in 0..<N where !V[i] {
        V[i] = true
        perm(cnt+1, L + [i])
        V[i] = false
    }
}

for i in 0..<N {
    V[i] = true
    perm(1, [i])
    V[i] = false
}

print(ans)