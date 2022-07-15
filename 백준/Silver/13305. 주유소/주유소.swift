let N = Int(readLine()!)!
let rodes = readLine()!.split{$0==" "}.map{Int(String($0))!}
let price = readLine()!.split{$0==" "}.map{Int(String($0))!}

var cost = 0
var cur = 0
f: while cur < N-1 {
    for j in stride(from: cur+1, through: N-1, by: 1) {
        cost += price[cur]*rodes[j-1]
        if price[cur] >= price[j] { cur = j; continue f }
    }
    break
}
print(cost)