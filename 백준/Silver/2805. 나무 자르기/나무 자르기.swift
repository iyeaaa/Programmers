func isPsb(_ h: Int) -> Bool { tree.map{$0 >= h ? $0-h : 0}.reduce(0, +) >= m }

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let tree = readLine()!.split{$0==" "}.map{Int(String($0))!}

var (lf, ryt) = (0, tree.max()!)
while lf <= ryt {
    let mid = (lf + ryt) / 2
    if isPsb(mid) {
        lf = mid + 1
    } else {
        ryt = mid - 1
    }
}
print(ryt)
