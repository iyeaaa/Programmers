import Foundation

func solve() {
    let n = Int(readLine()!)!
    let dict = crtElement(n)
    let indexList = dict.keys.sorted()
    var stack = [Int]()
    for i in indexList {
        if dict[i]!.0 == -1 {
            stack.append(dict[i]!.1)
            continue
        }
        if dict[i]!.0 == 1 {
            if let s = stack.popLast() {
                if s != dict[i]!.1 { print("NO"); exit(0) }
            } else {
                print("NO"); exit(0)
            }
        }
    }
    print("YES")
}

func crtElement(_ n: Int) -> [Int: (Int, Int)] {
    var dict = [Int: (Int, Int)]()
    for i in 0..<n {
        let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
        if let _ = dict[input[0]-input[1]] {
            print("NO"); exit(0)
        } else {
            dict[input[0]-input[1]] = (-1, i)
        }
        if let _ = dict[input[0]+input[1]] {
            print("NO"); exit(0)
        } else {
            dict[input[0]+input[1]] = (1, i)
        }
    }
    return dict
}

solve()