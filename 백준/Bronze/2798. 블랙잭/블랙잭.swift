let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let cards = readLine()!.split{$0==" "}.map{Int(String($0))!}

var max = 0

for i in 0..<cards.count {
    for j in 0..<cards.count {
        for k in 0..<cards.count {
            if i == j || i == k || j == k {
                continue
            } else {
                let sum = cards[i]+cards[j]+cards[k]
                if sum <= m && sum > max {
                    max = sum
                }
            }
        }
    }
}

print(max)