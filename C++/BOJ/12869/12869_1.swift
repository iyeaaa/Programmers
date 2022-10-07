/**
* 메모리: 69900 KB, 시간: 12 ms
* 2022.10.07
* by Alub
*/
// f(i, j, k): SCV들의 체력이 각각 i, j, k 있을 때, 모든 SCV를 파고하기 위해 공격해야하는 최소 횟수.
// f(i, j, k) = min(f(i-9, i-3, i-1), f(i-3, i-9, i-1) ..... , ) + 1
// Time Complexity : O(N^3 * N!) = max 1296000

let INF = 987654321
let N = Int(readLine()!)!
let HP = readLine()!.split{$0==" "}.map{Int(String($0))!}+[Int](repeating: 0, count: 3-N)
let all_case = [(9,3,1),(9,1,3),(3,9,1),(3,1,9),(1,3,9),(1,9,3)]
var memo = Array(repeating: Array(repeating: Array(repeating: INF
        , count: HP[2]+1), count: HP[1]+1), count: HP[0]+1)

print(f(HP[0], HP[1], HP[2]))

func f(_ x: Int, _ y: Int, _ z: Int) -> Int {
    if x <= 0 && y <= 0 && z <= 0 {
        return 0
    }
    if memo[x][y][z] != INF {
        return memo[x][y][z]
    }
    var rtn = INF
    for (a, b, c) in all_case {
        rtn = min(rtn, f(x-a < 0 ? 0 : x-a, y-b < 0 ? 0 : y-b, z-c < 0 ? 0 : z-c)+1)
    }
    memo[x][y][z] = rtn
    return rtn
}
