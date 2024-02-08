def rotate(arr):
    length = len(arr)
    temp = [[0 for _ in range(length)] for _ in range(length)]

    for i in range(length):
        for j in range(length):
            temp[j][length - 1 - i] = arr[i][j]

    return temp

def solution(key, lock):
    n, m = len(key), len(lock)

    for _ in range(4):
        key = rotate(key)
        for a in range(m + n - 1):
            for b in range(m + n - 1):
                extended_lock = [[0 for _ in range(2 * n + m - 2)] for _ in range(2 * n + m - 2)]
                for i in range(m):
                    for j in range(m):
                        extended_lock[n - 1 + i][n - 1 + j] = lock[i][j]

                for i in range(n):
                    for j in range(n):
                        extended_lock[a + i][b + j] += key[i][j]

                temp = True
                for i in range(m):
                    for j in range(m):
                        if extended_lock[n - 1 + i][n - 1 + j] != 1:
                            temp = False

                if temp:
                    return True

    return False