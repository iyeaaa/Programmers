
// T.C: O(M*N*4log(M*N))*N*M = O(N^2logN)*N^2 < 1e8

#include <iostream>
#include <algorithm>
#include <queue>
#include <tuple>
using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int> tii;
typedef tuple<ll, ll, ll> tll;

int dy[] = {-1, 0, 1, 0}, dx[] = {0, -1, 0, 1};
const int INF = 99999999;
int n, m, t, d, g[26][26], md[26][26], ans;
string ipt;

void dijkstra(int sy, int sx) {
    fill(&md[0][0], &md[25][26], INF);
    priority_queue<tii, vector<tii>, greater<tii>> q;

    q.push({0, sy, sx});
    md[sy][sx] = 0;

    while (!q.empty()) {
        auto [dist, y, x] = q.top(); q.pop();
        if (dist > md[y][x]) continue;
        for (int i = 0; i < 4; i++) {
            int ny = y+dy[i], nx = x+dx[i];
            if (ny<0 || ny>=n || nx<0 || nx>=m) continue;
            if (abs(g[ny][nx] - g[y][x]) > t) continue;
            int edge = g[y][x] >= g[ny][nx] ? 1 : (g[ny][nx] - g[y][x]) * (g[ny][nx] - g[y][x]);
            if (dist+edge >= md[ny][nx]) continue;
            md[ny][nx] = dist + edge;
            q.push({md[ny][nx], ny, nx});
        }
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> n >> m >> t >> d;
    for (int i = 0; i < n; i++) {
        cin >> ipt;
        for (int j = 0; j < m; j++) {
            g[i][j] = ipt[j] - (isupper(ipt[j]) ? 'A' : 'a'-26);
        }
    }

    dijkstra(0, 0);
    int firstmd[26][26];

    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            firstmd[i][j] = md[i][j];

    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++) {
            dijkstra(i, j);
            if (firstmd[i][j] + md[0][0] <= d)
                ans = max(ans, g[i][j]);
        }

    cout << ans;
}