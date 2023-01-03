
let INF = 999999999999
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (ip[0], ip[1])
var g = [[(Int, Int)]](repeating: [], count: N+1)
var md = [Int](repeating: INF, count: N+1); md[1] = 0
var cycle = false

for _ in 0..<M {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    g[ip[0]].append((ip[1], ip[2]))
}

for k in 0..<N {
    for i in 1...N {
        if md[i] == INF { continue }
        for (nxt, cost) in g[i] {
            if md[nxt] > md[i] + cost {
                md[nxt] = md[i] + cost
                if k == N-1 {
                    cycle = true
                }
            }
        }
    }
}

if cycle {
    print(-1)
} else {
    for i in 2...N {
        print(md[i] == INF ? -1 : md[i])
    }
}