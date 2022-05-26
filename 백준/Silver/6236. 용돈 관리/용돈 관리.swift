let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var use = [Int](); for _ in 0..<n { use.append(Int(readLine()!)!) }

print(bs())

func bs() -> Int {
    var (start, end) = (1, 1000000000)
    while start <= end {
        let mid = (start + end) / 2
        if isPossible(mid) {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return start
}

func isPossible(_ money: Int) -> Bool {
    var myMoney = money
    var count = 1
    for i in stride(from: 0, to: n, by: 1) {
        if money < use[i] { return false }
        if myMoney >= use[i] {
            myMoney -= use[i]
        } else {
            count += 1
            myMoney = money - use[i]
        }
        if count > m { return false }
    }
    return true
}