let n = Int(readLine()!)!
var dp1 = [Int](repeating: 0, count: 46)
var dp2 = [Int](repeating: 0, count: 46)

(dp1[1], dp2[1], dp1[2], dp2[2]) = (0, 1, 1, 1)

for i in 3...45 {
    dp1[i] = dp1[i-1] + dp1[i-2]
    dp2[i] = dp2[i-1] + dp2[i-2]
}

print(dp1[n], dp2[n])
