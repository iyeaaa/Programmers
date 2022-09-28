/**
* 메모리: 69372 KB, 시간: 20 ms
* 2022.09.28
* by Alub
*/
let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{Int(String($0))!}
var stk = [[Int]](repeating: [A[0]], count: N)
var ans = [Int]()

for i in 0..<N {
    stk[i] = [A[i]]
    for j in 0..<i {
        if A[j] >= A[i] { continue }
        if stk[j].count+1 <= stk[i].count { continue }
        stk[i] = stk[j] + [A[i]]
    }
    if ans.count < stk[i].count {
        ans = stk[i]
    }
}

print(ans.count)
print(ans.map{String($0)}.joined(separator: " "))
