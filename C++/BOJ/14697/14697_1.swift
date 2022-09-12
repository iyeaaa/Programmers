/**
* 메모리: 79512 KB, 시간: 16 ms
* 2022.09.12
* by Alub
*/
import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (A, B, C, N) = (input[0], input[1], input[2], input[3])

for a in stride(from: 0, through: N, by: A) {
    for b in stride(from: 0, through: N, by: B) {
        for c in stride(from: 0, through: N, by: C) {
            if a + b + c == N {
                print(1)
                exit(0)
            }
        }
    }
}

print(0)