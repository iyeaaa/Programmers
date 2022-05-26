let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var color = [Int](); for _ in 0..<m { color.append(Int(readLine()!)!) }

print(binary_Search())

func binary_Search() -> Int {
    var (start, end) = (1, color.max()!)
    while start <= end {
        let mid = (start + end) >> 1
        let sum = color.reduce(0) { $0 + ($1 % mid == 0 ? $1/mid : $1/mid + 1) }
        if n >= sum {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return start
}