var t = [Int](repeating: 0, count: 36)

t[0] = 1
for i in 1...35 {
    for j in 0..<i {
        t[i] += t[j]*t[(i-1)-j]
    }
}

print(t[Int(readLine()!)!])
