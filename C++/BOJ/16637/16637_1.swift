/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.09.09
* by Alub
*/
extension Character {
    var toInt: Int { Int(String(self))! }
}

let N = Int(readLine()!)!
let S = Array(readLine()!)+[Character(" ")]
var B = [Bool](repeating: false, count: N+1)
var ans = Int.min

dfs(1, 0); dfs(3, 0)
print(ans)

func oper(_ lf: Int, _ c: Character, _ ryt: Int) -> Int {
    switch c {
    case "+": return lf+ryt
    case "-": return lf-ryt
    default: return lf*ryt
    }
}

func calculate() -> Int {
    var result = S[0].toInt
    var idx = 1
    while idx < N {
        if S[idx].isNumber {
            result = oper(result, S[idx-1], S[idx].toInt)
            idx += 1
        } else if B[idx] {
            let ryt = oper(S[idx+1].toInt, S[idx+2], S[idx+3].toInt)
            result = oper(result, S[idx], ryt)
            idx += 4
        } else {
            idx += 1
        }
    }
    return result
}

func dfs(_ idx: Int, _ cnt: Int) {
    ans = max(calculate(), ans)

    for i in stride(from: idx, to: N-2, by: 2) {
        B[i] = true
        dfs(i+4, cnt+1)
        B[i] = false
    }
}