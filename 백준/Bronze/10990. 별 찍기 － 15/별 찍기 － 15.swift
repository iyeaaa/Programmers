let n = Int(readLine()!)!
let firstspace = String(repeating: " ", count: n-1)
var result = firstspace + "*" + "\n"

for i in stride(from: n-2, through: 0, by: -1) {
    let space1 = String(repeating: " ", count: i)
    let space2 = String(repeating: " ", count: (n-i-1)*2-1)
    result += space1 + "*" + space2 + "*" + "\n"
}

print(result)