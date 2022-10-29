/**
* 메모리: 79508 KB, 시간: 16 ms
* 2022.10.29
* by Alub
*/
// 0 1 4 6 8 9 10 12 14 15 16 18

import Foundation

var memo = (0...19).map{_ in (0...19).map{_ in 1.0}}
let A = Double(readLine()!)! / 100
let notA = 1.0 - A
let B = Double(readLine()!)! / 100
let notB = 1.0 - B
let not_prime = [0, 1, 4, 6, 8, 9, 10, 12, 14, 15, 16, 18]
var ansA = 0.0, ansB = 0.0

for i in 1...18 {
    for j in 1..<i {
        memo[i][j] = memo[i-1][j-1] + memo[i-1][j]
    }
}

for np in not_prime {
    let dnp = Double(np)
    ansA += pow(A, dnp) * pow(notA, 18-dnp) * memo[18][np]
    ansB += pow(B, dnp) * pow(notB, 18-dnp) * memo[18][np]
}

print(1 - ansA*ansB)