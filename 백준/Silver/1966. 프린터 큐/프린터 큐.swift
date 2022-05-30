for _ in 0..<Int(readLine()!)! {
    var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m) = (input[0], input[1])
    input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var list = [Element]()

    for i in 0..<n {
        list.append(Element(no: i, impo: input[i]))
    }

    var count = 1
    while true {
        let temp = findMaxIndex(list: list)
        if temp != 0 {
            list.append(list.removeFirst())
        } else {
            let removed = list.removeFirst()
            if removed.no == m {
                print(count)
                break
            }
            count += 1
        }
    }
}

func findMaxIndex(list: [Element]) -> Int {
    var max = -1
    var index = 0
    for i in 0..<list.count {
        if max < list[i].impo {
            max = list[i].impo
            index = i
        }
    }
    return index
}

struct Element {
    let no: Int
    let impo: Int
}