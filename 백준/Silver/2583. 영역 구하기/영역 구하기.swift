let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m, k) = (input[0], input[1], input[2])
var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for _ in 0..<k {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (start_x, start_y) = (n-1-input[1], input[0])
    let (end_x, end_y) = (n-input[3], input[2]-1)
    for i in end_x...start_x {
        for j in start_y...end_y {
            visit[i][j] = true
        }
    }
}

var result = [Int]()
var count = 0
for i in 0..<n {
    for j in 0..<m {
        if !visit[i][j] {
            result.append(bfs(i, j))
            count += 1
        }
    }
}

print(count)
print(result.sorted().map{String($0)}.joined(separator: " "))

func bfs(_ i: Int, _ j: Int) -> Int {
    var queue = [[i, j]]
    var index = 0
    var count = 1
    visit[i][j] = true
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
            let (nx, ny) = (x+i[0], y+i[1])
            if (0..<n).contains(nx) && (0..<m).contains(ny) {
                if !visit[nx][ny] {
                    queue.append([nx, ny])
                    visit[nx][ny] = true
                    count += 1
                }
            }
        }
        index += 1
    }
    return count
}

/*
 (0, 2) - (4, 4)
 (2, 0) - (4, 4)
 (2, 0) - (3, 3)
 (4-2, 0) - (4-3, 3)
 (2, 0) - (1, 3)

 1. x <-> y
 2. end 좌표 x-1, y-1
 3. n-1-start_x, n-1-end_x
 */