let oct = ["000", "001", "010", "011", "100", "101", "110", "111"]
var result = ""

for i in readLine()!.map{Int(String($0))!} {
    result += oct[i]
}

while result.first == "0" {
    result.removeFirst()
}

if result.isEmpty {
    result = "0"
}

print(result)