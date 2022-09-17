/**
* 메모리: 69108 KB, 시간: 1584 ms
* 2022.09.17
* by Alub
*/
let N = Int(readLine()!)!
var S = [[0]]
var isLink = [Bool](repeating: false, count: N+1)
var ans = Int.max

for _ in 0..<N {
    S.append([0]+readLine()!.split(separator: " ").map{Int(String($0))!})
}

C(1)
print(ans)

func C(_ idx: Int) {
    var link = [Int](), start = [Int]()
    for i in 1...N {
        if isLink[i] { link.append(i) }
        else { start.append(i) }
    }

    var link_sum = 0, start_sum = 0
    for i in 0..<link.count {
        for j in stride(from: i+1, to: link.count, by: 1) {
            let (f, s) = (link[i], link[j])
            link_sum += S[f][s] + S[s][f]
        }
    }

    for i in 0..<start.count {
        for j in stride(from: i+1, to: start.count, by: 1) {
            let (f, s) = (start[i], start[j])
            start_sum += S[f][s] + S[s][f]
        }
    }

    ans = min(ans, abs(link_sum-start_sum))

    for i in stride(from: idx, through: N, by: 1) {
        isLink[i] = true
        C(i+1)
        isLink[i] = false
    }
}