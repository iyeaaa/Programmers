/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.09.14
* by Alub
*/
let N = Int(readLine()!)!
var F = [[Bool]]()

for _ in 0..<N {
    F.append(Array(readLine()!).map{$0=="Y"})
}

var ans = Int.min
for i in 0..<N {
    var Fcnt = 0
    for j in 0..<N where i != j {
        if F[i][j] {
            Fcnt += 1
        } else {
            for k in 0..<N where F[i][k] {
                if F[k][j] {
                    Fcnt += 1
                    break
                }
            }
        }
    }
    ans = max(ans, Fcnt)
}

print(ans)
