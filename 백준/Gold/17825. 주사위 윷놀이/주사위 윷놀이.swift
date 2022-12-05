
var g = [[Int]](repeating: [], count: 101)
var score = [Int](repeating: 0, count: 101)
var list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var ans = Int.min

for i in 0...100 {g[i] = [i+1]; score[i] = i*2}
g[5].append(21); g[10].append(24); g[15].append(26)
g[23] = [29]; g[25] = [29]; g[31] = [20]; g[20] = [100]
score[21]=13; score[22]=16; score[23]=19; score[24]=22; score[25]=24;
score[26]=28; score[27]=27; score[28]=26; score[29]=25; score[30]=30;
score[31]=35; score[100]=0;

C(0, [])
print(ans)

func f(_ player: [Int]) -> Int {
    var local = [0, 0, 0, 0]
    var rtn = 0
    for i in 0..<10 {
        var cur_local = local[player[i]]
        if cur_local == 100 { return Int.min }
        if g[cur_local].count > 1 {
            cur_local = g[cur_local][1]
        } else {
            cur_local = g[cur_local][0]
        }
        for _ in 1..<list[i] {
            if cur_local == 100 { break }
            cur_local = g[cur_local][0]
        }
        if cur_local != 100 && local.contains(cur_local) {
            return Int.min
        }
        rtn += score[cur_local]
        local[player[i]] = cur_local
    }
    return rtn
}

func C(_ cnt: Int, _ player: [Int]) {
    if cnt == 10 {
        ans = max(ans, f(player))
        return
    }
    for i in 0..<4 {
        C(cnt+1, player+[i])
    }
}