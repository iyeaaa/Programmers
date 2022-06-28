let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var n = input[0]; let m = input[1]
var dict = [Int:Int]()
var seq = Set(readLine()!.split{$0==" "}.map{Int(String($0))!}).sorted()
n = seq.count

var result = ""

bkTrk(0, "");
print(result)

func bkTrk(_ digit: Int, _ strn: String) {
    if digit == m {
        result += strn + "\n"
        return
    }
    for i in 0..<n {
            bkTrk(digit+1, strn + "\(seq[i]) ")
    }
}