let N = Int(readLine()!)!
var graph = [0]; for _ in 0..<N { graph.append(Int(readLine()!)!) }
var visit = Array(repeating: false, count: N+1)
var result = [Int]()

for i in 1...N {
    if !visit[i] {
        visit[i] = true
        if !isCicle(i, graph[i], [i]) {
            visit[i] = false
        }
    }
}
print(result.count)
print(result.sorted().map{String($0)}.joined(separator: "\n"))

func isCicle(_ start: Int, _ cur: Int, _ stack: [Int]) -> Bool {
    if start == cur {
        result += stack
        return true
    }
    if !visit[cur] {
        visit[cur] = true
        if !isCicle(start, graph[cur], stack+[cur]) {
            visit[cur] = false
        }
    }
    return false
}