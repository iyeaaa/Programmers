let N = Int(readLine()!)!
let weights = readLine()!.split{$0==" "}.map{Int(String($0))!}
let M = Int(readLine()!)!
let beads = readLine()!.split{$0==" "}.map{Int(String($0))!}
var isPsb = [Bool](repeating: false, count: 55001); isPsb[0] = true

for weight in weights {
    for i in stride(from: 15000, through: weight, by: -1) where isPsb[i-weight] {
        isPsb[i] = true
    }
}

var result = ""
var isYes = false
for bead in beads {
    for i in 0...15000 where isPsb[i] && isPsb[i+bead] {
        isYes = true
        break
    }
    result += (isYes ? "Y " : "N ")
    isYes = false
}
print(result)
