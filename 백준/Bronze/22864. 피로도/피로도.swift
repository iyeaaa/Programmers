import Foundation

var fatigue = 0
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (A, B, C, M) = (input[0], input[1], input[2], input[3])
var work = 0

for _ in 0..<24 {
    if fatigue + A > M {
        fatigue -= C
        if fatigue < 0 { fatigue = 0 }
    } else {
        fatigue += A
        work += B
    }
}

print(work)