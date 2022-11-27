
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, Hatk) = (input[0], input[1])
var room = [(t:Int,a:Int,h:Int)]()

for _ in 0..<N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    room.append((input[0], input[1], input[2]))
}

var lo = 0, hi = Int.max
while lo+1 < hi {
    let mid = (lo+hi)/2
    if !psb(mid) {lo=mid} else {hi=mid}
}
print(hi)

func psb(_ mxHp: Int) -> Bool {
    var curHp = mxHp
    var curAtk = Hatk
    for (t, a, h) in room {
        if curHp <= 0 { return false }
        if t == 1 {
            let toM = h / curAtk + (h%curAtk==0 ? 0 : 1)
            let toH = curHp / a + (curHp%a==0 ? 0 : 1)
            if toM <= toH {
                curHp -= (toM-1) * a
            } else {
                return false
            }
        } else {
            curAtk += a
            curHp = min(curHp+h, mxHp)
        }
    }
    return curHp > 0
}