var eng = [Int](repeating: 0, count: 26)
let input = readLine()!

for i in input {
    eng[Int(i.asciiValue!)-97] += 1
}

print(eng.map{String($0)}.joined(separator: " "))