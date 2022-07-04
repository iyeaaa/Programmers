import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let report = Set(report)
    var report_ID = [String: [String]]()
    var rptedCount = [String: Int]()
    
    for r in report {
        let rpt = r.split{$0==" "}.map{String($0)}
        report_ID[rpt[0], default: []].append(rpt[1])
        rptedCount[rpt[1], default: 0] += 1
    }
    
    var result = [Int]()
    for i in id_list {
        var count = 0
        for r in (report_ID[i] ?? []) {
            if rptedCount[r]! >= k { count += 1 }
        }
        result.append(count)
    }
    
    return result
}