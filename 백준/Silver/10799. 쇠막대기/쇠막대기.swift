let vim = readLine()!
var count = 0
var result = 0
var pre = false

for v in vim {
    if v == "(" {
        count += 1
        pre = true
    } else {
        count -= 1
        result += (pre ? count : 1)
        pre = false
    }
}

print(result)