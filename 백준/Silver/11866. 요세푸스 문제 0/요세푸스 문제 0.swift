let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var killIndex = k
var kill = [Bool](repeating: false, count: n)
var allKill = 0
var result = "<"

while allKill != n {
    if !kill[killIndex%n] {
        kill[killIndex%n] = true
        allKill += 1
        if killIndex%n != 0 {
            result += "\(killIndex%n)"
        } else {
            result += "\(n)"
        }
        if allKill != n {
            result += ", "
        } else {
            result += ">"
        }
    }
    if allKill != n {
        var count = 0
        while count != k {
            killIndex += 1
            if !kill[killIndex%n] {
                count += 1
            }
        }
    }
}

print(result)
