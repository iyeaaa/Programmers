
#include <iostream>
#include <queue>
#include <algorithm>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tii;

priority_queue<tii, vector<tii>, greater<tii>> pq;
int N, M, g[101][101], md[101][101], INF=99999;
int dy[] = {-1, 0, 1, 0}, dx[] = {0, -1, 0, 1};

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> M >> N;

    string ip;
    for (int i = 1; i <= N; i++) {
        cin >> ip;
        for (int j = 1; j <= M; j++)
            g[i][j] = ip[j - 1] - '0',
            md[i][j] = INF;
    }

    md[1][1] = 0;
    pq.push({0, 1, 1});

    while (!pq.empty()) {
        auto [dist, y, x] = pq.top(); pq.pop();
        if (dist > md[y][x]) continue;
        for (int i = 0; i < 4; i++) {
            int ny = y+dy[i], nx = x+dx[i];
            if (ny<1 || ny>N || nx<1 || nx>M) continue;
            if (dist + g[ny][nx] >= md[ny][nx]) continue;
            pq.push({dist + g[ny][nx], ny, nx});
            md[ny][nx] = dist + g[ny][nx];
        }
    }

    cout << md[N][M];
}