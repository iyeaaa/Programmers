import Foundation

var dict = [String: Double]()
var sum = 0.0

while let input = readLine() {
    dict[input, default: 0] += 1
    sum += 1
}

var result = ""
for k in dict.keys.sorted() {
    result += k + " \(String(format: "%.4f", dict[k]!/sum*100))\n"
}
print(result)