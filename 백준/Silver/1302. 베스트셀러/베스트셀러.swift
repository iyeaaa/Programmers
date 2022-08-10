let N = Int(readLine()!)!
var nameToCnt = [String: Int]()

for _ in 0..<N {
    nameToCnt[readLine()!, default: 0] += 1
}

print(nameToCnt.sorted{$0.value != $1.value ? $0.value > $1.value : $0.key < $1.key}[0].key)