/**
* 메모리: 69108 KB, 시간: 8 ms
* 2022.10.06
* by Alub
*/
let INF = 9876534321
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var (N, D) = (input[0], input[1])
typealias shortcut = (s: Int, e: Int, d: Int)
var sc = [shortcut]()
var ans = D

for _ in 0..<N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if input[1] > D { N -= 1; continue }
    if input[1] - input[0] < input[2] { N -= 1; continue }
    sc.append((input[0], input[1], input[2]))
}

sc.sort{$0.s < $1.s}
C(0, [])
print(ans)

func calculate(_ L: [Int]) -> Int {
    if L.isEmpty { return INF }

    let first = sc[L[0]]
    var dist_sum = first.s + first.d
    var cur_local = first.e

    for i in 1..<L.count {
        let (s, e, d) = sc[L[i]]
        if cur_local > s { return INF }
        dist_sum += (s - cur_local) + d
        cur_local = e
    }

    return dist_sum + (D - cur_local)
}

func C(_ idx: Int, _ L: [Int]) {
    ans = min(ans, calculate(L))

    for i in stride(from: idx, to: N, by: 1) {
        C(i+1, L+[i])
    }
}