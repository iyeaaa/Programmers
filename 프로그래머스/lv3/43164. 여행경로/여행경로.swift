import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var dict = [String: [String]]()
    var visit = [String: [Bool]]()
    var cntTkt = 0
    var result = [[String]]()
    for t in tickets {
        dict[t[0], default: []].append(t[1])
        visit[t[0], default: []].append(false)
    }
    for d in dict.keys {
        dict[d]!.sort()
        cntTkt += dict[d]!.count
    }

    func dfs(_ cur: String, _ stack: [String]) {
        if stack.count == cntTkt+1 { result.append(stack); return }
        for i in 0..<(dict[cur] ?? []).count {
            let next = dict[cur]![i]
            if !visit[cur]![i] {
                visit[cur]![i] = true
                dfs(next, stack+[next])
                visit[cur]![i] = false
            }
        }
    }

    dfs("ICN", ["ICN"])

    return result[0]
}
