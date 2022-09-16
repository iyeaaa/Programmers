/**
* 메모리: 69104 KB, 시간: 20 ms
* 2022.09.16
* by Alub
*/
var N = Int(readLine()!)!
var W = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = Int.min

dfs(0)
print(ans)

func dfs(_ energy: Int) {
    if N == 2 {
        ans = max(ans, energy)
        return
    }
    for i in 2..<N {
        N -= 1
        let w = W.remove(at: i)
        dfs(energy + W[i-1]*W[i])
        W.insert(w, at: i)
        N += 1
    }
}