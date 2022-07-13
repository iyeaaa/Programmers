let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var A = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}

var queue = [N], index = 0, success = false
var visit = [Bool](repeating: false, count: N+1); visit[N] = true
while index < queue.count {
    let cur = queue[index]; index += 1
    if cur == 1 {
        success = true
        break
    }
    for i in stride(from: cur-1, through: 1, by: -1) {
        let power = (cur-i)*(1+abs(A[i]-A[cur]))
        if power <= K && !visit[i] {
            queue.append(i)
            visit[i] = true
        }
    }
}

print(success ? "YES" : "NO")
