let n = Int(readLine()!)!
var person = [Int](); for _ in 0..<n { person.append(Int(readLine()!)!) }

person.sort(by: >)

var tip = 0
var no = 1
for p in person {
    let temp = p - (no - 1)
    tip += temp > 0 ? temp : 0
    no += 1
}

print(tip)