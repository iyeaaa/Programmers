/**
* 메모리: 69108 KB, 시간: 12 ms
* 2022.09.08
* by Alub
*/
let (RED, BLUE) = (0, 1)
let N = Int(readLine()!)!
let P = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
var G = [[Int]](repeating: [], count: N+1)
var ans = Int.max

crtGraph()

var color = [Int](repeating: RED, count: N+1)
for i in 1...N {
    color[i] = BLUE
    dfs(i+1, color)
    color[i] = RED
}

print(ans != Int.max ? ans : -1)

func bfsToPsb(_ C: [Int]) -> Bool {
    var queue = [1], idx = 0
    var V = [Bool](repeating: false, count: N+1)
    V[1] = true

    while idx < queue.count {
        let cur = queue[idx]; idx += 1
        for next in G[cur] where !V[next] && C[1] == C[next] {
            queue.append(next)
            V[next] = true;
        }
    }

    let color = C[1]
    var first = 0
    for i in 1...N where !V[i] {
        if color == C[i] {
            return false
        } else {
            first = i
        }
    }

    queue = [first]; idx = 0
    V[first] = true

    while idx < queue.count {
        let cur = queue[idx]; idx += 1
        for next in G[cur] {
            if !V[next], C[next] != C[cur] {
                return false
            } else if !V[next], C[next] == C[cur] {
                queue.append(next)
                V[next] = true
            }
        }
    }

    for i in 1...N {
        if !V[i] {
            return false
        }
    }

    return true
}

func dfs(_ idx: Int, _ C: [Int]) {
    if bfsToPsb(C) {
        var red = 0, blue = 0
        for i in 1...N {
            if C[i] == RED {
                red += P[i]
            } else {
                blue += P[i]
            }
        }
        ans = min(ans, abs(red-blue))
    }

    if idx > N {
        return;
    }

    var C = C
    for i in idx...N {
        C[i] = BLUE
        dfs(i+1, C)
        C[i] = RED
    }
}

func crtGraph() {
    for i in 1...N {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in input[1...] {
            G[i].append(j)
        }
    }
}

// 시간복잡도 : O(2^N) * O(N*N) = 2^10 * 100 = 102400