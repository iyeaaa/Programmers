/**
* 메모리: 69100 KB, 시간: 12 ms
* 2022.10.06
* by Alub
*/
func f(_ y: Int, _ x: Int, _ idx: Int) -> Int {
    if idx == M {
        return 1
    }

    if memo[y][x][idx] != -1 {
        return memo[y][x][idx]
    }

    var save = 0

    for i in stride(from: x+1, through: N-1, by: 1) {
        if B[1-y][i] == S[idx] {
            save += f(1-y, i, idx+1)
        }
    }

    memo[y][x][idx] = save
    return save
}

let S = Array(readLine()!), M = S.count
var B = [[Character]]();
B.append(Array(readLine()!)); B.append(Array(readLine()!));
let N = B[0].count
var memo = Array(repeating: Array(repeating: [Int](repeating: -1
        , count: M), count: N), count: 2)
var ans = 0

for i in 0..<N {
    if B[0][i] == S[0] { ans += f(0, i, 1) }
    if B[1][i] == S[0] { ans += f(1, i, 1) }
}

print(ans)