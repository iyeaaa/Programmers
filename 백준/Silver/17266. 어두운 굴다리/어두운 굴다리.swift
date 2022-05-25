let n = Int(readLine()!)!
let m = Int(readLine()!)!
let x = readLine()!.split{$0==" "}.map{Int(String($0))!}

func isAllLight(_ h: Int) -> Bool {
    if x[0] - h > 0 { return false }
    for i in stride(from: 2, to: x.count, by: 1) {
        if 2*h < x[i] - x[i-1] { return false }
    }
    if n - x.last! > h { return false }
    return true
}

var (start, end) = (0, n)
while start <= end {
    let mid = (start + end) / 2
    if isAllLight(mid) {
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(start)