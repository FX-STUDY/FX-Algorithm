let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)
dp[0] = 1

if n > 1 {
    dp[1] = 3
    
    for i in 2..<n {
        dp[i] = (dp[i - 1] + dp[i - 2] * 2) % 10007
    }
}

print(dp[n - 1])
