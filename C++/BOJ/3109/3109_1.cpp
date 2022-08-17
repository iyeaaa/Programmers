/**
* 메모리: 11812 KB, 시간: 68 ms
* 2022.08.17
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <cstring>

using namespace std;

int R, C;
int isReach;
char graph[10001][501];
bool visited[10001][501];
int dy[] = {-1, 0, 1};
int dx[] = {1, 1, 1};

void dfs(int y, int x) {
    if (x == C-1) {
        isReach = true;
        return;
    }

    for (int i = 0; i < 3; i++) {
        int ny = y+dy[i], nx = x+dx[i];

        if (ny < 0 || ny >= R || nx < 0 || nx >= C) continue;
        if (graph[ny][nx] == 'x') continue;
        if (visited[ny][nx]) continue;

        visited[ny][nx] = true;
        dfs(ny, nx);
        if (isReach) return;
    }
}

void solve() {
    int pipeCnt = 0;
    for (int i = 0; i < R; i++) {
        isReach = false;
        dfs(i, 0);
        if (isReach)
            pipeCnt++;
    }
    cout << pipeCnt << endl;
}

void input() {
    cin >> R >> C;
    for (int i = 0; i < R; i++) {
        string x; cin >> x;
        for (int j = 0; j < C; j++) {
            graph[i][j] = x[j];
        }
    }
    memset(visited, false, sizeof(visited));
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input();
    solve();
}
