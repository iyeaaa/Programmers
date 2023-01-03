import sys


def init():
    ipt = sys.stdin.readline
    n, m = map(int, ipt().split())
    edge_list = []
    for _ in range(m):
        a, b, c = map(int, ipt().split())
        edge_list.append((a, b, c))
    return n, edge_list


def bellman_ford():
    dist_list = [float('inf') for _ in range(n+1)]
    dist_list[1] = 0
    for _ in range(n-1):
        for s, e, w in edge_list:
            dist_list[e] = min(dist_list[e], dist_list[s] + w)
    return dist_list


def cycle():
    for s, e, w in edge_list:
        if dist_list[e] > dist_list[s] + w:
            return True
    return False


n, edge_list = init()
dist_list = bellman_ford()
if cycle():
    print(-1)
else:
    for i in range(2, n+1):
        print(dist_list[i] if dist_list[i]!=float('inf') else -1)