
var tree = [Int](repeating: 0, count: 2000005)
let n = Int(readLine()!)!
var a = readLine()!.split{$0==" "}.map{Int(String($0))!}.enumerated().map{($0.offset+1,$0.element)}.sorted{$0.1<$1.1}
var ans = 0

func update(_ x: Int, _ s: Int, _ e: Int, _ idx: Int) {
    if s == e { tree[x]=1; return }
    if idx <= (s+e)/2 { update(x*2, s, (s+e)/2, idx) }
    else { update(x*2+1, (s+e)/2+1, e, idx) }
    tree[x] = tree[x*2] + tree[x*2+1]
}

func sum(_ x: Int, _ s: Int, _ e: Int, _ lf: Int, _ ryt: Int) -> Int {
    if e < lf || ryt < s { return 0 }
    if lf <= s && e <= ryt { return tree[x] }
    return sum(x*2, s, (s+e)/2, lf, ryt) + sum(x*2+1, (s+e)/2+1, e, lf, ryt)
}

for (i, _) in a {
    ans += sum(1, 1, n, i+1, n)
    update(1, 1, n, i)
}

print(ans)