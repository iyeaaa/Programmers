let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var price = [[Int]](repeating: [Int](repeating: 0, count: 2), count: m)

var packageMin = Int.max
var eachMin = Int.max
for i in 0..<m {
    price[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if price[i][0] < packageMin {
        packageMin = price[i][0]
    }
    if price[i][1] < eachMin {
        eachMin = price[i][1]
    }
}

if packageMin >= eachMin*6 {
    print(n*eachMin)
} else {
    let amount = n/6
    var result = min(packageMin*amount + (n%6)*eachMin, packageMin*(amount+1))
    print(result)
}