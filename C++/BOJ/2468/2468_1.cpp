/**
* 메모리: 2272 KB, 시간: 20 ms
* 2022.09.01
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <cstring>
using namespace std;

int N, graph[101][101], lim, visited[101][101];
int dy[] = {-1, 0, 1, 0};
int dx[] = {0, -1, 0, 1};

void dfs(int y, int x) {
    if (y < 0 || y >= N || x < 0 || x >= N)
        return;

    if (graph[y][x] <= lim)
        return;

    if (visited[y][x])
        return;

    visited[y][x] = true;
    for (int i = 0; i < 4; i++)
        dfs(y+dy[i], x+dx[i]);
}

void solve() {
    int answer = 1;
    for (lim = 1; lim <= 100; lim++) {
        int cnt = 0;
        for (int i = 0; i < N; i++)
            for (int j = 0; j < N; j++)  {
                if (visited[i][j] || graph[i][j] <= lim)
                    continue;
                dfs(i, j);
                cnt++;
            }
        answer = max(answer, cnt);
        memset(visited, false, sizeof(visited));
    }
    cout << answer;
}

void input() {
    cin >> N;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            cin >> graph[i][j];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
