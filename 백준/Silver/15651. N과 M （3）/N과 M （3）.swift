let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var result = ""
var stack = [Int]()

recusion(0)
print(result)

func recusion(_ num: Int) {
    if num == m {
        result += stack.map{String($0)}.joined(separator: " ")
        result += "\n"
    } else {
        for i in 1...n {
            stack.append(i)
            recusion(num+1)
            stack.popLast()
        }
    }
}