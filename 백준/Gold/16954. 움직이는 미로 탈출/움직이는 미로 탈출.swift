var graph = (0...8).map{ _ in (0..<8).map{ _ in (0..<8).map{ _ in Character(".") } } }
for i in 0..<8 {
    let input = Array(readLine()!)
    for j in 0..<8 {
        graph[0][i][j] = input[j]
    }
}
for i in 1...8 {
    for j in stride(from: 6, through: 0, by: -1) {
        graph[i][j+1] = graph[i-1][j]
    }
}


var isVisit = (0..<8).map{ _ in (0..<8).map{ _ in 8 } }
var queue = [(7, 0, 0)], idx = 0; isVisit[7][0] -= 1
var result = 0

while idx < queue.count {
    let (y, x, s) = queue[idx]; idx += 1
    if y == 0 && x == 7 { result = 1; break }
    for (ny, nx) in [(y,x),(y+1,x),(y-1,x),(y,x+1),(y,x-1),(y+1,x+1),(y-1,x+1),(y+1,x-1),(y-1,x-1)] {
        if !((0..<8) ~= ny && (0..<8) ~= nx) { continue }
        if isVisit[ny][nx] <= 0 { continue }
        if graph[s][ny][nx] == "#" || graph[s > 7 ? 8 : s+1][ny][nx] == "#" { continue }
        queue.append((ny, nx, s > 7 ? 8 : s+1))
        isVisit[ny][nx] -= 1
    }
}
print(result)