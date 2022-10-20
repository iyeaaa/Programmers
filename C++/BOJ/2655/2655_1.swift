/**
* 메모리: 69112 KB, 시간: 8 ms
* 2022.10.20
* by Alub
*/
let INF = 99999
let N = Int(readLine()!)!
var L = [(INF,INF,INF,INF)]+[(n: Int, r: Int, h: Int, w: Int)]()
var weight_dp = (0...N).map{_ in 1}
var cnt_dp = weight_dp
var path = (0...N).map{_ in 0}
var idx = 1

for i in 1...N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    L.append((i,input[0],input[1],input[2]))
}

L.sort{$0.r != $1.r ? $0.r > $1.r : $0.w > $1.w}

for i in 1...N {
    var temp = L[i].h, temp_cnt = 1, temp_path = 0
    for j in 1..<i where L[j].w >= L[i].w {
        if temp >= weight_dp[j] + L[i].h { continue }
        temp = weight_dp[j] + L[i].h
        temp_cnt = cnt_dp[j] + 1
        temp_path = j
    }
    weight_dp[i] = temp
    cnt_dp[i] = temp_cnt
    path[i] = temp_path
}

for i in 1...N where weight_dp[i] > weight_dp[idx] {
    idx = i
}

print(cnt_dp[idx])
while idx != 0 { print(L[idx].n); idx = path[idx] }