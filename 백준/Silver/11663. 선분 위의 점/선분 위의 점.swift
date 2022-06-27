var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let x = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var line = [(Int, Int)]()

var result = ""
for _ in 0..<m {
    input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    result += "\(bnryBelowSrch(input[1])-bnryOverSrch(input[0])+1)\n"
}
print(result)

func bnryOverSrch(_ strt: Int) -> Int {
    var (lf, ryt) = (0, x.count-1)
    while lf <= ryt {
        let mid = (lf + ryt) / 2
        if strt <= x[mid] {
            ryt = mid - 1
        } else {
            lf = mid + 1
        }
    }
    return lf
}
func bnryBelowSrch(_ end: Int) -> Int {
    var (lf, ryt) = (0, x.count-1)
    while lf <= ryt {
        let mid = (lf + ryt) / 2
        if x[mid] <= end {
            lf = mid + 1
        } else {
            ryt = mid - 1
        }
    }
    return ryt
}

