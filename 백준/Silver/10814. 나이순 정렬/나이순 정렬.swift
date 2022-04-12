let n = Int(readLine()!)!
var list = [(age: Int, name: String, sign: Int)]()
var result = ""

for i in 0..<n {
    let temp = readLine()!.split{$0==" "}.map{String($0)}
    list.append((Int(temp[0])!, temp[1], Int(String(i))!))
}

list.sort(by: {
    if $0.age == $1.age {
        return $0.sign < $1.sign
    }
    return $0.age < $1.age
})


for i in 0..<n {
    result += "\(list[i].age) \(list[i].name)\n"
}

print(result)
