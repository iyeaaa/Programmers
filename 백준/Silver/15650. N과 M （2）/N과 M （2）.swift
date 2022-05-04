let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var result = ""
var stack = [Int]()
var visited = [Bool](repeating: false, count: n+1)

recusion(0, 0)
print(result)

func recusion(_ num: Int, _ crt: Int) {
    if num == m {
        result += stack.map{String($0)}.joined(separator: " ")
        result += "\n"
    } else {
        for i in stride(from: crt+1, through: n, by: 1) {
            stack.append(i)
            recusion(num+1, i)
            stack.popLast()
        }
    }
}