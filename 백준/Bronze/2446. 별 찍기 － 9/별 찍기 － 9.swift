let n = Int(readLine()!)!
var result = ""

for i in stride(from: n, through: 2, by: -1) {
    let space = String(repeating: " ", count: n-i)
    let star = String(repeating: "*", count: 2*i-1)
    result += space
    result += star
    result += "\n"
}

for i in 0..<n {
    let space = String(repeating: " ", count: n-i-1)
    let star = String(repeating: "*", count: i*2+1)
    result += space
    result += star
    result += "\n"
}

print(result)