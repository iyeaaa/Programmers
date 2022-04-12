let n = Int(readLine()!)!
var array = [[Int]]()
var result = ""

for _ in 0..<n {
    let point = readLine()!.split{$0==" "}.map{Int(String($0))!}
    array.append(point)
}

array.sort(by: {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    }
    return $0[1] < $1[1]
})

for i in 0..<n {
    result += "\(array[i][0]) \(array[i][1]) \n"
}

print(result)
