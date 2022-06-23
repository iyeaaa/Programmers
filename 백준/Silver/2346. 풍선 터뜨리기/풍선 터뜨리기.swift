let n = Int(readLine()!)!
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var list = [Element](); for i in 1...n { list.append(Element(no: i, value: input[i-1])) }

var temp = list[0]
var result = "1 "
list.remove(at: 0)
var locate = locatingIndex(temp.value > 0 ? temp.value-1 : temp.value)
while !list.isEmpty {
    temp = list[locate]
    result += "\(list.remove(at: locate).no) "
    if list.isEmpty { break }
    locate = locatingIndex(temp.value > 0 ? locate+temp.value-1 : locate+temp.value)
}

print(result)

func locatingIndex(_ i: Int) -> Int {
    var i = i
    while i < 0 {
        i += list.count
    }
    if i >= list.count {
        i %= list.count
    }
    return i
}

struct Element {
    let no: Int
    let value: Int
}