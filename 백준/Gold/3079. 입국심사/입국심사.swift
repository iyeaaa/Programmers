func solve() {
    func isPsb(ckT: Int) -> Bool { T.reduce(0){$0 + (ckT/$1)} >= m }

    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m) = (input[0], input[1])
    var T = [Int](); for _ in 0..<n { T.append(Int(readLine()!)!) }; T.sort()

    var (lf, ryt) = (0, T[n-1]*m)
    while lf <= ryt {
        let mid = (lf + ryt) / 2
        if isPsb(ckT: mid) {
            ryt = mid - 1
        } else {
            lf = mid + 1
        }
    }
    print(lf)
}

solve()