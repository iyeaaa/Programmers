
let n = Int(readLine()!)!
let inOrder = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var idx = [Int](repeating: 0, count: n+1)
let preOrder = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var ans = ""

for i in 1...n {
    idx[inOrder[i]] = i
}

f(n, 1, n)
print(ans)

func f(_ x: Int, _ s: Int, _ e: Int) {
    let rootIdx = idx[preOrder[x]]
    ans += "\(preOrder[x]) "
    let lo = rootIdx-s, hi = e-rootIdx
    if lo > 0 { f(x-hi-1, s, rootIdx-1) }
    if hi > 0 { f(x-1, rootIdx+1, e) }
}