let cities_count: Int = Int(readLine()!)!
let roads_length: Array<Int> = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let city_price: Array<Int> = readLine()!.split{$0 == " "}.map{Int(String($0))!}

var C_city = 0
var F_city = 1
var oilsum = roads_length[C_city]*city_price[C_city]

while true {
    while F_city != cities_count-1 && city_price[C_city] <= city_price[F_city] {
        oilsum += roads_length[F_city] * city_price[C_city]
        F_city += 1
    }

    if(F_city == cities_count-1) {
        break
    }

    C_city = F_city
    F_city += 1
    oilsum += roads_length[C_city]*city_price[C_city]
}

print(oilsum)