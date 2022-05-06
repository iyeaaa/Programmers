let n = Int(readLine()!)!
var result = ""
for i in stride(from: n, through: 1, by: -1) {
    let space = String(repeating: " ", count: n-i)
    let star = String(repeating: "*", count: i)
    result += space + star + "\n"
}
print(result)