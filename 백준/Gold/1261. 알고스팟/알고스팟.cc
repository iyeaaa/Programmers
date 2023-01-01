
#include <iostream>
#include <queue>
#include <algorithm>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tii;

priority_queue<tii, vector<tii>, greater<tii>> pq;
int N, M, g[101][101];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> M >> N;

    string ip;
    for (int i = 1; i <= N; i++) {
        cin >> ip;
        for (int j = 1; j <= M; j++)
            g[i][j] = ip[j - 1] - '0';
    }

    pq.push({0, 1, 1});

    while (!pq.empty()) {
        auto [dist, y, x] = pq.top(); pq.pop();
        if (y == N && x == M) {
            cout << dist; return 0; }
        for (int i = 0; i < 4; i++) {
            int ny = y+"2101"[i]-'1', nx = x+"1012"[i]-'1';
            if (ny<1 || ny>N || nx<1 || nx>M || g[ny][nx]=='!') continue;
            pq.push({dist + (g[ny][nx]==1), ny, nx});
            g[ny][nx] = '!';
        }
    }
}