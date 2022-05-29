while let inp = readLine() {
    let input = Array(inp)
    if input == ["0"] {
        break
    }
    print(input == input.reversed() ? "yes" : "no")
}
