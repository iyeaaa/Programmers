let n = Int(readLine()!)!
let array = readLine()!.split{$0==" "}.map{Int(String($0))!}
let x = Int(readLine()!)!
let x_arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dict = [Int:Int]()
var result = ""

for i in array {
    if dict.keys.contains(i) {
        dict[i]! += 1
    } else {
        dict[i] = 1
    }
}

for i in x_arr {
    if dict.keys.contains(i) {
        result += "\(dict[i]!) "
    } else {
        result += "0 "
    }
}

print(result)

