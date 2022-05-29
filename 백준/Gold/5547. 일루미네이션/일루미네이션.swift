var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (w, h) = (input[0], input[1])
var graph = [[Int]]()
var visit = [[Int]](repeating: [Int](repeating: -1, count: w), count: h)
let odd_direction = [[-1, 0], [-1, 1], [0, -1], [0, 1], [1, 0], [1, 1]]
let even_direction = [[-1, -1], [-1, 0], [0, -1], [0, 1], [1, -1], [1, 0]]
var round_place = [[Int]]()
var sumCloseDistance = 0
var roundPlaceDistance = 0
var buildingDistance = 0
var result = 0

for _ in 0..<h {
    graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

findClose()
roundPlaceDistanceCounter()
roundremainderCounter()
buildingDistance += (roundPlaceDistance - sumCloseDistance)

print(buildingDistance)

func roundremainderCounter() {
    for i in 0..<h {
        for j in 0..<w {
            if graph[i][j] == 1 && visit[i][j] == -1 {
                buildingDistance += roundCounter(i, j)
            }
        }
    }
}

func roundPlaceDistanceCounter() {
    for r in round_place {
        if visit[r[0]][r[1]] == -1 {
            roundPlaceDistance += roundCounter(r[0], r[1])
        }
    }
}

func findClose() {
    for i in 0..<h {
        for j in 0..<w {
            if graph[i][j] == 0 && visit[i][j] == -1 {
                sumCloseDistance += isClosePlace(i, j)
            }
        }
    }
}

func isClosePlace(_ i: Int, _ j: Int) -> Int {
    visit[i][j] = 1
    var queue = [[i, j]]
    var index = 0
    var count = 0
    var open = false
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for d in (x % 2 == 1 ? even_direction : odd_direction) {
            let (nx, ny) = (x + d[0], y + d[1])
            if !(0..<h).contains(nx) || !(0..<w).contains(ny) {
                open = true
                continue
            }
            if visit[nx][ny] == -1 && graph[nx][ny] == 1 {
                count += 1
            }
            if visit[nx][ny] == -1 && graph[nx][ny] == 0 {
                queue.append([nx, ny])
                visit[nx][ny] = 1
            }
        }
        index += 1
    }
    if open {
        return 0
    } else {
        round_place.append([i, j-1])
        return count
    }
}

func roundCounter(_ i: Int, _ j: Int) -> Int {
    visit[i][j] = 1
    var queue = [[i, j]]
    var index = 0
    var count = 0
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for d in (x % 2 == 1 ? even_direction : odd_direction) {
            let (nx, ny) = (x+d[0], y+d[1])
            if !(0..<h).contains(nx) || !(0..<w).contains(ny) || graph[x][y] != graph[nx][ny] {
                count += 1
                continue
            }
            if visit[nx][ny] == -1  {
                visit[nx][ny] = 1
                queue.append([nx, ny])
            }
        }
        index += 1
    }
    return count
}