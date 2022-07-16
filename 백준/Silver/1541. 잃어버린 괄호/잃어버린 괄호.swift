var list = readLine()!.split(separator: "-")
var answer: Int = 0

for i in 0..<list.count {
    let number: Array<Int> = list[i].split(separator: "+").map{Int(String($0))!}

    if i == 0 {
        for n in number {
           answer += n
        }
    }

    else {
        for n in number {
            answer -= n
        }
    }
}

print(answer)