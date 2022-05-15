let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]](repeating: [], count: n)
var visit = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var cont = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var notZero = [[Int]]()

makeGraph()
findNotZero()
var area_Ea = 1
var count = 0
while area_Ea < 2 {
    oneYearsLater()
    count += 1
    area_Ea = checkArea()
    if area_Ea == 0 {
        count = 0
        break
    }
}

print(count)

func findNotZero() {
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] != 0 {
                notZero.append([i, j])
            }
        }
    }
}


func makeGraph() {
    for i in 0..<n {
        graph[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
    }
}

func oneYearsLater() {
    cont = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    for i in notZero {
        if graph[i[0]][i[1]] != 0 {
            for k in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
                if graph[i[0]+k[0]][i[1]+k[1]] == 0 {
                    cont[i[0]][i[1]] += 1
                }
            }
        }
    }
    for i in notZero {
        graph[i[0]][i[1]] -= cont[i[0]][i[1]]
        if graph[i[0]][i[1]] < 0 {
            graph[i[0]][i[1]] = 0
        }
    }
}

func checkArea() -> Int {
    var count = 0
    visit = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    for i in notZero {
        if visit[i[0]][i[1]] == -1 && graph[i[0]][i[1]] != 0 {
            count += 1
            if count == 2 {
                return 2
            }
            bfs(i[0], i[1])
        }
    }
    return count
}

func bfs(_ i: Int, _ j: Int) {
    var index = 0
    var queue = [[i, j]]
    visit[i][j] = 1
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
            let (nx, ny) = (x+i[0], y+i[1])
            if (0..<n).contains(nx) && (0..<m).contains(ny)
                       && visit[nx][ny] == -1 && graph[nx][ny] != 0 {
                queue.append([nx, ny])
                visit[nx][ny] = 1
            }
        }
        index += 1
    }
}