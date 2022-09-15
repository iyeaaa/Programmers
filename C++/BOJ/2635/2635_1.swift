/**
* 메모리: 69100 KB, 시간: 12 ms
* 2022.09.15
* by Alub
*/
let N = Int(readLine()!)!
var ans = [Int]()

for i in 1...N {
    var f = N
    var s = i
    var stack = [f, s]
    while f >= s {
        let t = f
        f = s
        s = t - s
        stack.append(s)
    }
    if stack.count > ans.count {
        ans = stack
    }
}

print(ans.count)
print(ans.map{String($0)}.joined(separator: " "))