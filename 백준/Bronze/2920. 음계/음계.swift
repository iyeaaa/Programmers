let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
if temp == temp.sorted() {
    print("ascending")
} else if temp == temp.sorted(by: >) {
    print("descending")
} else {
    print("mixed")
}