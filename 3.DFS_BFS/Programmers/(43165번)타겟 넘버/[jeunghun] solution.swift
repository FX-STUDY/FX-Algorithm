import Foundation

func solution(_ numbers: [Int], _ target:Int) -> Int {
    var answer = 0
    
    func dfs(_ result: Int, idx: Int) {
        if idx == numbers.count {
            if result == target {
                answer += 1
            }
            
            return
        }
        
        dfs(result + numbers[idx], idx: idx + 1)
        dfs(result - numbers[idx], idx: idx + 1)
    }
    
    dfs(0, idx: 0)
    
    return answer
}