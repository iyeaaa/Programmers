let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]]()
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]

for _ in 0..<n {
    graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

var preCheeseEA = cheeseEACount()

if cheeseEACount() == 0 {
    print(0)
} else {
    plusHour()
    var currentCheeseEA = cheeseEACount()
    var hour = 1
    while currentCheeseEA != 0 {
        preCheeseEA = currentCheeseEA
        plusHour()
        hour += 1
        currentCheeseEA = cheeseEACount()
    }
    print(hour)
    print(preCheeseEA)
}

func plusHour() {
    var newPreCheese = Set<[Int]>()
    var queue = [[0, 0]]
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    visit[0][0] = true
    var index = 0
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for d in direction {
            let (nx, ny) = (x+d[0], y+d[1])
            if !(0..<n).contains(nx) || !(0..<m).contains(ny) {
                continue
            }
            if visit[nx][ny] {
                continue
            }
            if graph[nx][ny] == 0 && !newPreCheese.contains([nx, ny]) {
                queue.append([nx, ny])
                visit[nx][ny] = true
            }
            if graph[nx][ny] == 1 {
                newPreCheese.insert([nx, ny])
                graph[nx][ny] = 0
            }
        }
        index += 1
    }
}

func cheeseEACount() -> Int {
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 1 {
                count += 1
            }
        }
    }
    return count
}
