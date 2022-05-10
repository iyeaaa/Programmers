let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var dict = [String:Int]()

for _ in 0..<n {
    dict[readLine()!] = 1
}
for _ in 0..<m {
    let temp = readLine()!
    if dict[temp] != nil {
        dict[temp]! += 1
    } else {
        dict[temp] = 1
    }
}

var array = dict.sorted{$0.key < $1.key}

var result = ""
var count = 0
for i in array {
    if i.value == 2 {
        result += i.key + "\n"
        count += 1
    }
}

print(count)
print(result)