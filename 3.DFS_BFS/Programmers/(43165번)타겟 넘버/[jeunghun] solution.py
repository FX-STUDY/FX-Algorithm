answer = 0

def solution(numbers, target):
    def dfs(n, idx, target, numbers):
        global answer

        if idx == len(numbers):
            if n == target:
                answer += 1
            return

        dfs(n - numbers[idx], idx + 1, target, numbers)
        dfs(n + numbers[idx], idx + 1, target, numbers)
    
    dfs(0, 0, target, numbers)
    
    return answer