var result = 0
for _ in 0..<4 {
    var f = Array(readLine()!)
    for i in stride(from: 0, through: 7, by: 2) {
        if f[i] == "F" {
            result += 1
        }
    }
    f = Array(readLine()!)
    for i in stride(from: 1, through: 7, by: 2) {
        if f[i] == "F" {
            result += 1
        }
    }
}
print(result)