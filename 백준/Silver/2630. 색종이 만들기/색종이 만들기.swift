let n = Int(readLine()!)!
var paper = [[Int]]()
for _ in 0..<n {
    paper.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

let (W, B) = (0, 1)
var (white, blue) = (0, 0)

func recusion(_ y: Int, _ x: Int, _ N: Int) {
    func isOne(_ y: Int, _ x: Int, _ N: Int) -> Bool {
        let color = paper[y][x]
        for i in 0..<N {
            for j in 0..<N {
                if paper[y+i][x+j] != color {
                    return false
                }
            }
        }
        return true
    }

    if N == 1 || isOne(y, x, N) {
        if paper[y][x] == W { white += 1 }
        else { blue += 1 }
        return
    }
    recusion(y, x, N/2)
    recusion(y, x + N/2, N/2)
    recusion(y + N/2, x, N/2)
    recusion(y + N/2, x + N/2, N/2)
}

recusion(0, 0, n)
print(white, blue, separator: "\n")