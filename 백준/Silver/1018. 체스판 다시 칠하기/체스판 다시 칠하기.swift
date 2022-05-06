let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var chess = [[Character]](repeating: [], count: n)

for i in 0..<n {
    chess[i] = (Array(readLine()!))
}

var min = Int.max
for i in 0..<n-7 {
    for j in 0..<m-7 {
        let one = firstWhite(i: i, j: j)
        let two = firstBlack(i: i, j: j)
        if min > one {
            min = one
        }
        if min > two {
            min = two
        }
    }
}

print(min)

func firstWhite(i: Int, j: Int) -> Int {
    var count = 0
    for w in stride(from: i, through: i+7, by: 2) {
        for h in stride(from: j, through: j+7, by: 2) {
            if chess[w][h] != "W" {
                count += 1
            }
            if chess[w][h+1] != "B" {
                count += 1
            }
        }
    }
    for w in stride(from: i+1, through: i+7, by: 2) {
        for h in stride(from: j, through: j+7, by: 2) {
            if chess[w][h] != "B" {
                count += 1
            }
            if chess[w][h+1] != "W" {
                count += 1
            }
        }
    }
    return count
}

func firstBlack(i: Int, j: Int) -> Int {
    var count = 0
    for w in stride(from: i, through: i+7, by: 2) {
        for h in stride(from: j, through: j+7, by: 2) {
            if chess[w][h] != "B" {
                count += 1
            }
            if chess[w][h+1] != "W" {
                count += 1
            }
        }
    }
    for w in stride(from: i+1, through: i+7, by: 2) {
        for h in stride(from: j, through: j+7, by: 2) {
            if chess[w][h] != "W" {
                count += 1
            }
            if chess[w][h+1] != "B" {
                count += 1
            }
        }
    }
    return count
}