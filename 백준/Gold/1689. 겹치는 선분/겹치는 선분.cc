
#include <iostream>
#include <queue>
#include <algorithm>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tii;

int n, s, e, ans;
vector<pair<int, int>> l;
priority_queue<int, vector<int>, greater<int>> q;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> s >> e,
        l.push_back({s, e});
    sort(l.begin(), l.end());

    for (auto [s, e]: l) {
        while (!q.empty() && q.top() <= s) q.pop();
        q.push(e);
        ans = max(ans, (int)q.size());
    }

    cout << ans;
}