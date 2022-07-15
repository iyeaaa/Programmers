import Foundation

let N  = Int(readLine()!)!
var data: [(Int, Int)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }

    data.append((input[0], 1))
    data.append((input[1], -1))
}

data.sort(by: <)

var sum = 0, answer = 0

for (_, type) in data {
    sum += type
    answer = max(answer, sum)
}

print(answer)