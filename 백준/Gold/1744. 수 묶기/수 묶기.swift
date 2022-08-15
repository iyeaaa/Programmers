let N = Int(readLine()!)!
var list = [Int](); for _ in 0..<N { list.append(Int(readLine()!)!) }
list.sort(by: >)
var check = [Bool](repeating: false, count: N)

var sum = 0
for i in stride(from: 0, through: N-2, by: 2) {
    let first = list[i];
    let second = list[i+1];

    if first <= 1 || second <= 1 {
        break
    }

    check[i] = true; check[i+1] = true
    sum += first*second
}

for i in stride(from: N-1, through: 1, by: -2) {
    let first = list[i]
    let second = list[i-1]

    if first > 0 || second > 0 {
        break
    }

    check[i] = true; check[i-1] = true
    sum += first*second
}

for i in 0..<N where !check[i] {
    sum += list[i]
}

print(sum)