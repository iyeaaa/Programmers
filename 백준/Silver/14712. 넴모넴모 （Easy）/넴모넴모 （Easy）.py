import sys


def dfs(cnt):
    global answer
    if cnt == Y * X:
        answer += 1
        return
    y, x = cnt // X, cnt % X
    if (0 < y < Y and 0 < x < X) and (arr[y - 1][x] and arr[y][x - 1] and arr[y - 1][x - 1]):
        dfs(cnt + 1)
    else:
        arr[y][x] = 1
        dfs(cnt + 1)
        arr[y][x] = 0
        dfs(cnt + 1)


Y, X = map(int, sys.stdin.readline().split())
arr = [[0] * X for _ in range(Y)]
answer = 0
dfs(0)
print(answer)