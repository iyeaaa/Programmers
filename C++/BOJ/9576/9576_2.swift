/**
* 메모리: 77136 KB, 시간: 184 ms
* 2022.09.22
* by Alub
*/
let T = Int(readLine()!)!
var ans = ""

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (N, M) = (input[0], input[1])
    var L = [[Int]](repeating: [], count: N+1)
    var R = [Int](repeating: 0, count: M+1)
    var V = [Bool](repeating: false, count: M+1)
    var cnt = 0

    for i in 1...M {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (a, b) = (input[0], input[1])
        R[i] = b
        for j in a...b { L[j].append(i) }
    }

    for i in 1...N where !L[i].isEmpty {
        L[i].sort{R[$0] < R[$1]}
        for v in L[i] where !V[v] {
            cnt += 1
            V[v] = true
            break
        }
    }

    ans += "\(cnt)\n"
}

print(ans)