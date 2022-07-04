import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var report_ID = [String: [String]]()
    var rptedCount = [String: Int]()

    for r in Set(report) {
        let rpt = r.split{$0==" "}.map{String($0)}
        report_ID[rpt[0], default: []].append(rpt[1])
        rptedCount[rpt[1], default: 0] += 1
    }

    return id_list.map {
        report_ID[$0, default: []].reduce(0) {
            $0 + (rptedCount[$1, default: 0] >= k ? 1 : 0)
        }
    }
}