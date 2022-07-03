import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, r, c) = (input[0], input[1], input[2])
let tp = twoPower(N)

func twoPower(_ n: Int) -> Int {
    Int(pow(2, Double(n)))
}

func recusion(_ N_r: Int, _ start: Int, _ y: Int, _ x: Int) {
    let devided = Int(pow(2, Double(N_r)*2)) / 4
    let tp_r = twoPower(N_r)
    if N_r == 0 {
        if y == r && x == c { print(start); exit(0) }
        return
    }
    if (0..<y+tp_r/2) ~= r && (0..<x+tp_r/2) ~= c {
        recusion(N_r-1, start, y, x); return
    }
    if (0..<y+tp_r/2) ~= r && x+tp_r/2 <= c {
        recusion(N_r-1, start + devided, y, x+tp_r/2); return
    }
    if y+tp_r/2 <= r && (0..<x+tp_r/2) ~= c {
        recusion(N_r-1, start+devided*2, y+tp_r/2, x); return
    }
    if y+tp_r/2 <= r && x+tp_r/2 <= c {
        recusion(N_r-1, start+devided*3, y+tp_r/2, x+tp_r/2); return
    }
}

recusion(N, 0, 0, 0)