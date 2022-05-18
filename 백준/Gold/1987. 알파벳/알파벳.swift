let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]](repeating: [], count: n+1)
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]
var max_value = 0

for i in 1...n {
    graph[i] = [0] + readLine()!.map{Int($0.asciiValue!) - 65}
}

dfs(1, 1, 1, 1 << graph[1][1])
print(max_value)

func dfs(_ x: Int, _ y: Int, _ digit: Int, _ bit: Int) {
    max_value = max_value > digit ? max_value : digit
    for i in direction {
        let (nx, ny) = (x+i[0], y+i[1])
        if (1...n).contains(nx) && (1...m).contains(ny) {
            let nb = 1 << graph[nx][ny]
            if (nb & bit == 0) {
                dfs(nx, ny, digit+1, bit | nb)
            }
        }
    }
}
// 이런생각은 어케하는거지