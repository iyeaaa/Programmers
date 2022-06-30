import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var visit = Array(repeating: -1, count: n+1); visit[1] = 0
    var list = [[Int]](repeating: [], count: n+1)
    var maxValue = 0
    for e in edge {
        list[e[0]].append(e[1])
        list[e[1]].append(e[0])
    }

    var queue = [1], index = 0
    while index < queue.count {
        let cur = queue[index]
        for l in list[cur] {
            if visit[l] == -1  {
                queue.append(l)
                visit[l] = visit[cur] + 1
                maxValue = max(maxValue, visit[l])
            }
        }
        index += 1
    }

    return visit.filter{$0==maxValue}.count
}