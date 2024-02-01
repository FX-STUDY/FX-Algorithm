let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input.first!, c = input.last!
let houses = (0..<n).map { _ in Int(readLine()!)! }.sorted(by: { $0 < $1})
var start = 1, end = houses.last!
var result = 0

while start <= end {
    let mid = (start + end) / 2
    var (cnt, pos) = (1, houses[0])
    
    for house in houses {
        if house - pos >= mid {
            cnt += 1
            pos = house
        }
    }
    
    if cnt >= c {
        start = mid + 1
        result = mid
    } else {
        end = mid - 1
    }
}

print(result)