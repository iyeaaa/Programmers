import Foundation

let n = Int(readLine()!)!
let input = readLine()!
var bCnt = 0
var rCnt = 0
var chr = ""
input.forEach {
    if String($0) != chr {
        if $0 == "B" {
            bCnt += 1
            chr = "B"
        } else {
            rCnt += 1
            chr = "R"
        }
    }
}
print(1+min(bCnt, rCnt))