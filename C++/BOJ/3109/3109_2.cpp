/**
* 메모리: 11812 KB, 시간: 72 ms
* 2022.08.17
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <cstring>

using namespace std;

int R, C;
char graph[10001][501];
bool visited[10001][501];
int dy[] = {-1, 0, 1};
int dx[] = {1, 1, 1};

bool isReach(int y, int x) {
    if (x == C-1) {
        return true;
    }

    for (int i = 0; i < 3; i++) {
        int ny = y+dy[i], nx = x+dx[i];

        if (ny < 0 || ny >= R || nx < 0 || nx >= C) continue;
        if (graph[ny][nx] == 'x') continue;
        if (visited[ny][nx]) continue;

        visited[ny][nx] = true;
        if (isReach(ny, nx)) return true;
    }

    return false;
}

void solve() {
    int pipeCnt = 0;
    for (int i = 0; i < R; i++)
        if (isReach(i, 0))
            pipeCnt++;
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
