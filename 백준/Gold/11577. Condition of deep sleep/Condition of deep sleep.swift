
func isOn(_ i: Int) -> Bool {
    pushCnt%2 == 0 && L[i]==1 || pushCnt%2 == 1 && L[i]==0
}

let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (ip[0], ip[1])
let L = readLine()!.split{$0==" "}.map{Int(String($0))!}
var push = [Int](repeating: 0, count: N), pushCnt = 0
var ans = 0, success = true

for i in 0...N-K {
    pushCnt -= (i-K >= 0 ? push[i-K] : 0)
    if isOn(i) {
        pushCnt += 1
        ans += 1
        push[i] += 1
    }
}

for i in N-K+1..<N {
    pushCnt -= (i-K >= 0 ? push[i-K] : 0)
    if isOn(i) {success = false}
}

print(!success ? "Insomnia" : ans)