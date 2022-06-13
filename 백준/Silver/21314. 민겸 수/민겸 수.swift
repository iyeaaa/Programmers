// 둘다 K가 나올때까지 M을 카운트, K가 나오면 K까지 or K 전까지, 만약 나오지 않는다면 최대한 잘게 or 모두
// 나 진짜 못하네; ㅋㅋ

let str = readLine()!

print(findMax())
print(findMin())

func findMax() -> String {
    var countM = 0
    var max = ""
    for s in str {
        if s == "M" {
            countM += 1
        } else {
            max += "5" + String(repeating: "0", count: countM)
            countM = 0
        }
    }
    if countM > 0 {
        max += String(repeating: "1", count: countM)
    }
    return max
}

func findMin() -> String {
    var min = ""
    var countM = 0
    for s in str {
        if s == "M" {
            countM += 1
        } else {
            if countM > 0 {
                min += "1" + String(repeating: "0", count: countM-1)
            }
            min += "5"; countM = 0
        }
    }
    if countM > 0 {
        min += "1" + String(repeating: "0", count: countM-1)
    }
    return min
}