var d = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 21), count: 21), count: 21)
var result = ""

while let input = readLine() {
    if input == "-1 -1 -1" { break }
    let abc = input.split(separator: " ").map { Int(String($0))! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    result += "w(\(a), \(b), \(c)) = \(w(a, b, c))\n"
}

print(result)

func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    } else if a > 20 || b > 20 || c > 20 {
        return w(20, 20, 20)
    } else if d[a][b][c] != -1 {
        return d[a][b][c]
    } else if a < b && b < c {
        d[a][b][c] = w(a, b, c - 1) + w(a, b - 1, c - 1) - w(a, b - 1, c)
        return d[a][b][c]
    } else {
        d[a][b][c] = w(a - 1, b, c) + w(a - 1, b - 1, c) + w(a - 1, b, c - 1) - w(a - 1, b - 1, c - 1)
        return d[a][b][c]
    }
}