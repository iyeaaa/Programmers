import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
let S = readLine()!.split{$0==" "}.map{Int(String($0))!}

var p1 = 0
var maxValue = Int.min


while p1 < N && S[p1] % 2 == 1 {
    p1 += 1
}

if p1 == N { print(0); exit(0) }

var p2 = p1, count = 0
while p1 < N && p2 < N {
    while p2 < N {
        if S[p2] % 2 == 1 {
            if count >= K { break }
            count += 1
        }
        p2 += 1
    }

    maxValue = max(maxValue, p2-p1-count)

    while p1 < N && S[p1] % 2 == 0 {
        p1 += 1
    }
    while p1 < N && S[p1] % 2 == 1 {
        p1 += 1
        count -= 1
    }
}

print(maxValue)
