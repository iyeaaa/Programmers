
let pmt = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
let n = Int(readLine()!)!
var l = readLine()!.split{$0==" "}.map{Int(String($0))!}
var c = (0...3).map{_ in 0}; l.forEach{ c[$0] += 1 }
var ans = Int.max

for p in pmt {
    var arr = (0...3).map{_ in (0...3).map{_ in 0}}
    var sp = 0
    for i in 0..<3 {
        for j in 0..<c[p[i]] {
            arr[p[i]][l[sp+j]] += 1
        }
        sp += c[p[i]]
    }
    ans = min(ans, arr[1][2]+arr[1][3] + max(arr[2][3], arr[3][2]))
}

print(ans)