for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var friend = [String:String]()
    var size = [String:Int]()

    for _ in 0..<n {
        let input = readLine()!.split{$0==" "}.map{String($0)}
        if let _ = friend[input[0]] {}
        else { friend[input[0]] = input[0] }
        if let _ = friend[input[1]] {}
        else { friend[input[1]] = input[1] }
        if let _ = size[input[0]] {}
        else { size[input[0]] = 1 }
        if let _ = size[input[1]] {}
        else { size[input[1]] = 1 }
        merge(input[0], with: input[1])
        print(size[root(of: input[0])]!)
    }

    func root(of x: String) -> String {
        if x == friend[x]! { return x }
        friend[x] = root(of: friend[x]!)
        return friend[x]!
    }
    func merge(_ x: String, with y: String) {
        let (x, y) = (root(of: x), root(of: y))
        if x == y { return }
        friend[x] = friend[y]!
        size[y]! += size[x]!
    }
}

