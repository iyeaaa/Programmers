let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var n = input[0]; let m = input[1]
var dict = [Int:Int]()
var seq = readLine()!.split{$0==" "}.map{Int(String($0))!}
for s in seq { dict[s, default: 0] += 1 }
seq = Set(seq).sorted(); n = seq.count

var result = ""

bkTrk(0, "", 0);
print(result)

func bkTrk(_ digit: Int, _ strn: String, _ next: Int) {
    if digit == m {
        result += strn + "\n"
        return
    }
    for i in next..<n {
        if dict[seq[i]]! >= 1 {
            dict[seq[i]]! -= 1
            bkTrk(digit+1, strn + "\(seq[i]) ", i)
            dict[seq[i]]! += 1
        }
    }
}