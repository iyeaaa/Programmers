let n = Int(readLine()!)!

for i in stride(from: 1, through: n, by: 1) {
    let star = String(repeating: "*", count: n)
    print(star)
}