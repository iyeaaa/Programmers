import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var isErased = [Bool](repeating: false, count: N+1)

var count = 0
var num = 2
while true {
    var multi = 1
    var factor = num*multi
    while factor <= N {
        if !isErased[factor] {
            count += 1
            isErased[factor] = true
        }
        multi += 1
        if count == K {
            print(factor)
            exit(0)
        }
        factor = num * multi
    }
    num += 1
}