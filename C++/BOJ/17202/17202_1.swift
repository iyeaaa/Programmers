/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.10.13
* by Alub
*/
let A = Array(readLine()!).map{Int(String($0))!}
let B = Array(readLine()!).map{Int(String($0))!}
var L = [Int]()

for i in 0..<8 {
    L.append(A[i])
    L.append(B[i])
}

for i in stride(from: 16, through: 3, by: -1) {
    for j in 0..<i-1 {
        L[j] = (L[j] + L[j+1]) % 10
    }
}

print(String(L[0]) + String(L[1]))