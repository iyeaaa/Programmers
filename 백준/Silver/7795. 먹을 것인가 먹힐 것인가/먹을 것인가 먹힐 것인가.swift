let CASE = Int(readLine()!)!

for _ in 0..<CASE {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m) = (input[0], input[1])
    let a = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let b = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()

    var count = 0
    for i in a {
        count += bs(i)
    }
    print(count)

    func bs(_ t: Int) -> Int {
        var (start, end) = (0, m-1)
        while start <= end {
            let mid = (start + end) / 2
            if t <= b[mid] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return start
    }
}