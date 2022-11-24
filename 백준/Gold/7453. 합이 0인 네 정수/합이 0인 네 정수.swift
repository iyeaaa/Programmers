

let n = Int(readLine()!)!
var A = [Int](), B = [Int](), C = [Int](), D = [Int]()
var AplusB = [Int](), CplusD = [Int]()
var ans = 0

for _ in 0..<n {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    A.append(input[0]); B.append(input[1])
    C.append(input[2]); D.append(input[3])
}

for i in 0..<n {
    for j in 0..<n {
        AplusB.append(A[i] + B[j])
        CplusD.append(C[i] + D[j])
    }
}

AplusB.sort()
CplusD.sort()

for ab in AplusB {
    let key = -ab
    ans += upper_bound(key) - lower_bound(key)
}

print(ans)

func upper_bound(_ key: Int) -> Int {
    var (lf, ryt) = (0, CplusD.count)
    while lf < ryt {
        let mid = (lf + ryt) / 2
        if CplusD[mid] > key { ryt = mid }
        else { lf = mid+1 }
    }
    return ryt
}

func lower_bound(_ key: Int) -> Int {
    var (lf, ryt) = (0, CplusD.count)
    while lf < ryt {
        let mid = (lf + ryt) / 2
        if CplusD[mid] >= key { ryt = mid }
        else { lf = mid+1 }
    }
    return ryt
}