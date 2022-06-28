let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let seq = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()

var stack = [Int]()
var result = ""

bkTrk(0, 0);
print(result)

func bkTrk(_ digit: Int, _ next: Int) {
    if digit == m {
        result += stack.map{String($0)}.joined(separator: " ") + "\n"
        return
    }
    for i in next..<n {
        stack.append(seq[i])
        bkTrk(digit+1, i+1)
        stack.removeLast()
    }
}