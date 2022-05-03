import Foundation

let n = Int(readLine()!)!
var p = [Person]()

for _ in 0..<n {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    p.append(Person(w: input[0], h: input[1]))
}

for i in 0..<n {
    for j in 0..<n {
        if p[i].weight < p[j].weight && p[i].height < p[j].height {
            p[i].no += 1
        }
    }
}

print(p.map{String($0.no)}.joined(separator: " "))

class Person {
    let weight: Int
    let height: Int
    var no: Int
    init(w: Int, h: Int) {
        weight = w
        height = h
        no = 1
    }
}
