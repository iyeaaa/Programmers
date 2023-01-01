
func calcul(_ a: Int, _ oper: Character, _ b: Character) -> Int {
    let b = Int(String(b))!
    switch oper {
    case "+": return a + b
    case "-" : return a - b
    default: return a * b
    }
}

func f(_ y: Int, _ x: Int, _ sum: Int, _ oper: Character) {
    if y >= N || x >= N { return }
    if y == N-1 && x == N-1 {
        let rtn = calcul(sum, oper, g[y][x])
        mn = min(mn, rtn)
        mx = max(mx, rtn)
        return
    }
    if g[y][x].isNumber {
        let rtn = calcul(sum, oper, g[y][x])
        f(y+1, x, rtn, "!")
        f(y, x+1, rtn, "!")
    } else {
        f(y+1, x, sum, g[y][x])
        f(y, x+1, sum, g[y][x])
    }
}

let N = Int(readLine()!)!
var g = [[Character]]()
var mn = Int.max, mx = Int.min

for _ in 0..<N {
    g.append(readLine()!.split{$0==" "}.map{Character(String($0))})
}

f(1, 0, Int(String(g[0][0]))!, g[1][0])
f(0, 1, Int(String(g[0][0]))!, g[0][1])
print(mx, mn, separator: " ")