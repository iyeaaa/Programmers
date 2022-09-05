/**
* 메모리: 79512 KB, 시간: 12 ms
* 2022.09.05
* by Alub
*/
import Foundation

var N = Array(readLine()!)
let C = N.count
let F = Int(readLine()!)!

for i in 0...9 {
    for j in 0...9 {
        N[C-2] = Character(String(i))
        N[C-1] = Character(String(j))

        if Int(String(N))! % F == 0 {
            print(String(N[C-2])+String(N[C-1]))
            exit(0)
        }
    }
}