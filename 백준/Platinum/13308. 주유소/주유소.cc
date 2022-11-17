

#include <iostream>
#include <cstring>
#include <algorithm>
#include <queue>
#include <tuple>
#include <stdlib.h>
using namespace std;
typedef long long int ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int> tiii;
typedef tuple<ll, ll, ll> tlll;

const ll INF = 999999999999999;
priority_queue<tlll, vector<tlll>, greater<tlll>> q;
ll n, m, price[2501], a, b, c, md[2501][2501];
vector<pii> g[2501];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> n >> m;
    for (int i=1;i<=n;i++) cin >> price[i];

    fill(&md[0][0], &md[2500][2501], INF);
    for (int i=0;i<m;i++)
        cin >> a >> b >> c,
        g[a].push_back({c, b}),
        g[b].push_back({c, a});
    md[1][price[1]] = 0; q.push({0, price[1], 1});

    while (!q.empty()) {
        auto [dist, oilPrice, cur] = q.top(); q.pop();
        if (dist > md[cur][oilPrice]) continue;
        for (auto [edge, next]: g[cur]) {
            if (dist + oilPrice * edge >= md[next][oilPrice]) continue;
            md[next][oilPrice] = dist + oilPrice * edge;
            q.push({md[next][oilPrice], min(oilPrice, price[next]), next});
        }
    }

    cout << *min_element(md[n], md[n]+2501);
}