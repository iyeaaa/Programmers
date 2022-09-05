/**
* 메모리: 2024 KB, 시간: 24 ms
* 2022.09.05
* by Alub
*/
#include <iostream>
#include <queue>
using namespace std;

int N;
int dy[] = {-1, 0, 1, 0};
int dx[] = {0, -1, 0, 1};
char G[51][51];

int findMax() {
    int maxValue = -1;
    for (int i = 0; i < N; i++) {
        int rCnt = 1;
        int cCnt = 1;
        for (int j = 0; j < N; j++) {
            if (G[i][j-1] == G[i][j]) {
                rCnt++;
            } else {
                maxValue = max(maxValue, rCnt);
                rCnt = 1;
            }
            if (G[j-1][i] == G[j][i]) {
                cCnt++;
            } else {
                maxValue = max(maxValue, cCnt);
                cCnt = 1;
            }
        }
        maxValue = max(max(maxValue, rCnt), cCnt);
    }
    return maxValue;
}

int isRange(int y, int x) {
    return y >= 0 && y < N && x >= 0 && x < N;
}

void solve() {
    int answer = findMax();
    for (int y = 0; y < N; y++) {
        for (int x = 0; x < N; x++) {
            for (int d = 0; d < 4; d++) {
                int ny = y + dy[d], nx = x + dx[d];
                if (!isRange(ny, nx)) continue;
                if (G[y][x] == G[ny][nx]) continue;
                swap(G[y][x], G[ny][nx]);
                answer = max(answer, findMax());
                swap(G[y][x], G[ny][nx]);
            }
        }
    }
    cout << answer;
}

void input() {
    cin >> N;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            cin >> G[i][j];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}