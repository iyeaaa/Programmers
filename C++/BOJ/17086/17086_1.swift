/**
* 메모리: 69240 KB, 시간: 16 ms
* 2022.09.18
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var G = [[Int]]()
var shark = [(Int, Int)]()
var nothing = [(Int, Int)]()
var ans = Int.min

for i in 0..<N {
    G.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    for j in 0..<M {
        if G[i][j] == 0 {
            nothing.append((i, j))
        } else {
            shark.append((i, j))
        }
    }
}

for (y, x) in nothing {
    var dist = Int.max
    for (sy, sx) in shark {
        dist = min(dist, max(abs(sy-y), abs(sx-x)))
    }
    ans = max(ans, dist)
}

print(ans)