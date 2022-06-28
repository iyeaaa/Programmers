func solve() {
    func isPsb(d: Int) -> Bool {
        var next = x[0] + d
        var count = 0
        for i in 1..<n {
            if next <= x[i] {
                next = x[i] + d
                count += 1
            }
            if count == c-1 {
                return true
            }
        }
        return false
    }

    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, c) = (input[0], input[1])
    var x = [Int](); for _ in 0..<n { x.append(Int(readLine()!)!) }; x.sort()

    var (lf, ryt) = (0, x[n-1]-x[0])
    while lf <= ryt {
        let mid = (lf + ryt) / 2
        if isPsb(d: mid) {
            lf = mid + 1
        } else {
            ryt = mid - 1
        }
    }
    print(ryt)
}

solve()
