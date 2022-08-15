var CASE = 1
var result = ""
while let input = readLine() {
    if input == "0 0 0" { break }

    let inp = input.split(separator: " ").map{Int(String($0))!}
    let (L, P, V) = (inp[0], inp[1], inp[2])

    result += "Case \(CASE): \(V/P*L + (V%P > L ? L : V%P))\n"
    CASE += 1
}
print(result)