let n = Int(readLine()!)!
var rope: [Int] = []

for _ in 0..<n {
    rope.append(Int(readLine()!)!)
}

rope.sort(by: < )

var max = rope[n-1]

if n != 1 {
    for i in 2...n {
        let temp = i * rope[n-i]
        if max < temp {
            max = temp
        }
    }
}
print(max)
