import Foundation

func findZero(_ array: [[Int]]) -> (Int, Int) {
    for i in 0..<3 {
        for j in 0..<3 {
            if array[i][j] == 0 {
                return (i, j)
            }
        }
    }
    return (0, 0)
}

let end = [[1, 2, 3], [4, 5, 6], [7, 8, 0]]
var isOvlp = Set<[[Int]]>()
var start = [[Int]]()

for _ in 0..<3 {
    start.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var queue = [(start, 0)], idx = 0
isOvlp.insert(start)

while idx < queue.count {
    let (cur, cnt) = queue[idx]; idx += 1
    let (y, x) = findZero(cur)
    if cur == end { print(cnt); exit(0) }
    for (ny, nx) in [(y+1,x),(y-1,x),(y,x-1),(y,x+1)] {
        guard (0..<3) ~= ny && (0..<3) ~= nx else { continue }
        var next = cur;
        (next[y][x], next[ny][nx]) = (next[ny][nx], next[y][x])
        if isOvlp.contains(next) { continue }
        queue.append((next, cnt+1))
        isOvlp.insert(next)
    }
}

print(-1)
