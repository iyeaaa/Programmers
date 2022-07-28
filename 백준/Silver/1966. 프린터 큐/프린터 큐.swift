var result = ""

func solve() -> Int {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (_, M) = (input[0], input[1])
    var documents = Array(readLine()!.split{$0==" "}.map{Int(String($0))!}.enumerated())
    var first = 0

    var count = 0
    while true {
        if isGreat() {
            count += 1
            if documents[first].offset == M {
                return count
            }
            first += 1
        } else {
            documents.append(documents[first])
            first += 1
        }
    }

    func isGreat() -> Bool {
        for i in first+1..<documents.count {
            if documents[first].element < documents[i].element {
                return false
            }
        }
        return true
    }
}

for _ in 0..<Int(readLine()!)! {
    result += "\(solve())\n"
}
print(result)