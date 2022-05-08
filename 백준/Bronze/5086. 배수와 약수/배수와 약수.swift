import Foundation

while true {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m) = (input[0], input[1])
    if n == 0 && m == 0 {
        break
    }

    if n > m {
        if n % m == 0 {
            print("multiple")
        } else {
            print("neither")
        }
    } else {
        if m % n == 0 {
            print("factor")
        } else {
            print("neither")
        }
    }
}
