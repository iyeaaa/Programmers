for _ in 0..<Int(readLine()!)! {
    let bridge = Int(readLine()!)!

    var (start, end) = (1, bridge)
    while start <= end {
        let mid = (start + end) / 2
        if isPossible(Double(mid)) {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    print(end)

    func isPossible(_ n: Double) -> Bool {
        n * (n + 1) / Double(2) <= Double(bridge)
    }
}
