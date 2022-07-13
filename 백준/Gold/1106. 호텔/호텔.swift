typealias City = (cost: Int, ctmr: Int);
let INF = 1000*100+1
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (C, N) = (input[0], input[1])
let totalC = C + 100
var cities = crtCities()
var dp = [Int](repeating: INF, count: totalC+1); dp[0] = 0

for i in 0..<N {
    for j in stride(from: cities[i].ctmr, through: totalC, by: 1) {
        dp[j] = min(dp[j], dp[j-cities[i].ctmr] + cities[i].cost)
    }
}

print(dp[C...totalC].min()!)

func crtCities() -> [City] {
    var result = [City]()
    for _ in 0..<N {
        let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
        result.append(City(cost: input[0], ctmr: input[1]))
    }
    return result
}
