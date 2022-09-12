/**
* 메모리: 69100 KB, 시간: 12 ms
* 2022.09.12
* by Alub
*/
while let n = readLine() {
    let n = Int(n)!
    var one = 1
    var cnt = 1
    while one % n != 0 {
        one = (one*10 + 1) % n
        cnt += 1
    }
    print(cnt)
}