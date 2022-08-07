let T = Int(readLine()!)!

var result = ""
for _ in 0..<T {
    result += "\(solve())\n"
}
print(result)

func solve() -> String {
    let strn = Array(readLine()!).map{String($0)}
    var lfStk = [String](), rytStk = [String]()

    for c in strn {
        switch c {
        case "<":
            if !lfStk.isEmpty {
                rytStk.append(lfStk.popLast()!)
            }
        case ">":
            if !rytStk.isEmpty {
                lfStk.append(rytStk.popLast()!)
            }
        case "-":
            if !lfStk.isEmpty {
                lfStk.removeLast()
            }
        default:
            lfStk.append(c)
        }
    }

    return (lfStk + rytStk.reversed()).joined()
}