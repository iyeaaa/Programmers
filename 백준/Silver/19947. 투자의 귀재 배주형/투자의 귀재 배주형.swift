import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (h, y) = (input[0], input[1])
var result = 0
dfs(year: 0, money: h)
print(result)

func dfs(year: Int, money: Int) {
    if year > y {
        return
    } else if year == y {
        result = max(result, money)
        return
    } else {
        dfs(year: year+1, money: money*105/100)
        dfs(year: year+3, money: money*120/100)
        dfs(year: year+5, money: money*135/100)
    }
}

// wapas님 많이 배우고갑니다.