/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.09.24
* by Alub
*/
let N = Int(readLine()!)!
var B = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = 0

while true {
    var allZero = true
    for i in 0..<N {
        if B[i] == 0 { continue }
        else if B[i] % 2 == 0 { allZero = false }
        else {
            cnt += 1
            B[i] -= 1
            if B[i] != 0 { allZero = false }
        }
    }
    if allZero {
        print(cnt)
        break
    } else {
        B = B.map{$0/2}
        cnt += 1
    }
}