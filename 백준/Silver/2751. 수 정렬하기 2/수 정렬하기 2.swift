var array = [Int]()
let n = Int(readLine()!)!

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

array.sort()

for i in array {
    print(i)
}