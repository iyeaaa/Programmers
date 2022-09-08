/**
* 메모리: 69112 KB, 시간: 196 ms
* 2022.09.08
* by Alub
*/
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, K) = (input[0], input[1], input[2])
var order = [(Int, Int, Int)]()
var A = [[0]]
var ans = 999999999999

for _ in 0..<N {
    A.append([0]+readLine()!.split(separator: " ").map{Int(String($0))!})
}

for _ in 0..<K {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    order.append((input[0], input[1], input[2]))
}

permutation(0)

print(ans)

func copy(_ r: Int, _ c: Int, _ s: Int, _ A: inout [[Int]]) {
    var g = [[Int]](repeating: [Int](repeating: 0, count: 2*s+1), count: 2*s+1)

    for i in 0...2*s {
        for j in 0...2*s {
            g[i][j] = A[r-s+i][c-s+j]
        }
    }

    let rtted = rotate(2*s+1, g)

    for i in 0...2*s {
        for j in 0...2*s {
            A[r-s+i][c-s+j] = rtted[i][j]
        }
    }
}

func permutation(_ idx: Int) {
    if K == idx {
        var cur = A
        for (r, c, s) in order {
            copy(r, c, s, &cur)
        }

        var value = Int.max
        for i in 1...N {
            value = min(value, cur[i].reduce(0, +))
        }

        ans = min(value, ans)
        return
    }

    for i in idx..<K {
        order.swapAt(idx, i)
        permutation(idx+1)
        order.swapAt(idx, i)
    }
}

func rotate(_ n: Int, _ arr: [[Int]]) -> [[Int]] {
    var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var y = 0, x = 0
    for i in stride(from: n-1, through: 0, by: -2) {
        if (i == 0) {
            result[y][x] = arr[y][x]
        }
        for _ in 0..<i {
            result[y][x+1] = arr[y][x]
            x += 1
        }
        for _ in 0..<i {
            result[y+1][x] = arr[y][x]
            y += 1
        }
        for _ in 0..<i {
            result[y][x-1] = arr[y][x]
            x -= 1
        }
        for _ in 0..<i {
            result[y-1][x] = arr[y][x]
            y -= 1
        }
        y += 1
        x += 1
    }
    return result
}