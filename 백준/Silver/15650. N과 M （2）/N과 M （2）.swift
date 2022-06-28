let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var stack = [Int]()
var result = ""

func bkTrk(_ digit: Int, _ next: Int) {
    if digit >= m {
        result += stack.map{String($0)}.joined(separator: " ") + "\n"
        return
    }
    for i in stride(from: next+1, through: n, by: 1) {
        stack.append(i)
        bkTrk(digit+1, i)
        stack.removeLast()
    }
}

bkTrk(0, 0); print(result)