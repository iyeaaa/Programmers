var count = 0
var isPreOpen = false
var sum = 0
for c in readLine()! {
    if c == "(" {
        count += 1
        isPreOpen = true
    } else {
        count -= 1
        sum += isPreOpen ? count : 1
        isPreOpen = false
    }
}
print(sum)