var result = 0
for _ in 0..<Int(readLine()!)! {
    var alphabet = [Int](repeating: -1, count: 26)
    var isOverlap = false
    var previous = -1
    for c in Array(readLine()!) {
        let c = Int(c.unicodeScalars.first!.value-97)
        if alphabet[c] == -1 || previous == c { alphabet[c] = 1; previous = c }
        else { isOverlap = true }
    }
    if !isOverlap { result += 1 }
}
print(result)