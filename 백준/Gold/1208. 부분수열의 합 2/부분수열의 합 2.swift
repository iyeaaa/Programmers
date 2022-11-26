
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, S) = (input[0], input[1]), half = N/2
let list = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var map = [Int: Int]()
var ans = 0

C1(0, 0)
C2(half, 0)
print(S==0 ? ans-1 : ans)

func C1(_ idx: Int, _ sum: Int) {
    map[sum, default: 0] += 1
    for i in stride(from: idx+1, through: half, by: 1) {
        C1(i, sum+list[i])
    }
}

func C2(_ idx: Int, _ sum: Int) {
    ans += map[S-sum, default: 0]
    for i in stride(from: idx+1, through: N, by: 1) {
        C2(i, sum+list[i])
    }
}