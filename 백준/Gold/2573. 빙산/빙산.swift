let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var graph: [[Int]] = crtGraph()
var ice = Set<[Int]>()

for i in 1..<N-1 {
    for j in 1..<M-1 {
        if graph[i][j] != 0 {
            ice.insert([i, j])
        }
    }
}
var year = 0
while !isSeperate {
    if ice.count == 0 {
        year = 0
        break
    }
    year += 1
    Melt()
}
print(year)


var isSeperate: Bool {
    func bfs(_ y: Int, _ x: Int) {
        var queue = [(y, x)], idx = 0; isVisit[y][x] = true
        while idx < queue.count {
            let (y, x) = queue[idx]; idx += 1
            for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
                if graph[ny][nx] == 0 { continue }
                if isVisit[ny][nx] { continue }
                queue.append((ny, nx))
                isVisit[ny][nx] = true
            }
        }
    }

    var isVisit = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var count = 0
    for i in ice {
        let (y, x) = (i[0], i[1])
        if !isVisit[y][x] {
            if count == 1 { return true }
            count += 1
            bfs(y, x)
        }
    }
    return false
}

func Melt() {
    var result = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    for i in ice {
        let (y, x) = (i[0], i[1])
        for (ny, nx) in [(y+1,x),(y-1,x),(y,x-1),(y,x+1)] {
            if graph[ny][nx] == 0 {
                result[y][x] += 1
            }
        }
    }
    for i in ice {
        let (y, x) = (i[0], i[1])
        graph[y][x] -= result[y][x]
        if graph[y][x] <= 0 {
            graph[y][x] = 0
            ice.remove([y, x])
        }
    }
}

func crtGraph() -> [[Int]] {
    var graph = [[Int]]()
    for _ in 0..<N {
        graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }
    return graph
}

