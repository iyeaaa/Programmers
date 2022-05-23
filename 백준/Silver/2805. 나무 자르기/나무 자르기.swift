import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let tree = readLine()!.split{$0==" "}.map{Int(String($0))!}

print(binary_Search(list: tree, start: 0, end: tree.max()!, target: m))

func binary_Search(list: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end
    var result = 0
    while start <= end {
        let mid = (start + end) / 2
        let sum = tree.map{ $0 > mid ? $0 - mid : 0 }.reduce(0, +)
        if target > sum {
            end = mid - 1
        } else {
            start = mid + 1
            result = mid
        }
    }
    return result
}