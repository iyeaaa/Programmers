
var ans = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let preorder = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let inorder = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var idx = [Int](repeating: 0, count: n+1)
    var rtn = ""

    for i in 0..<n { idx[inorder[i]] = i }

    func f(_ x: Int, _ s: Int, _ e: Int) {
        let rootIdx = idx[preorder[x]]
        let lo = rootIdx-s, hi = e-rootIdx
        if lo > 0 { f(x+1, s, rootIdx-1) }
        if hi > 0 { f(x+lo+1, rootIdx+1, e) }
        rtn += "\(preorder[x]) "
    }

    f(0, 0, n-1)
    ans += rtn + "\n"
}
print(ans)