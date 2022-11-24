
func upper_bound(_ arr: inout [Int], _ key: Int) -> Int {
    var lf = 0, ryt = arr.count
    while lf < ryt {
        let mid = (lf + ryt) / 2
        if arr[mid] > key { ryt = mid }
        else { lf = mid+1 }
    }
    return ryt
}

func lower_bound(_ arr: inout [Int], _ key: Int) -> Int {
    var lf = 0, ryt = arr.count
    while lf < ryt {
        let mid = (lf + ryt) / 2
        if arr[mid] >= key { ryt = mid }
        else { lf = mid+1 }
    }
    return ryt
}

let t = Int(readLine()!)!
let n = Int(readLine()!)!
let a = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = Int(readLine()!)!
let b = readLine()!.split{$0==" "}.map{Int(String($0))!}
var deputyA = [Int](), deputyB = [Int]()
var ans = 0

for i in 0..<n {
    var temp = 0
    for j in i..<n {
        deputyA.append(temp + a[j])
        temp += a[j]
    }
}

for i in 0..<m {
    var temp = 0
    for j in i..<m {
        deputyB.append(temp + b[j])
        temp += b[j]
    }
}

deputyB.sort()

for value in deputyA {
    ans += upper_bound(&deputyB, t-value) - lower_bound(&deputyB, t-value)
}

print(ans)