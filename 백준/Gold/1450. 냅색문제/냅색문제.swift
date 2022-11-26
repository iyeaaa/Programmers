
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, C) = (input[0], input[1]), HALF = N/2
let o = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var l1 = [Int](), l2 = [Int]()
var ans = 0

C(1, 0, HALF, &l1); l1.sort()
C(HALF+1, 0, N, &l2); l2.sort()

for v in l1 where v <= C {
    ans += upper_bound(C-v)
}

print(ans)

func upper_bound(_ key: Int) -> Int {
    var lf = 0, ryt = l2.count
    while lf < ryt {
        let mid = (lf + ryt) / 2
        if l2[mid] > key { ryt = mid }
        else { lf = mid + 1 }
    }
    return ryt
}

func C(_ idx: Int, _ sum: Int, _ last: Int, _ list: inout [Int]) {
    if idx == last+1 { list.append(sum); return }
    C(idx+1, sum, last, &list)
    C(idx+1, sum+o[idx], last, &list)
}