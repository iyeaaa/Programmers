let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (r, c, n) = (input[0], input[1], input[2])
var graph = [[Int]](repeating: [], count: r)
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]
var bomb = [[Int]]()
var result = ""

for i in 0..<r {
    graph[i] = readLine()!.map{(Int($0.asciiValue!)-46) % 32}
}

if n % 2 == 0 {
    for _ in 0..<r {
        result += String(repeating: "O", count: c)
        result += "\n"
    }
    print(result)
} else {
    findBomb()
    for _ in stride(from: 1, to: n, by: 2) {
        installBomb()
        for b in bomb {
            graph[b[0]][b[1]] = 0
            for d in direction {
                let (nx, ny) = (b[0]+d[0], b[1]+d[1])
                if (0..<r).contains(nx) && (0..<c).contains(ny) {
                    graph[b[0]+d[0]][b[1]+d[1]] = 0
                }
            }
        }
        findBomb()
    }
    for i in 0..<r {
        for j in 0..<c {
            if graph[i][j] == 0 {
                result += "."
            } else {
                result += "O"
            }
        }
        result += "\n"
    }
    print(result)
}

func findBomb() {
    bomb = [[Int]]()
    for i in 0..<r {
        for j in 0..<c {
            if graph[i][j] == 1 {
                bomb.append([i, j])
            }
        }
    }
}

func installBomb() {
    for i in 0..<r {
        for j in 0..<c {
            graph[i][j] = 1
        }
    }
}

// 1 - 그대로, 2 - 다 설치, 3 - 폭파, 4 - 다 설치, 5 - 폭파