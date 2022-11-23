
// T.C: O((50+2500)*50) < 1e8

let n = Int(readLine()!)!
var g = [[Int]](repeating: [], count: n+1)
var score = [Int](repeating: 99999, count: n+1)

for _ in 0... {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if input == [-1, -1] { break }
    g[input[0]].append(input[1])
    g[input[1]].append(input[0])
}

for i in 1...n { score[i] = f(i) }
var Iscore = score.enumerated()
var ans = Iscore.filter{$0.element == score.min()!}
print(ans.first!.element, ans.count, separator: " ")
print(ans.map{String($0.offset)}.joined(separator: " "))

func f(_ x: Int) -> Int {
    var v = [Int](repeating: 99999, count: n+1)
    var q = [x], idx = 0; v[x] = 0
    while idx < q.count {
        let cur = q[idx]; idx += 1
        for next in g[cur] where v[next] == 99999 {
            v[next] = v[cur] + 1
            q.append(next)
        }
    }
    return v[q.last!]
}