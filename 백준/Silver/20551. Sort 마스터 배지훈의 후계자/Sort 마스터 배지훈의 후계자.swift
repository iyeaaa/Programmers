let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var a = [Int](); for _ in 0..<n { a.append(Int(readLine()!)!) }
var b = a.sorted()

var result = ""
for _ in 0..<m {
    result.append("\(bs(Int(readLine()!)!))\n")
}
print(result)

func bs(_ target: Int) -> Int {
    var (start, end) = (0, n-1)
    while start <= end {
        let mid = (start + end) / 2
        if target <= b[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return start < n && b[start] == target ? start : -1
}