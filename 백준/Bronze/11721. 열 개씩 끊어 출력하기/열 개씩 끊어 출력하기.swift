let input = Array(readLine()!)
var result = ""

var i = 0
while i < input.count {
    result += String(input[i])
    i += 1
    if i%10 == 0 {
        result += "\n"
    }
}

print(result)
