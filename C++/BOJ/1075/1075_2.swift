/**
* 메모리: 79508 KB, 시간: 12 ms
* 2022.09.05
* by Alub
*/
import Foundation

var N = Int(readLine()!)! / 100 * 100
let F = Int(readLine()!)!

while N % F != 0 {
    N += 1
}

N %= 100
print(N <= 9 ? "0\(N)" : N)