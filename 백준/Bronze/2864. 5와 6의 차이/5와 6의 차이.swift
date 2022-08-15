let input = readLine()!.split(separator: " ").map{Array(String($0)).map{String($0)}}
let (A, B) = (input[0], input[1])

var minA = Int(A.map{$0=="6" ? "5" : $0}.joined())!
var minB = Int(B.map{$0=="6" ? "5" : $0}.joined())!
var maxA = Int(A.map{$0=="5" ? "6" : $0}.joined())!
var maxB = Int(B.map{$0=="5" ? "6" : $0}.joined())!

print(minA+minB, maxA+maxB)