/**
* 메모리: 69096 KB, 시간: 8 ms
* 2022.09.21
* by Alub
*/
let strn = Array(readLine()!).map{String($0)}
let find = strn.first == "0" && strn.last == "0" ? "1" : "0"
var count = 0
var isConnect = false
for c in strn {
    if c != find { isConnect = false; continue }
    if !isConnect {
        count += 1
        isConnect = true
    }
}
print(count)