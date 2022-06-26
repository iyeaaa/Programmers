var strn = Array(readLine()!).map{String($0)}
var pairs = crtPairArray(strn); let nmbrPairs = pairs.count
var result = Set<String>()

dfs(strn, 0)
result.sorted().forEach{ print($0) }

func dfs(_ strn: [String], _ digit: Int) {
    if digit == nmbrPairs { return }
    let strn1 = convertWhiteSpace(strn, pairs[digit])
    let strn2 = removalWhiteSpaceToString(strn1)
    result.insert(strn2)
    dfs(strn1, digit+1)
    dfs(strn, digit+1)
}

func crtPairArray(_ strn: [String]) -> [(Int, Int)] {
    var result = [(Int, Int)]()
    var stack = [Int]()
    for i in 0..<strn.count {
        if strn[i] == "(" { stack.append(i) }
        else if strn[i] == ")" { result.append((stack.popLast()!, i)) }
    }
    return result
}
func removalWhiteSpaceToString(_ strn: [String]) -> String {
    strn.filter{ $0 != " " }.joined()
}
func convertWhiteSpace(_ strn: [String], _ pairIndex: (Int, Int)) -> [String] {
    var strn = strn
    let (left, right) = pairIndex
    strn[left] = " "; strn[right] = " "
    return strn
}