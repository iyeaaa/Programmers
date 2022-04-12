let n = Int(readLine()!)!
var set = Set<String>()
var result = ""

for _ in 0..<n {
    set.insert(readLine()!)
}

var array = Array(set)
array.sort(by: {
    if $0.count == $1.count {
        return $0 < $1
    }
    return $0.count < $1.count
})

for i in 0..<array.count {
    result += array[i] + "\n"
}

print(result)
