let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (m, n) = (input[0], input[1])
let snack = readLine()!.split{$0==" "}.map{Int(String($0))!}

print(binary_Search())

func isPossible(_ n: Int) -> Bool {
    return m <= snack.reduce(0){ $0 + $1/n }
}

func binary_Search() -> Int {   // 내림차순!
    var (start, end) = (1, 1_000_000_000)
    while start <= end {
        let mid = (start + end) / 2
        if isPossible(mid) {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return end
}