#include <iostream>
#include <queue>
#include <tuple>
#include <algorithm>
#include <set>

using namespace std;
typedef long long int lli;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tii;

int T, n, m, t, s, g, h, a, b, d, x[101];

void dijkstra(int s, vector<int> &mindist, vector<pii> graph[]) {
    fill(mindist.begin(), mindist.end(), 99999999);
    priority_queue<pii, vector<pii>, greater<pii>> pq;
    pq.push({0, s});
    mindist[s] = 0;

    while (!pq.empty()) {
        auto [dist, cur] = pq.top(); pq.pop();
        if (dist > mindist[cur]) continue;
        for (auto [edge, next]: graph[cur]) {
            if (edge + dist >= mindist[next]) continue;
            mindist[next] = edge + dist;
            pq.push({mindist[next], next});
        }
    }
}

void solve() {
    cin >> n >> m >> t >> s >> g >> h;
    vector<pii> graph[n + 1];
    vector<int> mindist(n+1, 99999999);
    set<int> ans;

    for (int i = 1; i <= m; i++)
        cin >> a >> b >> d,
        graph[a].push_back({d, b}),
        graph[b].push_back({d, a});

    for (int i = 1; i <= t; i++)
        cin >> x[i];

    int StoX[t+1], GtoX[t+1], HtoX[t+1];

    dijkstra(s, mindist, graph);
    int StoG = mindist[g], StoH = mindist[h];
    for (int i = 1; i <= t; i++)
        StoX[i] = mindist[x[i]];

    dijkstra(g, mindist, graph);
    int GtoH = mindist[h];
    for (int i = 1; i <= t; i++)
        GtoX[i] = mindist[x[i]];

    dijkstra(h, mindist, graph);
    for (int i = 1; i <= t; i++)
        HtoX[i] = mindist[x[i]];

    for (int i = 1; i <= t; i++) {
        if (StoX[i] == StoG + GtoH + HtoX[i]) {
            ans.insert(x[i]);
            continue;
        }
        if (StoX[i] == StoH + GtoH + GtoX[i])
            ans.insert(x[i]);
    }

    for (int value: ans)
        cout << value << ' ';
    cout << '\n';
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> T;
    while (T--) solve();
}
