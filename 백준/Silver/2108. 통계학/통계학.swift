import Foundation

var array = [Int]()
let n = Int(readLine()!)!
var count = [Int](repeating: 0, count: 8002)
var result = ""
var bin = 0
var binindex = 0

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

let sum = array.reduce(0){$0+$1}
array.sort()
var average = Int(round(Double(sum)/Double(n)))

for i in array {
    count[i+4000] += 1
}

bin = count.max()!

var j = 0
for i in 0...8001 {
    if bin == count[i] {
        if j == 1 {
            binindex = i - 4000
        }
        j += 1
    }
}

if j == 1 {
    binindex = count.index(of: bin)! - 4000
}

result += "\(average)\n"
result += "\(array[(n-1)/2])\n"
result += "\(binindex)\n"
result += "\(array[n-1]-array[0])"


print(result)
