/**
* 메모리: 69508 KB, 시간: 24 ms
* 2022.09.07
* by Alub
*/
var G = [[Int]]()
var s = Set<String>();
for _ in 0..<5 {
    G.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 0..<5 {
    for j in 0..<5 {
        move(i, j, "", 0)
    }
}

print(s.count)

func move(_ y: Int, _ x: Int, _ cur: String, _ digit: Int) {
    if (digit == 6) {
        s.insert(cur)
        return
    }

    for (ny, nx) in [(y-1,x),(y+1,x),(y,x-1),(y,x+1)] {
        if !((0..<5) ~= ny && (0..<5) ~= nx) { continue }
        move(ny, nx, cur+"\(G[ny][nx])", digit+1)
    }
}