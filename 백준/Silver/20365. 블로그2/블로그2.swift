let n = Int(readLine()!)!
let color = Array(readLine()!)
var blue = 0, red = 0
var preblue = false

if color[0] == "B" {
    blue += 1; preblue = true
} else {
    red += 1
}

for c in 1..<color.count {
    if color[c] == "B" && !preblue {
        blue += 1
        preblue = true
    } else if color[c] == "R" && preblue {
        red += 1
        preblue = false
    }
}

print(blue < red ? blue + 1 : red + 1)