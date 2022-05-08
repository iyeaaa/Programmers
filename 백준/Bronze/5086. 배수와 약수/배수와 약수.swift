import Foundation

while true {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m) = (input[0], input[1])
    if n == 0 && m == 0 {
        break
    }

    if n > m {
        print(isMultiple(n, m))
    } else {
        print(isFactor(n, m))
    }
}


func isFactor(_ min: Int, _ max: Int) -> String {
    if max % min == 0 {
        return "factor"
    }
    return "neither"
}

func isMultiple(_ max: Int, _ min: Int) -> String {
    if max % min == 0 {
        return "multiple"
    }
    return "neither"
}