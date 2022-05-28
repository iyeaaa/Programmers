let board = readLine()!
var result = ""
var count = 0
for b in board {
    if b == "." {
        if count % 2 == 1 {
            break
        }
        addString(len: count)
        result += "."
    } else {
        count += 1
    }
}

if count % 2 == 1{
    print(-1)
} else {
    addString(len: count)
    print(result)
}

func addString(len: Int) {
    result += String(repeating: "AAAA", count: len / 4)
    result += String(repeating: "BB", count: len % 4 / 2)
    count = 0
}