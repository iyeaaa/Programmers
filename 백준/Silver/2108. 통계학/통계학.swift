import Foundation

var array = [Int]()
var dict = [Int:Int]()
let n = Int(readLine()!)!
var result = ""
var sum = 0

for _ in 0..<n {
    let num = Int(readLine()!)!
    array.append(num)
    sum += num
    dict[num, default: 0] += 1
}

array = array.sorted()
var maxValue = dict.max(by: {$0.value < $1.value})!.value
var mode = dict.filter({$0.value == maxValue}).keys.sorted()

// 산술평균
result += "\(Int(round(Double(sum)/Double(n))))\n"
// 중앙값
result += "\(array[n/2])\n"
// 최빈값
result += mode.count == 1 ? "\(mode[0])\n" : "\(mode[1])\n"
// 범위
result += "\(array[n-1] - array[0])"

print(result)
