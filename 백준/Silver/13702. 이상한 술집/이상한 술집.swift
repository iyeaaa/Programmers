let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var sul = [Int](); for _ in 0..<n { sul.append(Int(readLine()!)!) }

func isPossible(_ n: Int) -> Bool {
    return k <= sul.reduce(0) {$0 + ($1/n)}
}

var (start, end) = (1, Int.max-1)
while start <= end {    // 내림차순
    let mid = (start + end) / 2
    if isPossible(mid) {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)