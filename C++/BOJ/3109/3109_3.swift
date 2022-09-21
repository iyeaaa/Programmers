/**
* 메모리: 153232 KB, 시간: 604 ms
* 2022.09.21
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (R, C) = (input[0], input[1])
var V = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
var G = [[Character]]()
var ans = 0

for _ in 0..<R {
    G.append(Array(readLine()!))
}

func isReach(_ y: Int, _ x: Int) -> Bool {
    guard (0..<R) ~= y && (0..<C) ~= x else {
        return false
    }
    if G[y][x] == "x" {
        return false
    }
    if V[y][x] {
        return false
    }

    V[y][x] = true
    if x == C-1 {
        return true
    }

    for ny in [y-1, y, y+1] where isReach(ny, x+1) {
        return true
    }

    return false
}

for i in 0..<R where isReach(i, 0) {
    ans += 1
}

print(ans)