
let n = Int(readLine()!)!
let a = readLine()!.split{$0==" "}.map{Int(String($0))!}
var s = [a[0]]
var dp = [Int](repeating: 1, count: n)

for i in 1..<n {
    if s.last! < a[i] {
        s.append(a[i])
    }
    s[lower_bound(&s, a[i])] = a[i]
}

print(s.count)

func lower_bound(_ arr: inout [Int], _ key: Int) -> Int {
    var lf = 0, ryt = arr.count-1
    while lf < ryt {
        let mid = (lf + ryt) / 2
        if arr[mid] >= key { ryt = mid }
        else { lf = mid + 1 }
    }
    return ryt
}