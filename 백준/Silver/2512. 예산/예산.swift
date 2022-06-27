func solve() {
    func isPsb(_ mny: Int) -> Bool { bdg.reduce(0){$0 + ($1 >= mny ? mny : $1)} <= max }

    let _ = Int(readLine()!)!
    let bdg = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let max = Int(readLine()!)!
    var (lf, ryt) = (0, bdg.max()!)
    while lf <= ryt {
        let mid = (lf + ryt) / 2
        if isPsb(mid) {
            lf = mid + 1
        } else {
            ryt = mid - 1
        }
    }
    print(ryt)
}

solve()