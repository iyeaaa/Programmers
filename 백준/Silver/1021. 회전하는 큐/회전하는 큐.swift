let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var haveToPop = readLine()!.split(separator: " ").map{Int(String($0))!}
var list = Array(1...N)
var count = 0

while !haveToPop.isEmpty {
    let cur = haveToPop.removeFirst()
    let curIdx = list.firstIndex(of: cur)!;

    if curIdx - 0 < list.count - curIdx {
        while list.first! != cur {
            secondCmd()
            count += 1
        }
    } else {
        while list.first! != cur {
            thirdCmd()
            count += 1
        }
    }

    list.removeFirst()
}

print(count)

func secondCmd() {
    list.append(list.removeFirst())
}

func thirdCmd() {
    list.insert(list.popLast()!, at: 0)
}