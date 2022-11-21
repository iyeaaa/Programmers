
let n = Int(readLine()!)!
let a = readLine()!.split{$0==" "}.map{Int(String($0))!}
var s = Set<Int>()
var ans = 0

s.insert(a.first!*2)
for i in 0..<n {
    for j in 0..<i where s.contains(a[i] - a[j]) {
        ans += 1; break
    }
    for j in 0...i {
        s.insert(a[i] + a[j])
    }
}

print(ans)