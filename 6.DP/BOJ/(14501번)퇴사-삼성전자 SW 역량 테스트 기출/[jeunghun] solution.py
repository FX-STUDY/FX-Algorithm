n = int(input())
dp = [0] * (n + 1)
t, p = [], []
max_value = 0

for _ in range(n):
    ti, pi = map(int, input().split())

    t.append(ti)
    p.append(pi)

for i in range(n - 1, -1, -1):
    time = i + t[i]

    if time <= n:
        dp[i] = max(p[i] + dp[time], max_value)
        max_value = dp[i]
    else:
        dp[i] = max_value

print(max_value)