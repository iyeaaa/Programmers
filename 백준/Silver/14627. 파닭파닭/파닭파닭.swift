let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var pa = [Int](); for _ in 0..<n { pa.append(Int(readLine()!)!) }

var (start, end) = (1, pa.max()!)
while start <= end {
    let mid = (start + end) / 2
    if isPossible(mid) {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(pa.reduce(0){$0 + $1} - end*m)

func isPossible(_ n: Int) -> Bool {
    pa.reduce(0){$0 + $1/n} >= m
}

