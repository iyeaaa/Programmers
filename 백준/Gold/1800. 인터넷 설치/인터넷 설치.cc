
#include <iostream>
#include <queue>
#include <algorithm>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tii;


int N, P, K, INF = 999999999;
vector<pii> g[1001];

bool f(int x) {
    priority_queue<pii, vector<pii>, greater<pii>> q;
    int md[1001]; fill(md,md+1001,INF);

    q.push({0, 1});
    md[0] = 0;

    while (!q.empty()) {
        auto [dist, cur] = q.top(); q.pop();
        if (dist > md[cur]) continue;
        for (auto [cost, nxt]: g[cur]) {
            if (dist + (cost > x) >= md[nxt]) continue;
            q.push({dist + (cost > x), nxt});
            md[nxt] = dist + (cost > x);
        }
    }

    return md[N] <= K;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N >> P >> K;

    int a, b, c;
    for (int i = 0; i < P; i++)
        cin >> a >> b >> c,
        g[a].push_back({c, b}),
        g[b].push_back({c, a});

    int lo = -1, hi = 1000001;
    while (lo + 1 < hi) {
        int mid = (lo + hi) >> 1;
        if (f(mid)) hi = mid;
        else lo = mid;
    }

    cout << (hi == 1000001 ? -1 : hi);
}