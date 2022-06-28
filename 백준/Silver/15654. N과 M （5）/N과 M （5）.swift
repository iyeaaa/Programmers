let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var list = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var set = Set<Int>()
var stack = [Int]()
var result = ""

bkTrk(0)
print(result)

func bkTrk(_ digit: Int) {
    if digit == m {
        result += stack.map{String($0)}.joined(separator: " ") + "\n"
        return
    }
    for i in list {
        if !set.contains(i) {
            stack.append(i)
            set.insert(i)
            bkTrk(digit+1)
            stack.removeLast()
            set.remove(i)
        }
    }
}