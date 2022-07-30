let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var graph: [[Int]] = crtGraph()

var time = 0
var preCheese = 0
while true {
    let willBeMelted = willBeMelted()
    if willBeMelted.count == 0 {
        break
    }
    preCheese = willBeMelted.count
    time += 1
    for cheese in willBeMelted {
        graph[cheese[0]][cheese[1]] = 0
    }
}
print(time)
print(preCheese)

func willBeMelted() -> Set<[Int]> {
    var isVisit = (0..<N).map{ _ in (0..<M).map{ _ in false } }
    var queue = [(0, 0)], idx = 0; isVisit[0][0] = true
    var willBeMelt = Set([[Int]]())
    while idx < queue.count {
        let (y, x) = queue[idx]; idx += 1
        for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
            if !((0..<N) ~= ny && (0..<M) ~= nx) { continue }
            if isVisit[ny][nx] { continue }
            if graph[ny][nx] == 1 { willBeMelt.insert([ny, nx]); continue }
            queue.append((ny, nx))
            isVisit[ny][nx] = true
        }
    }
    return willBeMelt
}

func crtGraph() -> [[Int]] {
    var result = [[Int]]()
    for _ in 0..<N {
        result.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    return result
}

