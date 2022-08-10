let N = Int(readLine()!)!
var card = Array(1...N)
var dumped = [Int]()

while card.count != 1 {
    dumped.append(card.removeFirst())
    if card.count == 1 { break }
    card.append(card.removeFirst())
}

dumped.append(card.first!)
print(dumped.map{String($0)}.joined(separator: " "))