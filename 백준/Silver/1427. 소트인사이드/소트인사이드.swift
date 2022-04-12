var array = [Int]()
let number = readLine()!
var result = ""

for ch in number {
    array.append(Int(String(ch))!)
}

array.sort(by: >)

for i in array {
    result += String(i)
}

print(result)
