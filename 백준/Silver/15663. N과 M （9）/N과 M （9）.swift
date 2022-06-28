let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var dict = [Int:Int]()
var seq = readLine()!.split{$0==" "}.map{ Int(String($0))! }
var set_seq = Set(seq)
for s in seq { dict[s, default: 0] += 1 }
seq = set_seq.sorted()

var result = ""

bkTrk(0, "");
print(result)

func bkTrk(_ digit: Int, _ strn: String) {
    if digit == m {
        result += strn + "\n"
        return
    }
    for i in seq {
        if dict[i]! >= 1 {
            dict[i]! -= 1
            bkTrk(digit+1, strn + "\(i) ")
            dict[i]! += 1
        }
    }
}