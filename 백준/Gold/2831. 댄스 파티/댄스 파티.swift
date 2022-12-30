
// N: 사람 수, M: 키순 남자 리스트, W: 키순 여자 리스트
// upM: 키 큰 여자 선호 남자 리스트, downM: 키 작은 여자 선호 남자 리스트
// upW: 키 큰 남자 선호 여자 리스트, downW: 키 작은 남자 선호 여자 리스트

let N = Int(readLine()!)!
let M = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted{abs($0)<abs($1)}
let W = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted{abs($0)<abs($1)}
var upM = [Int](), downM = [Int](), upW = [Int](), downW = [Int]()
var ans = 0

M.forEach{ $0 > 0 ? upM.append($0) : downM.append(-$0) }; upM.reverse()
W.forEach{ $0 > 0 ? upW.append($0) : downW.append(-$0) }; downW.reverse()

// 키가 큰 여자를 원하는 남자와 키가 작은 남자를 원하는 여자를 매칭시킨다.
// 키가 큰 남자, 키가 큰 여자부터 탐색한다.
var midx = 0, widx = 0
while midx < upM.count && widx < downW.count {
    if upM[midx] < downW[widx] { // 남자가 여자보다 키 작을 때(원하는경우)
        ans += 1; midx += 1; widx += 1 // 매칭시키고, 두 남자와 여자를 다음으로 넘긴다.
    } else { // 남자가 여자보다 크거나 같을 때
        // 남자는 어떤 여자와도 매칭될 수 없으므로 남자만 넘긴다
        midx += 1
    }
}

// 키가 작은 여자를 원하는 남자와 키가 큰 남자를 원하는 여자를 매칭시킨다.
// 키가 작은 남자, 키가 작은 여자부터 탐색한다.
midx = 0; widx = 0
while midx < downM.count && widx < upW.count {
    if downM[midx] > upW[widx] {
        ans += 1; midx += 1; widx += 1
    } else {
        midx += 1
    }
}

print(ans)