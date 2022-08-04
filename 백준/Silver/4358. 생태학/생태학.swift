import Foundation

var nameToCnt = [String: Double]()
var sum: Double = 0
while let name = readLine() {
    nameToCnt[name, default: 0] += 1
    sum += 1
}

var result = ""
for (name, count) in nameToCnt.sorted(by: {$0.key < $1.key}) {
    result += name + " \(String(format: "%.4f", count*100/sum))\n"
}
print(result)