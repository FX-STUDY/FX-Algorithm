//못생긴 수란 오직 2, 3, 5만을 소인수로 가지는 수를 의미합니다.
//다시 말해 오직 2, 3, 5를 약수로 가지는 합성수를 의미합니다. 1은 무조건 못생긴 수라고 가정합니다.
//따라서 못생긴 수들은 {1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, ...} 순으로 이어지게 됩니다.
// 이때 n번째 못생긴 수를 찾는 프로그램을 작성하세요. 예를 들어 11번째 못생긴 수는 15입니다.

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n)
dp[0] = 1

var idx1 = 0, idx2 = 0, idx3 = 0
var ugly1 = 2, ugly2 = 3, ugly3 = 5

for i in 1..<n {
    dp[i] = min(ugly1, ugly2, ugly3)
    
    if dp[i] == ugly1 {
        idx1 += 1
        ugly1 = dp[idx1] * 2
    }
    
    if dp[i] == ugly2 {
        idx2 += 1
        ugly2 = dp[idx2] * 3
    }
    
    if dp[i] == ugly3 {
        idx3 += 1
        ugly3 = dp[idx3] * 5
    }
}

print(dp[n - 1])