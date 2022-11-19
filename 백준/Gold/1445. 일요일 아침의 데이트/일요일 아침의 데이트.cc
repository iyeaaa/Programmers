
// T.C: O(M*N*4log(M*N))*N*M = O(N^2logN)*N^2 < 1e8

#include <iostream>
#include <algorithm>
#include <queue>
#include <tuple>
using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int, int> tii;
typedef tuple<ll, ll, ll> tll;
typedef vector<int> vi;

int dy[] = {1, 0, -1, 0}, dx[] = {0, -1, 0, 1};
const int INF = 99999999;
int n, m, g[51][51];
pii md[51][51];
string ipt;

bool isRange(int y, int x) {
    return y>=0 && y<n && x>=0 && x<m;
}

void dijkstra(int sy, int sx) {
    fill(&md[0][0], &md[50][51], make_pair(INF, INF));
    priority_queue<tii, vector<tii>, greater<tii>> q;

    q.push({0, 0, sy, sx});
    md[sy][sx] = {0, 0};

    while (!q.empty()) {
        auto [dist, cnt, y, x] = q.top(); q.pop();
        if (make_pair(dist, cnt) > md[y][x]) continue;
        for (int i = 0; i < 4; i++) {
            int ny = y+dy[i], nx = x+dx[i];
            if (!isRange(ny, nx)) continue;
            int nxt_dist = dist + (g[ny][nx] == 'g' ? 1 : 0);
            int nxt_cnt = cnt;
            if (g[ny][nx] == '.') {
                for (int j = 0; j < 4; j++) {
                    if (!isRange(ny+dy[j], nx+dx[j])) continue;
                    if (g[ny+dy[j]][nx+dx[j]] != 'g') continue;
                    nxt_cnt += 1; break;
                }
            }
            if (make_pair(nxt_dist, nxt_cnt) >= md[ny][nx]) continue;
            q.push({nxt_dist, nxt_cnt, ny, nx});
            md[ny][nx] = {nxt_dist, nxt_cnt};
        }
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int sy, sx, ey, ex;
    cin >> n >> m;

    for (int i = 0; i < n; i++) {
        cin >> ipt;
        for (int j = 0; j < m; j++) {
            g[i][j] = ipt[j];
            if (ipt[j] == 'S') sy=i, sx=j;
            else if (ipt[j] == 'F') ey=i, ex=j;
        }
    }

    dijkstra(sy, sx);
    cout << md[ey][ex].first << ' ' << md[ey][ex].second;
}