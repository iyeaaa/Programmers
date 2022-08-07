let strn = Array(readLine()!)
var point = 0
var result = ""

var cur = [Character]()
while point < strn.count {
    if strn[point] == "<" {
        while strn[point] != ">" {
            cur.append(strn[point])
            point += 1
        }
        cur.append(">")
        result += String(cur)
        point += 1
        cur.removeAll()
    } else {
        while point < strn.count && strn[point] != "<" && strn[point] != " " {
            cur.append(strn[point])
            point += 1
        }
        result += String(cur.reversed())
        cur.removeAll()

        if point < strn.count && strn[point] == " " {
            result += " "
            point += 1
        }
    }
}

print(result)