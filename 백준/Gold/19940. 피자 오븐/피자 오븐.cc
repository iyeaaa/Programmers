#include <string>
#include <vector>
#include <iostream>
#include <tuple>
#include <queue>
using namespace std;
typedef pair<int, vector<int>> pi;

int N;
int dn[] = {-60, -10, 10, -1, 1};

vector<int> f(int x) {
    queue<pi> q;
    vector<int> v(120);

    q.push({x%60, {x/60, 0, 0, 0, 0}});
    v[x%60] = true;

    while (!q.empty()) {
        auto [cur, info] = q.front();
        q.pop();
        if (cur == 0) return info;
        for (int i=0; i<5; i++) {
            int nxt = cur+dn[i];
            if (nxt < 0 || nxt >= 120) continue;
            if (v[nxt]) continue;
            vector<int> temp = info;
            temp[i] += 1;
            q.push({nxt, temp});
            v[nxt] = true;
        }
    }
    return {};
}

int main() {
    int T; cin >> T;

    while (T--) {
        cin >> N;
        vector<int> ans = f(N);
        for (auto v: ans) cout << v << ' ';
        cout << '\n';
    }
}