
let k = Int(readLine()!)!
var sum = 1
for _ in 1... {
    if sum >= k {print(f(k,sum)); break}
    sum *= 2
}

func f(_ x: Int, _ len: Int) -> Int {
    if x==1 {return 0}
    var sum = 1
    for _ in 0... { sum *= 2; if sum >= x {break}}
    return 1-f(x-sum/2, sum/2)
}