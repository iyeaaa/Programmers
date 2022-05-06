var result = ""
for i in stride(from: Int(readLine()!)!, through: 1, by: -1) {
    var star = String(repeating: "*", count: i)
    result += star + "\n"
}
print(result)