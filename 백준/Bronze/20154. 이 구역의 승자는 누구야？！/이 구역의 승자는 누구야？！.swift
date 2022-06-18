let list = [3, 2, 1, 2, 3, 3, 3, 3, 1, 1, 3, 1, 3, 3, 1, 2, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1]

var sum = 0
for s in readLine()! {
    sum += list[Int(s.unicodeScalars.first!.value)-65]
}

print(sum % 2 != 0 ? "I'm a winner!" : "You're the winner?")