let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])

var packageMin = Int.max
var eachMin = Int.max
for i in 0..<m {
    let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if temp[0] < packageMin {
        packageMin = temp[0]
    }
    if temp[1] < eachMin {
        eachMin = temp[1]
    }
}

if packageMin >= eachMin*6 {
    print(n*eachMin)
} else {
    let amount = n/6
    var result = min(packageMin*amount + (n%6)*eachMin, packageMin*(amount+1))
    print(result)
}