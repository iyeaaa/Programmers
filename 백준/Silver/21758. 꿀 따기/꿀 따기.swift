let N = Int(readLine()!)!
let honey = readLine()!.split{$0==" "}.map{Int(String($0))!}
let sumHoney = crtSumHoney

print(max(leftHoneyMax, rytHoneyMax, midSumMax))

var crtSumHoney: [Int] {
    var result = [honey.first!]
    for i in 1..<N {
        result.append(result[i-1]+honey[i])
    }
    return result
}

var leftHoneyMax: Int {
    var maxValue = 0
    for i in 1..<N-1 {
        maxValue = max(maxValue, sumHoney[i-1]-honey[i])
    }
    return sumHoney[N-2] + maxValue
}

var rytHoneyMax: Int {
    var maxValue = 0
    for i in 1..<N-1 {
        maxValue = max(maxValue, sumHoney[N-1]-sumHoney[i]-honey[i])
    }
    return sumHoney[N-1]-sumHoney[0]+maxValue
}

var midSumMax: Int {
    var maxValue = 0
    for i in 1..<N-1 {
        maxValue = max(maxValue, sumHoney[i]-sumHoney[0]+sumHoney[N-2]-sumHoney[i-1])
    }
    return maxValue
}