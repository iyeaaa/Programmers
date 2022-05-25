var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let x = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var result = ""

for i in 0..<m {
    input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    result += "\(bs2(input[1]) - bs1(input[0]) + 1)\n"
}

print(result)

func bs1(_ n: Int) -> Int {
    var start = 0
    var end = x.count - 1
    while start <= end {
        let mid = (start + end) / 2
        if x[mid] < n {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return start
}

func bs2(_ n: Int) -> Int {
    var start = 0
    var end = x.count - 1
    while start <= end {
        let mid = (start + end) / 2
        if x[mid] <= n {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return end
}
