let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
let MAX_NUM = 500000
var isVisit = [[Int]](repeating: [Int](repeating: -1, count: MAX_NUM+1), count: 2)

var queue: [(x: Int, cnt: Int)] = [(N, 0)], idx = 0
isVisit[0][N] = 0
while idx < queue.count {
    let cur = queue[idx]; idx += 1
    let flag = cur.cnt % 2
    for next in [cur.x-1, cur.x+1, cur.x*2] {
        if (0...MAX_NUM) ~= next, isVisit[1-flag][next] == -1 {
            isVisit[1-flag][next] = cur.cnt+1
            queue.append((next, cur.cnt+1))
        }
    }
}


var t = 0
var k = K
var flag = 0
var result = -1
while k <= 500000 {
    let cur = isVisit[flag][k]
    if cur != -1, cur <= t {
        result = t
        break
    }
    flag = 1 - flag
    t += 1
    k += t
}

print(result)