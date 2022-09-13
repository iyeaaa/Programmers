/**
* 메모리: 69108 KB, 시간: 24 ms
* 2022.09.13
* by Alub
*/
let L = Int(readLine()!)!
let s = Set(readLine()!.split{$0==" "}.map{Int(String($0))!})
let n = Int(readLine()!)!
var ans = 0

for i in 1...1000 {
    for j in stride(from: i+1, through: 1000, by: 1) {
        if i > n { break }
        if s.contains(i) || s.contains(j) {
            break
        }
        if j < n { continue }
        ans += 1
    }
}

print(ans)