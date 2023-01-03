
extension Character {var int: Int {Int(unicodeScalars.first!.value)}}
var ans = 0, m=1
Array(readLine()!).reversed().forEach{ ans += ($0.isLetter ? $0.int-55 : Int(String($0))!)*m; m*=16 }
print(ans)