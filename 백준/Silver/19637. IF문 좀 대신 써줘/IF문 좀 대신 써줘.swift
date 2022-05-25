let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var rank = [Element]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    let last = rank.last ?? Element(rank: "", power: -1)
    if last.power != Int(input[1])! {
        rank.append(Element(rank: input[0], power: Int(input[1])!))
    }
}

var result = ""
for _ in 0..<m {
    result += binary_Search(u: Int(readLine()!)!) + "\n"
}
print(result)

func binary_Search(u: Int) -> String {
    var start = 0
    var end = rank.count - 1
    while start <= end {
        let mid = (start + end) / 2
        if u > rank[mid].power {
            start = mid + 1
        } else if u < rank[mid].power {
            end = mid - 1
        } else {
            return rank[mid].rank
        }
    }
    return rank[start].rank
}

struct Element {
    let rank: String
    let power: Int
}