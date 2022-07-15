let N = Int(readLine()!)!
let ropes = crtRopes()

var maxValue = 0
for i in 0..<N {
    maxValue = max(maxValue, ropes[i]*(i+1))
}
print(maxValue)


func crtRopes() -> [Int] {
    var result = [Int]()
    for _ in 0..<N {
        result.append(Int(readLine()!)!)
    }
    return result.sorted(by: >)
}