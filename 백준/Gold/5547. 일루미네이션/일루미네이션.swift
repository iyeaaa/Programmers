let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (W, H) = (input[0], input[1])
let graph: [[Int]] = crtGraph()
var isVisit = [[Bool]](repeating: [Bool](repeating: false, count: W+2), count: H+2)
var queue = [(0, 0)], idx = 0; isVisit[0][0] = true
let oddDirection = [(0,-1),(0,1),(-1,0),(-1,1),(1,0),(1,1)]
let evenDirection = [(0,-1),(0,1),(-1,-1),(-1,0),(1,-1),(1,0)]
var count = 0

while idx < queue.count {
    let (y, x) = queue[idx]; idx += 1
    for d in y % 2 == 0 ? evenDirection : oddDirection {
        let (ny, nx) = (y+d.0, x+d.1)
        if !((0...H+1) ~= ny && (0...W+1) ~= nx) { continue }
        if isVisit[ny][nx] { continue }
        if graph[ny][nx] == 1 { count += 1; continue }
        queue.append((ny, nx))
        isVisit[ny][nx] = true
    }
}

print(count)

func crtGraph() -> [[Int]] {
    var result = [[Int](repeating: 0, count: W+2)]
    for _ in 0..<H {
        result.append([0]+readLine()!.split(separator: " ").map{Int(String($0))!}+[0])
    }
    return result + [[Int](repeating: 0, count: W+2)]
}

