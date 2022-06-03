let pro = (readLine()!).split(separator: " ").map{ Int($0)!} //테스트

func bag(_ n: [Int]){
    
    
    let (num, maxW) = (n[0] , n[1])
    
    
    var value = [0]
    var weight = [0]
    for _ in 0..<num{
        let second = (readLine()!).split(separator: " ").map{ Int($0)!}
        let (w,v) = (second[0],second[1])
        weight.append(w)
        value.append(v)
    }
    var dp =  Array(repeating: 0, count: maxW+1)

    for i in 1...num {
        for j in stride(from: maxW, to: 0, by: -1) {
            if j >= weight[i] {
                dp[j] = max(dp[j], dp[j-weight[i]] + value[i])
            }
        }
    }
    print(dp[maxW])
}
bag(pro)