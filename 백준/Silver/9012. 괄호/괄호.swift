for _ in 0..<Int(readLine()!)! {
    let vps = readLine()!
    var array = [Int]()

    for v in vps {
        if v == "(" {
            array.append(0)
        } else {
            if array.isEmpty {
                array.append(0)
                break
            }
            let _ = array.popLast()
        }
    }

    print(array.isEmpty ? "YES" : "NO")
}
