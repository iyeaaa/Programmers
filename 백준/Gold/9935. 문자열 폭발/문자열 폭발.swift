let strn = Array(readLine()!).map{String($0)}
let bomb = readLine()!, bombCnt = bomb.count, bombLast = String(bomb.last!)
var stack = [String]()

for c in strn {
    stack.append(c)
    let stackCnt = stack.count
    if stack.last! != bombLast { continue }
    if stackCnt >= bombCnt && stack[(stackCnt-bombCnt)...].joined() == bomb {
        for _ in 0..<bombCnt {
            stack.removeLast()
        }
    }
}

print(stack.isEmpty ? "FRULA" : stack.joined())