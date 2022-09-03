/**
* 메모리: 69104 KB, 시간: 16 ms
* 2022.09.03
* by Alub
*/
let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int(String($0))!}
var V = [Bool](repeating: false, count: 10)
var ans = Int.min

func perm(_ depth: Int) {
    if depth == N {
        var sum = 0
        for i in 1..<N {
            sum += abs(A[i-1]-A[i])
        }
        ans = max(ans, sum)
        return
    }
    for i in depth..<N {
        if i != depth {
            A.swapAt(i, depth)
        }
        perm(depth+1)
        if i != depth {
            A.swapAt(i, depth)
        }
    }
}

perm(0)
print(ans)