let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (a, p) = (input[0], input[1])
var array = [a]
var index = 0

while true {
    var num = 0
    let temp = Array(String(array.last!)).map{Int(String($0))!}
    for i in temp {
        var t = 1
        for _ in 0..<p {
            t *= i
        }
        num += t
    }
    if array.contains(num) {
        index = array.firstIndex(of: num)!
        break
    }
    array.append(num)
}

print(index)