/**
* 메모리: 2056 KB, 시간: 12 ms
* 2022.09.06
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>
using namespace std;
typedef pair<int, int> pii;

int N, M, EMPTY_CNT, G[51][51], V[51][51], C[51][51], ans;
int dy[] = {-1, 0, 1, 0};
int dx[] = {0, -1, 0, 1};
vector<pii> virus, start;

int isRange(int y, int x) {
    return 0 <= y && y < N && 0 <= x && x < N;
}

void bfs() {
    fill(&V[0][0], &V[50][51], 0);
    fill(&C[0][0], &C[50][51], 0);
    queue<pii> q;
    int INFECT_CNT = 0, time = 0;
    for (auto [y, x]: start) {
        q.push({y, x});
        V[y][x] = true;
    }
    while (!q.empty()) {
        auto [y, x] = q.front();
        q.pop();
        for (int i = 0; i < 4; i++) {
            int ny = y+dy[i], nx = x+dx[i];
            if (!isRange(ny, nx)) continue;
            if (V[ny][nx] || G[ny][nx] == 1) continue;

            V[ny][nx] = true;
            C[ny][nx] = C[y][x] + 1;
            if (G[ny][nx] == 0) {
                INFECT_CNT++;
                time = C[ny][nx];
            }
            q.push({ny, nx});
        }
    }
    if (INFECT_CNT == EMPTY_CNT)
        ans = min(ans, time);
}

void dfs(int cnt, int idx) {
    if (cnt == M) {
        bfs();
        return;
    }
    for (int i = idx; i < virus.size(); i++) {
        start.push_back(virus[i]);
        dfs(cnt+1, i+1);
        start.pop_back();
    }
}

void solve() {
    dfs(0, 0);
    cout << (ans != 99999999 ? ans : -1);
}

void input() {
    cin >> N >> M;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++) {
            cin >> G[i][j];
            if (G[i][j] == 2)
                virus.push_back({i, j});
            else if (G[i][j] == 0)
                EMPTY_CNT++;
        }
    ans = 99999999;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}