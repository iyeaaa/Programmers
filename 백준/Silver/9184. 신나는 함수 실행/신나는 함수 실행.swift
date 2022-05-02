import Foundation

var w = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 1, count: 51), count: 51), count: 51)
var result = ""
w[20][20][20] = 1048576

for a in 1...50 {
    for b in 1...50 {
        for c in 1...50 {
            if a > 20 || b > 20 || c > 20 {
                w[a][b][c] = w[20][20][20]
            } else if a < b && b < c {
                w[a][b][c] = w[a][b][c-1] + w[a][b-1][c-1] - w[a][b-1][c]
            } else {
                w[a][b][c] = w[a-1][b][c] + w[a-1][b-1][c] + w[a-1][b][c-1] - w[a-1][b-1][c-1]
            }
        }
    }
}

while true {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (a, b, c) = (input[0], input[1], input[2])
    if a == -1 && b == -1 && c == -1 {
        break
    } else if a <= 0 || b <= 0 || c <= 0 {
        result += "w(\(a), \(b), \(c)) = \(1)\n"
    } else {
        result += "w(\(a), \(b), \(c)) = \(w[a][b][c])\n"
    }
}

print(result)