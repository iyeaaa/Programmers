let N = Int(readLine()!)!
var LToH = [Int](repeating: 0, count: 1001)

var maxL = 0
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    LToH[input[0]] = input[1]
    if LToH[maxL] < input[1] {
        maxL = input[0]
    }
}

var lfStack = [maxL]
for i in stride(from: maxL-1, through: 0, by: -1) {
    if LToH[i] == 0 { continue }
    while !lfStack.isEmpty && LToH[lfStack.last!] < LToH[i] {
        lfStack.removeLast()
    }
    lfStack.append(i)
}

var rytStack = [maxL]
for i in stride(from: maxL+1, through: 1000, by: 1) {
    if LToH[i] == 0 { continue }
    while !rytStack.isEmpty && LToH[rytStack.last!] < LToH[i] {
        rytStack.removeLast()
    }
    rytStack.append(i)
}

var sum = LToH[maxL]
for i in 1..<lfStack.count {
    let pre = lfStack[i-1]
    let cur = lfStack[i]
    sum += (pre-cur)*LToH[cur]
}

for i in 1..<rytStack.count {
    let pre = rytStack[i-1]
    let cur = rytStack[i]
    sum += (cur-pre)*LToH[cur]
}

print(sum)