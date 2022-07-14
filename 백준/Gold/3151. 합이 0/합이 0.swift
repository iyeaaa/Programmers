
let N = Int(readLine()!)!
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var answer = 0

for i in stride(from: 0, to: N-2, by: 1) {
    let target = -1*A[i]
    var (lf, ryt) = (i+1, N-1)
    while lf < ryt {
        let sum = A[lf] + A[ryt]
        if sum == target {
            let (isLf, isRyt) = (A[lf], A[ryt])
            if isLf == isRyt {
                answer += (ryt-lf+1)*(ryt-lf)/2
                break
            } else {
                var (lCnt, rCnt) = (0, 0)
                while A[ryt] == isRyt {
                    ryt -= 1
                    rCnt += 1
                }
                while A[lf] == isLf {
                    lf += 1
                    lCnt += 1
                }
                answer += lCnt*rCnt
            }
        } else if sum < target {
            lf += 1
        } else {
            ryt -= 1
        }
    }
}

print(answer)
