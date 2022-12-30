
let N = Int(readLine()!)!
var A = [Int.min], ans = 0

for _ in 0..<N {
    A.append(Int(readLine()!)!)
}
A.sort()

for i in 2...N {
    let lo=A[i-1], mid=A[i], hi=A[N]
    ans = max(ans, abs((lo+mid+hi) - mid*3))
}

for i in 2..<N {
    let lo=A[1], mid=A[i], hi=A[i+1]
    ans = max(ans, abs((lo+mid+hi) - mid*3))
}

print(ans)