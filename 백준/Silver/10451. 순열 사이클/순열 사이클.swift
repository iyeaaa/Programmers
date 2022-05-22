let CASE = Int(readLine()!)!

for _ in 0..<CASE {
    let n = Int(readLine()!)!
    var visit = [Int](repeating: -1, count: n+1)
    let input = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
    var list = [[Int]](repeating: [], count: n+1)

    for i in 1...n {
        list[i].append(input[i])
        list[input[i]].append(i)
    }

    var count = 0
    for i in 1...n {
        if visit[i] == -1 {
            dfs(i)
            count += 1
        }
    }

    print(count)

    func dfs(_ x: Int) {
        visit[x] = 1
        for i in list[x] {
            if visit[i] == -1 {
                dfs(i)
            }
        }
    }
}
