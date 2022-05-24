import Foundation

let CASE = Int(readLine()!)!
var result = ""

for _ in 0..<CASE {
    var dict = [Int:Int]()
    let n = Int(readLine()!)!
    var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for i in 0..<n {
        dict[input[i]] = 1
    }

    let m = Int(readLine()!)!
    input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for i in 0..<m {
        let temp = dict[input[i]] ?? 0
        if i != m {
            result += "\(temp)\n"
        } else {
            result += "\(temp)"
        }
    }
}

print(result)

