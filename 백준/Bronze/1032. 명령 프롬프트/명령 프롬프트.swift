let n = Int(readLine()!)!
var result = Array(readLine()!)

for _ in 1..<n {
    let temp = Array(readLine()!)
    for i in 0..<temp.count {
        if result[i] != temp[i] {
            result[i] = "?"
        }
    }
}

print(result.map{String($0)}.joined())