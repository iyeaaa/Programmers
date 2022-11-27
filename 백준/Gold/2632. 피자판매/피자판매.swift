
let T = Int(readLine()!)!
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (m, n) = (input[0], input[1])
var a = [Int](), b = [Int]()
var pa = [0], pb = [0]
var ans = 0

for i in 0..<m { a.append(Int(readLine()!)!) }
for i in 0..<n { b.append(Int(readLine()!)!) }

for i in 0..<m {
    var temp = 0
    for j in i..<m+i-1 {
        temp += a[j%m]
        pa.append(temp)
    }
}
pa.append(a.reduce(0, +))

for i in 0..<n {
    var temp = 0
    for j in i..<n+i-1 {
        temp += b[j%n]
        pb.append(temp)
    }
}
pb.append(b.reduce(0, +))

pa.sort(); pb.sort()

for v in pa {
    ans += upper_bound(T-v) - lower_bound(T-v)
}

print(ans)

func upper_bound(_ key: Int) -> Int {
    var lf = -1, ryt = pb.count
    while lf + 1 < ryt {
        let mid = (lf + ryt) / 2
        if pb[mid] > key { ryt = mid }
        else { lf = mid }
    }
    return ryt
}

func lower_bound(_ key: Int) -> Int {
    var lf = -1, ryt = pb.count
    while lf + 1 < ryt {
        let mid = (lf + ryt) / 2
        if pb[mid] >= key { ryt = mid }
        else { lf = mid }
    }
    return ryt
}
