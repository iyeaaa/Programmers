let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let seq = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var result = ""

bkTrk(0, 0, "");
print(result)

func bkTrk(_ digit: Int, _ next: Int, _ strn: String) {
    if digit == m {
        result += strn + "\n"
        return
    }
    for i in next..<n {
        bkTrk(digit+1, i, strn + "\(seq[i]) ")
    }
}