/**
* 메모리: 110268 KB, 시간: 88 ms
* 2022.10.19
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var G = [[Character]]()
var V = (0..<N).map{_ in (0..<M).map{_ in false}}
var memo = (0..<N).map{_ in (0..<M).map{_ in -1}}
var ans = 0

for _ in 0..<N {
    G.append(Array(readLine()!))
}

for i in 0..<N {
    for j in 0..<M where canEscape(i, j) {
        ans += 1
    }
}

print(ans)

func canEscape(_ y: Int, _ x: Int) -> Bool {
    if !isRange(y, x) {
        return true
    }
    if memo[y][x] != -1 {
        return memo[y][x] == 1
    }
    if V[y][x] {
        memo[y][x] = 0
        return false
    }
    V[y][x] = true

    var can = false

    switch G[y][x] {
    case "U": can = canEscape(y-1, x)
    case "R": can = canEscape(y, x+1)
    case "D": can = canEscape(y+1, x)
    default:  can = canEscape(y, x-1)
    }

    V[y][x] = false

    memo[y][x] = can ? 1 : 0
    return can
}

func isRange(_ y: Int, _ x: Int) -> Bool {
    (0..<N) ~= y && (0..<M) ~= x
}