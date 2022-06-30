import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var index = 0, queue = [(begin, 0)]
    var visit = Array(repeating: false, count: words.count)
    while index < queue.count {
        let cur = queue[index]
        if cur.0 == target { return cur.1; exit(0) }
        for i in 0..<words.count {
            if isPsb(cur.0, words[i]) && !visit[i] {
                visit[i] = true
                queue.append((words[i], cur.1+1))
            }
        }
        index += 1
    }
    return 0
}

func isPsb(_ a: String, _ b: String) -> Bool {
    let a = Array(a), b = Array(b)
    var count = 0
    for i in 0..<a.count {
        if a[i] != b[i] {
            count += 1
        }
    }
    return count <= 1
}