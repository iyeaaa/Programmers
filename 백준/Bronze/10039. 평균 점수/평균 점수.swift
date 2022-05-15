var array = [Int]()

for _ in 0..<5 {
    let temp = Int(readLine()!)!
    if temp < 40 {
        array.append(40)
    } else {
        array.append(temp)
    }
}

print(array.reduce(0, +)/5)