func starPrint(_ x: Int,_ y: Int, _ n: Int,_ empty: Bool) {
    if empty {
        for i in x..<x+n {
            for j in y..<y+n {
                arr[i][j] = " "
            }
        }
        return
    }
    
    if n == 1 && !empty {
        return
    }
    
    for i in stride(from: x, to: x+n, by: n/3) {
        for j in stride(from: y, to: y+n, by: n/3) {
            if i == x+(n/3) && j == y+(n/3) {
                starPrint(i, j, n/3, true)
            }
            else {
                starPrint(i, j, n/3, false)
            }
        }
    }
}

let n = Int(readLine()!)!

var arr
= [[Character]](repeating: [Character](repeating: "*", count: n), count: n)

starPrint(0, 0, n, false)

var result = ""

for i in 0..<n {
    for j in 0..<n {
        result.append(arr[i][j])
    }
    result.append("\n")
}

print(result)
