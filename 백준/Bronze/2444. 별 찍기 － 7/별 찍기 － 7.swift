let n = Int(readLine()!)!
var result = ""

for i in stride(from: 1, through: n, by: 1) {
    let star = String(repeating: "*", count: i*2-1)
    let space = String(repeating: " ", count: n-i)
    result += space + star + "\n"
}

for i in stride(from: n-1, through: 1, by: -1) {
    let star = String(repeating: "*", count: i*2-1)
    let space = String(repeating: " ", count: n-i)
    result += space + star + "\n"
}

print(result)