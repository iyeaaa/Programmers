_ = readLine()
let money = readLine()!.split{$0==" "}.map{Int(String($0))!}
let my_money = Int(readLine()!)!

print(binary_Search(list: money, start: 0, end: money.max()!, target: my_money))

func binary_Search(list: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end
    var result = 0
    while start <= end {
        let mid = (start+end) / 2
        let mid_sum = list.reduce(0) { $0 + (($1 > mid) ? mid : $1) }
        if target < mid_sum {
            end = mid - 1
        } else {
            start = mid + 1
            result = mid
        }
    }
    return result
}