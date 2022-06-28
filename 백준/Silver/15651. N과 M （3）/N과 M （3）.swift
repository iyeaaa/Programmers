let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var result = ""
var stack = [Int]()

bkTrk(0)
print(result)

func bkTrk(_ digit: Int) {
    if digit == m {
        result += stack.map{String($0)}.joined(separator: " ") + "\n"
        return
    }
    for i in 1...n {
        stack.append(i)
        bkTrk(digit+1)
        stack.removeLast()
    }
}
