let day = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let week = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (m, d) = (input[0], input[1])
var total_day = d

for i in 1..<m {
    total_day += day[i]
}

print(week[total_day%7])