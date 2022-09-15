/**
* 메모리: 69108 KB, 시간: 28 ms
* 2022.09.15
* by Alub
*/
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var bad = [[Bool]](repeating: [Bool](repeating: false, count: N+1), count: N+1)
var ans = 0

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    bad[input[0]][input[1]] = true
    bad[input[1]][input[0]] = true
}

for i in stride(from: 1, through: N, by: 1) {
    for j in stride(from: i+1, through: N, by: 1) {
        for k in stride(from: j+1, through: N, by: 1) {
            if bad[i][j] || bad[j][k] || bad[k][i] { continue }
            ans += 1
        }
    }
}

print(ans)

