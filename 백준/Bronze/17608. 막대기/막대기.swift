let N = Int(readLine()!)!
var list = [Int](); for _ in 0..<N { list.append(Int(readLine()!)!) }
var hgt = list.last!
var count = 1

for i in stride(from: N-2, through: 0, by: -1) {
    if hgt < list[i] {
        hgt = list[i]
        count += 1
    }
}

print(count)