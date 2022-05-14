let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var stringToInt = [String:Int]()
var intToString = [Int:String]()

for i in 1...n {
    let input = readLine()!
    stringToInt[input] = i
    intToString[i] = input
}

for _ in 0..<m {
    let input = readLine()!
    let num = Int(input) ?? 0
    if num == 0 {
        print(stringToInt[input]!)
    } else {
        print(intToString[num]!)
    }
}