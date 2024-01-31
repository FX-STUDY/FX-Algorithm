func findLeft(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int? {
    var start = start, end = end
    
    while start <= end {
        let mid = (start + end) / 2
        
        if arr[mid] == target {
            if mid == 0 || arr[mid - 1] != arr[mid] {
                return mid
            } else {
               end = mid - 1
            }
        } else if arr[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return nil
}

func findRight(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int? {
    var start = start, end = end
    
    while start <= end {
        let mid = (start + end) / 2
        
        if arr[mid] == target {
            if mid == arr.count - 1 || arr[mid + 1] != arr[mid] {
                return mid
            } else {
                start = mid + 1
            }
        } else if arr[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return nil
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], x = input[1]
let data = readLine()!.split(separator: " ").map { Int($0)! }
let (idx1, idx2) = (findLeft(data, x, 0, n - 1), findRight(data, x, 0, n - 1))

if let idx1 = idx1, let idx2 = idx2 {
    print(idx2 - idx1 + 1)
} else {
    print(-1)
}