let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (k, n) = (input[0], input[1])
var ran = [Int]()

for _ in 0..<k {
    ran.append(Int(readLine()!)!)
}

print(binary_Search(list: ran, start: 1, end: ran.max()!, target: n))

func binary_Search(list: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end
    while start <= end {
        let mid = (start+end) / 2
        let mid_Sum = list.reduce(0) { $0 + ($1 / mid) }
        if target > mid_Sum {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return end
}