let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let trees = readLine()!.split(separator: " ").map { Int($0)! }
var start = 0, end = trees.max()!, result = 0

while start <= end {
    let mid = (start + end) / 2
    let total = trees.reduce(0) {
        if $1 > mid {
            return $0 + ($1 - mid)
        }
        
        return $0
    }
    
    if total < m {
        end = mid - 1
    } else {
        result = mid
        start = mid + 1
    }
}

print(result)