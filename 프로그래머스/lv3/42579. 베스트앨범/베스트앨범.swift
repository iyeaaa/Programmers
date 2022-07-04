import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genre_dict = [String: [Int]]()
    var genre_sum = [String: Int]()
    var result = [Int]()
    for i in 0..<genres.count {
        genre_dict[genres[i], default: []].append(i)
        genre_sum[genres[i], default: 0] += plays[i]
    }
    for k in genre_dict.keys {
        genre_dict[k]!.sort(by: {
            plays[$0] == plays[$1] ? $0 < $1 : plays[$0] > plays[$1]
        })
    }
    for k in genre_dict.keys.sorted(by: { genre_sum[$0]! > genre_sum[$1]! }) {
        result.append(genre_dict[k]![0])
        if genre_dict[k]!.count > 1 {
            result.append(genre_dict[k]![1])
        }
    }
    return result
}