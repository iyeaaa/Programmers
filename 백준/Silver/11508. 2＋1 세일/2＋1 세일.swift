var list = [Int](); for _ in 0..<Int(readLine()!)! { list.append(Int(readLine()!)!) }
list.sort(by: >)
var sum = 0
for i in 0..<list.count { if i % 3 != 2 { sum += list[i] } }
print(sum)