import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {

    func dfs(_ x: Int) {
        visit[x] = 1
        for i in 0..<n {
            if visit[i] == -1 && computers[x][i] == 1 {
                dfs(i)
            }
        }
    }
    
    var visit = [Int](repeating: -1, count: n)

    var count = 0
    for i in 0..<n {
        if visit[i] == -1 {
            count += 1
            dfs(i)
        }
    }

    return count
}
