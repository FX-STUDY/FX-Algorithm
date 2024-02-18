n = int(input())
data = list(map(int, input().split()))
dp = [1] * n
max_value = 1

for i in range(n - 1, 0, -1):
    for j in range(i - 1, -1, -1):
        if data[i] < data[j]:
            dp[j] = max(dp[i] + 1, dp[j])

            if dp[j] > max_value:
                max_value = dp[j]

print(n - max_value)