let n = Int(readLine()!)!
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var stack = [0]
var dict = [0: 0];

for i in 1..<n {
    while !stack.isEmpty && list[stack.last!] < list[i] {
        let _ = stack.removeLast()
    }
    if !stack.isEmpty {
        dict[i] = stack.last!+1
    } else {
        dict[i] = 0
    }
    stack.append(i)
}

var result = ""
for i in 0..<n {
    if let d = dict[i] {
        result += "\(d) "
    } else {
        result += "0 "
    }
}
print(result)