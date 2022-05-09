for i in 0...2 {
    printResult(readLine()!.split{$0==" "}
            .map{Int(String($0))!}.reduce(0, +))
}


func printResult(_ n: Int) {
    if n == 3 {
        print("A")
    } else if n == 2 {
        print("B")
    } else if n == 1 {
        print("C")
    } else if n == 0 {
        print("D")
    } else {
        print("E")
    }
}